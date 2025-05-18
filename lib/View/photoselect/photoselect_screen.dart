

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:paractice_app1/ViewModel/selectimage/functionofimage.dart';

class PhotoSelect extends StatelessWidget {
  final String data;
  PhotoSelect({super.key, required this.data});

  final PhotoController controller = Get.put(PhotoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Select'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Color(0xff3DB3E5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(child: Text(data, style: TextStyle(color: Colors.white))),
          ),

          // Image Display
          Obx(() => controller.selectedImage.value && controller.image.value != null
              ? Container(
                  width: 280,
                  height: 430,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(controller.image.value!, fit: BoxFit.cover),
                  ),
                )
              : Text('No image selected', style: TextStyle(color: Colors.white))),

         
          ElevatedButton(
              onPressed: controller.pickImageFromGallery,
              child: Text('Select From Gallery',style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  
                ),
                backgroundColor:   Color(0xff3DB3E5),
              ),
              
            ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ ElevatedButton(
              onPressed: controller.captureImageFromCamera,
              child: Text('Camera', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                 backgroundColor:   Color(0xff3DB3E5),
              ),
            ),
        ]),
        ],
      ),
    );
  }
}