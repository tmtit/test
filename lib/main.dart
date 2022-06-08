import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:minhtu/bindings/auth/login_binding.dart';
import 'package:minhtu/controller/auth/animation_login_controller.dart';
import 'package:minhtu/controller/auth/auth_controller.dart';
import 'package:minhtu/routes/pages.dart';
import 'package:minhtu/routes/routes.dart';
import 'package:minhtu/setting/theme.dart';
import 'package:minhtu/translations/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));

  await GetStorage.init();
  Get.put<AuthController>(AuthController());
  runApp(MyApp());
  Get.put<AnimationLoginController>(AnimationLoginController());
}

class MyApp extends StatelessWidget {
  final AuthController _controller = Get.find();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: _controller.isLogin ? Routes.INITIAL : Routes.LOGIN_PAGE,
      initialBinding: LoginBinding(),
      theme: ThemeDataSetting.lightTheme,
      defaultTransition: Transition.fade,
      getPages: Pages.pages,
      locale: const Locale('vi', 'VN'),
      translationsKeys: Translation.translations,
    );
  }
}
