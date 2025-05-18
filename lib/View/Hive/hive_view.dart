import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:paractice_app1/Model/Boxes/boxes_screen.dart';
import 'package:paractice_app1/Model/View/hive_model.dart';
import 'package:paractice_app1/helper/Widgets/widgets_screen.dart';

class HiveScreen extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final discriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hive DataBase'),
          leading: DialogShowWidget(context),
        ),
        body: ValueListenableBuilder<Box<HiveModel>>(
            valueListenable: BoxesScreen.getData().listenable(),
            builder: (context, box, _) {
              var data = box.values.toList().cast<HiveModel>();
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data[index].title.toString()),
                                IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: 'Delete Confirmation',
                                        middleText:
                                            'Are you sure delete the data',
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text('No')),
                                          TextButton(
                                              onPressed: () {
                                                data[index].delete();
                                                Get.back();
                                              },
                                              child: Text('Yes'))
                                        ],
                                      );
                                    },
                                    icon: Icon(Icons.delete)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data[index].discription.toString()),
                                IconButton(
                                    onPressed: () {
                                      editDialog(
                                          data[index],
                                          data[index].title.toString(),
                                          data[index].discription.toString());
                                    },
                                    icon: Icon(Icons.edit))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.defaultDialog(
                barrierDismissible: false,
                backgroundColor: const Color.fromARGB(255, 21, 15, 15),
                title: 'Show Data',
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titlecontroller,
                        decoration: InputDecoration(
                            hintText: 'Enter title',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: discriptioncontroller,
                        decoration: InputDecoration(
                            hintText: 'Enter discription',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      )
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                      titlecontroller.clear();
                      discriptioncontroller.clear();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      final data = HiveModel(
                        titlecontroller.text,
                        discriptioncontroller.text,
                      );
                      final box = BoxesScreen.getData();
                      box.add(data);
                      data.save();

                      titlecontroller.clear();
                      discriptioncontroller.clear();

                      Get.back();
                    },
                    child: const Text('Add'),
                  ),
                  const SizedBox(width: 20),
                ],
              );
            },
            child: Icon(Icons.add)));
  }

  Future<void> editDialog(
      HiveModel hive_model, String title, String discription) async {
    titlecontroller.text = title;
    discriptioncontroller.text = discription;
    Get.defaultDialog(
      backgroundColor: const Color.fromARGB(255, 21, 15, 15),
      title: 'Show Data',
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: titlecontroller,
              decoration: InputDecoration(
                  hintText: '$title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: discriptioncontroller,
              decoration: InputDecoration(
                  hintText: '$discription',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            hive_model.title = titlecontroller.text.toString();
            hive_model.discription= discriptioncontroller.text.toString();
            hive_model.save();
            Get.back();
          },
          child: const Text('save'),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
