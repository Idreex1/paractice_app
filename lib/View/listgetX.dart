import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Listgetx extends StatelessWidget {
  const Listgetx({super.key});

  @override
  Widget build(BuildContext context) {
    FavrioteFruits controller = Get.put(FavrioteFruits());
    return Scaffold(
      appBar: AppBar(
        title: Text('List  View In GetX'),
      ),
      body: ListView.builder(
        itemCount: controller.fruits.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                if (controller.temfruits
                    .contains(controller.fruits[index].toString())) {
                  controller
                      .remveFromFaverat(controller.fruits[index].toString());
                } else {
                  controller.addtoFaverat(controller.fruits[index].toString());
                }
              },
              title: Text(
                controller.fruits[index],
                style: TextStyle(color: Colors.black),
              ),
              trailing: Obx(() => Icon(Icons.favorite,
                  color: controller.temfruits
                          .contains(controller.fruits[index].toString())
                      ? Colors.red
                      : Colors.white),),
            ),
          );
        },
      ),
    );
  }
}

class FavrioteFruits extends GetxController {
  RxList<String> fruits = ['Orange', 'Mango', 'Banana', 'Apple'].obs;
  RxList temfruits = [].obs;

  addtoFaverat(String value) {
    temfruits.add(value);
  }

  remveFromFaverat(String value) {
    temfruits.remove(value);
  }
}
