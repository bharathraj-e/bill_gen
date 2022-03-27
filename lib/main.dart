import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/themes/app_theme.dart';
import 'pages/splash/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Invoice',
      theme: AppTheme(context).light,
      themeMode: ThemeMode.light,

      /// toast observer
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      // * routing....
      home: const SplashPage(),
    );
  }
}
