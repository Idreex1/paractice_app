import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paractice_app1/View/home/home_screen.dart';
import 'package:paractice_app1/helper/Widgets/widgets_screen.dart';


import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('select_language'.tr , style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
            onPressed: () async {
            
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String? languageCode = prefs.getString('language');
              if (languageCode != null) {
                Get.updateLocale(Locale(languageCode));
              }
             
             Get.to(()=>HomeScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff88FFFF),
            ),
            child: Text(
              'apply'.tr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            buildLanguageTile('English', 'en'),
buildLanguageTile('Urdu (اردو)', 'ur'),
buildLanguageTile('Afrikaans', 'af'),
buildLanguageTile('Arabic (عربي)', 'ar'),
buildLanguageTile('Chinese (Simplified)', 'zh'),
buildLanguageTile('Chinese (Traditional)', 'zh_Hant'),
buildLanguageTile('Czech (Čeština)', 'cs'),
buildLanguageTile('Danish (Dansk)', 'da'),
buildLanguageTile('Dutch (Nederlands)', 'nl'),
buildLanguageTile('Finnish (Suomi)', 'fi'),
    ],
        ),
      ),
    );
  }
}

