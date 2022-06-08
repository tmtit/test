// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:tagon/helper/permission_helper.dart';
//
// enum Media {
//   ///
//   file,
//
//   ///
//   buffer,
//
//   ///
//   asset,
//
//   ///
//   stream,
//
//   ///
//   remoteExampleFile,
// }
//
// class RecordController extends GetxController {
//   ///
//   int tSAMPLERATE = 8000;
//
//   /// Sample rate used for Streams
//   int tSTREAMSAMPLERATE = 44000; // 44100 does not work for recorder on iOS
//
//   ///
//   int tBLOCKSIZE = 4096;
//
//   String? _path;
//   bool _isRecording = false;
//   FlutterSoundRecorder recorderModule = FlutterSoundRecorder();
//   String recorderTxt = '00:00:00';
//   int millisecond = 0;
//   double sliderCurrentPosition = 0.0;
//   double maxDuration = 1.0;
//   Media? _media = Media.remoteExampleFile;
//   Codec _codec = Codec.aacADTS;
//   Timer? _timer;
//   bool? _encoderSupported = true; // Optimist
//   bool _decoderSupported = true; // Optimist
//   double? _dbLevel;
//
//   StreamSubscription? _recorderSubscription;
//   StreamSubscription? _recordingDataSubscription;
//
//   StreamController<Food>? recordingDataController;
//   IOSink? sink;
//
//   @override
//   void dispose() {
//     super.dispose();
//     cancelRecorderSubscriptions();
//     cancelRecordingDataSubscription();
//     releaseFlauto();
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     init();
//   }
//
//   Future<void> init() async {
//     await openTheRecorder();
//     await _initializeExample();
//   }
//
//   Future<void> releaseFlauto() async {
//     try {
//       await recorderModule.closeRecorder();
//     } on Exception {
//       recorderModule.logger.e('Released unsuccessful');
//     }
//   }
//
//   Future<void> _initializeExample() async {
//     await recorderModule.setSubscriptionDuration(Duration(milliseconds: 10));
//
//     await setCodec(_codec);
//   }
//
//   Future<void> setCodec(Codec codec) async {
//     _encoderSupported = await recorderModule.isEncoderSupported(codec);
//
//     _codec = codec;
//     update();
//   }
//
//   Future<void> openTheRecorder() async {
//     await PermissionHelper.requestPermission(
//         onGranted: () async {
//           await recorderModule.openRecorder();
//         },
//         permission: Permission.microphone);
//   }
//
//   void startRecorder() async {
//     try {
//       await PermissionHelper.requestPermission(
//           onGranted: () async {
//             _timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
//               if (recorderModule.isRecording) {
//                 millisecond = millisecond + 10;
//                 var date = DateTime.fromMillisecondsSinceEpoch(millisecond,
//                     isUtc: true);
//                 var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
//                 recorderTxt = txt.substring(0, 8);
//                 update();
//               }
//             });
//             var path = '';
//             var tempDir = await getExternalStorageDirectory();
//             path = '${tempDir!.path}/flutter_sound${ext[_codec.index]}';
//
//             if (_media == Media.stream) {
//               assert(_codec == Codec.pcm16);
//               if (!kIsWeb) {
//                 var outputFile = File(path);
//                 if (outputFile.existsSync()) {
//                   await outputFile.delete();
//                 }
//                 sink = outputFile.openWrite();
//               } else {
//                 sink = null; // TODO
//               }
//               recordingDataController = StreamController<Food>();
//               _recordingDataSubscription =
//                   recordingDataController!.stream.listen((buffer) {
//                 if (buffer is FoodData) {
//                   sink!.add(buffer.data!);
//                 }
//               });
//               await recorderModule.startRecorder(
//                 toStream: recordingDataController!.sink,
//                 codec: _codec,
//                 numChannels: 1,
//                 sampleRate: tSTREAMSAMPLERATE, //tSAMPLERATE,
//               );
//             } else {
//               await recorderModule.startRecorder(
//                 toFile: path,
//                 codec: _codec,
//                 bitRate: 8000,
//                 numChannels: 1,
//                 sampleRate:
//                     (_codec == Codec.pcm16) ? tSTREAMSAMPLERATE : tSAMPLERATE,
//               );
//             }
//             recorderModule.logger.d('startRecorder');
//
//             _recorderSubscription = recorderModule.onProgress!.listen((e) {
//               var date = DateTime.fromMillisecondsSinceEpoch(
//                   e.duration.inMilliseconds,
//                   isUtc: true);
//               var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
//               // recorderTxt = e.duration.toString();
//               _dbLevel = e.decibels;
//               // update();
//             });
//
//             _isRecording = true;
//             _path = path;
//             update();
//           },
//           permission: Permission.microphone);
//     } on Exception catch (err) {
//       recorderModule.logger.e('startRecorder error: $err');
//
//       stopRecorder();
//       _isRecording = false;
//
//       cancelRecordingDataSubscription();
//       cancelRecorderSubscriptions();
//       update();
//     }
//   }
//
//   void stopRecorder() async {
//     try {
//       await recorderModule.stopRecorder();
//       recorderModule.logger.d('stopRecorder');
//       cancelRecorderSubscriptions();
//       cancelRecordingDataSubscription();
//       _timer!.cancel();
//       millisecond = 0;
//       recorderTxt = '00:00:00';
//       update();
//     } on Exception catch (err) {
//       recorderModule.logger.d('stopRecorder error: $err');
//     }
//
//     _isRecording = false;
//     update();
//   }
//
//   void pauseResumeRecorder() async {
//     try {
//       if (recorderModule.isPaused) {
//         await recorderModule.resumeRecorder();
//       } else {
//         await recorderModule.pauseRecorder();
//         assert(recorderModule.isPaused);
//       }
//     } on Exception catch (err) {
//       recorderModule.logger.e('error: $err');
//     }
//     update();
//   }
//
//   Future<bool> fileExists(String path) async {
//     return await File(path).exists();
//   }
//
//   void cancelRecorderSubscriptions() {
//     if (_recorderSubscription != null) {
//       _recorderSubscription!.cancel();
//       _recorderSubscription = null;
//     }
//   }
//
//   void cancelRecordingDataSubscription() {
//     if (_recordingDataSubscription != null) {
//       _recordingDataSubscription!.cancel();
//       _recordingDataSubscription = null;
//     }
//     recordingDataController = null;
//     if (sink != null) {
//       sink!.close();
//       sink = null;
//     }
//   }
//
//   void onPauseResumeRecorderPressed() {
//     if (recorderModule.isPaused || recorderModule.isRecording) {
//       pauseResumeRecorder();
//     }
//   }
//
//   void startStopRecorder() {
//     if (recorderModule.isRecording || recorderModule.isPaused) {
//       stopRecorder();
//     } else {
//       startRecorder();
//     }
//   }
//
//   void onStartRecorderPressed() {
//     // Disable the button if the selected codec is not supported
//     if (!_encoderSupported!) return;
//     if (_media == Media.stream && _codec != Codec.pcm16) return;
//     startStopRecorder();
//   }
// }
