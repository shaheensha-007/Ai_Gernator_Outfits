import 'package:ai_gernator_outfits/controllers/main_contollers/Lanuage_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

void showLanguageDialog(BuildContext context) {
  final controller = Get.find<LanguageController>();

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Choose Language"),
      content: Obx(() => Column(
        mainAxisSize: MainAxisSize.min,
        children: LanguageController.languages.entries.map((e) {
          return ListTile(
            title: Text(e.value),
            onTap: () => controller.changeLanguage(e.key),
          );
        }).toList(),
      )),
    ),
  );
}