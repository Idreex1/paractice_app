import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:paractice_app1/helper/Widgets/widgets_screen.dart';
import 'package:paractice_app1/ViewModel/feedbackfunction_screen.dart';

class FeedBackScreen extends StatelessWidget {

 


    final GlobalKey<FormState> _key = GlobalKey<FormState>();

 FeedbackController controller = Get.put(FeedbackController());



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: DialogShowWidget(context),
        ),
        backgroundColor: Colors.black,
        body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'How Was Your Experience',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    const Text('Your feedback & review',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const Divider(color: Colors.grey, thickness: 1),
                    const SizedBox(height: 26),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Text('Please select your feedback',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 13),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        buildFeedbackOption(0, 'Poor Effect',),
                        const SizedBox(width: 10),
                        buildFeedbackOption(1, 'Average'),
                      ]),
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        buildFeedbackOption(2, 'Face Detail'),
                        const SizedBox(width: 10),
                        buildFeedbackOption(3, 'Average'),
                      ]),
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        buildFeedbackOption(4, 'Face Detail'),
                        const SizedBox(width: 10),
                        buildFeedbackOption(5, 'Average'),
                      ]),
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        buildFeedbackOption(6, 'Face Detail'),
                      ]),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Text('Share your feedback',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Row(
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).requestFocus(controller.focusNode);
                              },
                              child: Container(
                                height: 170,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 59, 57, 57),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: TextField(
                                    controller: controller.commentsController,
                                    focusNode: controller.focusNode,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Add comments here...",
                                      hintStyle:
                                          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: GestureDetector(
                        onTap: controller.sendFeedbackEmail,
                        child: Container(
                          height: 70,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 59, 57, 57),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}