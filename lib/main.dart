import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paractice_app1/Model/View/hive_model.dart';
import 'package:paractice_app1/View/Hive/hive_view.dart';
import 'package:paractice_app1/View/home/home_screen.dart';
import 'package:paractice_app1/View/localization/localization_screen.dart';
import 'package:paractice_app1/View/splash/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'helper/localization/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString('language') ?? 'en';
  var directory = await getApplicationDocumentsDirectory();

Hive.init(directory.path);
Hive.registerAdapter(HiveModelAdapter()); 
 await Hive.openBox<HiveModel>('notes');


  runApp(MyApp(locale: Locale(languageCode)));
}

class MyApp extends StatelessWidget {
  final Locale locale;

  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MultiLanguage',
      textDirection: TextDirection.ltr,
      translations: Languages(),
      locale: locale,
      fallbackLocale: const Locale('en'),
      theme: ThemeData.dark(),
      home: Animationpage(),
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/language', page: () => LanguageScreen()),
        GetPage(name: '/hive', page: () => HiveScreen()),
      ],
    );
  }
}
