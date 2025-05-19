import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FeedbackController extends GetxController {
  // Reactive list for selected options
  final RxList<bool> isSelected = List.generate(7, (_) => false).obs;
  final FocusNode focusNode = FocusNode();
  final TextEditingController commentsController = TextEditingController();
  final RxBool isSending = false.obs;

  // Feedback options with unique values
  final List<String> feedbackOptions = [
    'Poor Effectt',
    'Average Quality',
    'Face Detail Issues',
    'Color Accuracy',
    'Lighting Problems',
    'Resolution Quality',
    'Other Issues'
  ];

  void toggleSelection(int index) {
    if (index >= 0 && index < isSelected.length) {
      isSelected[index] = !isSelected[index];
    }
  }

  Future<void> sendFeedbackEmail() async {
    try {
      isSending(true);

      // Validate at least one option is selected
      if (!isSelected.contains(true)) {
        throw Exception('Please select at least one feedback option');
      }

      final selectedOptions = <String>[];
      for (int i = 0; i < isSelected.length; i++) {
        if (isSelected[i]) {
          selectedOptions.add(feedbackOptions[i]);
        }
      }

      final email = Email(
        body: '''
Feedback Options: ${selectedOptions.join(', ')}
        
Additional Comments:
${commentsController.text.trim()}
''',
        subject: 'App Feedback Report',
        recipients: ['csidrees@gmail.com'],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);

      Get.snackbar(
        'Success',
        'Thank you for your feedback!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Reset form after successful submission
      resetForm();
    } catch (error) {
      Get.snackbar(
        'Error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isSending(false);
    }
  }

  void resetForm() {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = false;
    }
    commentsController.clear();
    focusNode.unfocus();
  }

  @override
  void onClose() {
    focusNode.dispose();
    commentsController.dispose();
    super.onClose();
  }
}
