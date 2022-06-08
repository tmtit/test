// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tagon/controller/record/record_controller.dart';
// import 'package:tagon/controller/time/time_controller.dart';
// import 'package:tagon/utils/colors.dart';
// import 'package:tagon/widgets/time.dart';
//
// class RecordPage extends GetWidget<RecordController> {
//   RecordPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_outlined,
//               color: Color(0xFF015C8F),
//             )),
//         title: const Text(
//           "Record",
//           style: TextStyle(
//               fontSize: 16, color: Color(0xFF202832), fontFamily: "Roboto"),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             GetBuilder(
//                 builder: (RecordController controller) =>
//                     Text(controller.recorderTxt)),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                     onTap: controller.onPauseResumeRecorderPressed,
//                     child: const Icon(Icons.play_arrow_rounded,),),
//                 const SizedBox(
//                   width: 40,
//                 ),
//                 GestureDetector(
//                   onTap: controller.onStartRecorderPressed,
//                   child: Container(
//                     width: 56,
//                     height: 56,
//                     decoration: BoxDecoration(
//                       color: const Color(0xffE6EFF4),
//                       borderRadius: BorderRadius.circular(28),
//                       border: Border.all(
//                         color: ColorUtils.primary,
//                         width: 6,
//                         style: BorderStyle.solid,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 40,
//                 ),
//                 GestureDetector(onTap: controller.stopRecorder,child: const Icon(Icons.stop_rounded)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
