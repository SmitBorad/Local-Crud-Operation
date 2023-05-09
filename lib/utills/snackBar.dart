import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

showSnackBar({required String title, required String message}) {
  Get.closeAllSnackbars();
  return Get.snackbar(
    title, // title
    message, // message
    backgroundColor: title.isEmpty || title == 'WARNING'
        ? const Color(0xffFFCC00)
        : title == 'SUCESS'
            ? Colors.green
            : Colors.red,
    colorText:
        title.isEmpty || title == 'WARNING' ? Colors.black : Colors.white,
    icon: Icon(
      title.isEmpty || title == 'WARNING'
          ? Icons.warning_amber_outlined
          : title == 'SUCESS'
              ? Icons.check_circle
              : Icons.error,
      color: title.isEmpty || title == 'WARNING' ? Colors.black : Colors.white,
    ),
    onTap: (_) {},
    shouldIconPulse: true,
    barBlur: 10,
    isDismissible: true,
    duration: const Duration(seconds: 2),
  );
}
