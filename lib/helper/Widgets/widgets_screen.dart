

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:paractice_app1/ViewModel/feedbackfunction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



// Language Container
Widget buildLanguageTile(String languageName, String languageCode) {
  final isSelected = Get.locale?.languageCode == languageCode;

  return GestureDetector(
    onTap: () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', languageCode);
      Get.updateLocale(Locale(languageCode));
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 60,
      decoration: BoxDecoration(
        color: isSelected
            ? Color.fromARGB(221, 223, 214, 214)
            : Color(0xff556984),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              languageName,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
              
                border: Border.all(color: Colors.white),
                color: isSelected ? Colors.green : Colors.white,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 22, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    ),
  );
}

// Feeed Back Option Container 

  Widget buildFeedbackOption(int index, String text) {
   
     FeedbackController controller = Get.put(FeedbackController());
   
    return  GestureDetector(
        onTap: () {
        controller.toggleSelection(index);
        
        },
        child: Container(
          height: 50,
          width: 140,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 59, 57, 57),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Obx(()=> Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(4),
                      color: controller.isSelected[index]
                      ? Colors.green
                      : Colors.white,
                      
                      border: Border.all(
                        color: controller.isSelected[index] 
                            ? Colors.white
                            : Colors.white,
                      ),
                    ),
                    child: controller.isSelected[index]
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  Widget buildListTile({
    required IconData icon,
    required String title,
    required String route,

    

    }){
      return ListTile(
        leading: Icon(icon , color: Colors.white,),
        title: Text(
          title,
          style: TextStyle(
           color: Colors.white, fontWeight: FontWeight.bold 
          ),
        ),
        onTap: () {
          Get.toNamed(route);
        },

      );
    }

    // Dialog Show
    Widget DialogShowWidget(BuildContext context) {
      return IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              width: 350,
                              height: 165,
                              decoration: BoxDecoration(
                                  color: Color(0xff3386A6),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Are You Sure?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Unsaved changes will be lost forever',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Color(0xff88BFD4),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Center(
                                            child: Text(
                                              'Discard',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Center(
                                            child: Text(
                                              'Stay',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),);
    }






