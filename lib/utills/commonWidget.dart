import 'dart:ui';

import 'package:fitness_app/utills/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AppColors.dart';

Future<void> commonPopUp(
  BuildContext context, {
  String? title,
  String? subtitle,
  Widget? child,
  bool? topSideShowPopup = false,
  bool? barrierDismissible,
}) {
  return showDialog<void>(
    barrierDismissible: barrierDismissible ?? true,
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: StatefulBuilder(builder: (context, setter) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Dialog(
              alignment: topSideShowPopup == true
                  ? Alignment.topCenter
                  : Alignment.center,
              backgroundColor: color000000,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              insetPadding: const EdgeInsets.symmetric(horizontal: 30),
              child: child,
            ),
          );
        }),
      );
    },
  );
}

Widget CommonTextFeild({
  TextEditingController? controller,
  required String hintText,
  TextStyle? hintStyle,
  TextStyle? textStyle,
  bool isPass = false,
  bool readOnly = false,
  GestureTapCallback? onTap,
  bool? filled,
  InputBorder? border,
  Color? filledColor,
  TextInputType? keyboardType,
  Widget? suffix,
  Widget? prefix,
  TextAlign textAlign = TextAlign.start,
  bool isDense = false,
  FormFieldValidator<String>? validator,
  Function? change,
  int? maxLines = 1,
}) {
  bool ispassVisible = true;
  return StatefulBuilder(builder: (context, newSetState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1),
      child: TextFormField(
        textAlign: textAlign,
        onTap: onTap,
        controller: controller,
        cursorColor: colorPrimary,
        keyboardType: keyboardType,
        obscureText: isPass ? ispassVisible : isPass,
        style: textStyle ?? color000000s18w500,
        onChanged: (val) {
          newSetState(() {
            if (change != null) {
              change(val);
            }
          });
        },
        readOnly: readOnly,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          isDense: isDense,
          prefixIcon: prefix,
          hintText: hintText,
          hintStyle: hintStyle ??
              color000000s18w500.copyWith(color: color000000.withOpacity(0.5)),
          fillColor: filledColor ?? colorffffff,
          filled: filled ?? true,
          enabledBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: color000000),
              ),
          focusedBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: color000000),
              ),
          errorBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: color000000),
              ),
          focusedErrorBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: color000000),
              ),
          suffixIcon: isPass
              ? InkWell(
                  onTap: () {
                    newSetState(() {
                      ispassVisible = !ispassVisible;
                    });
                  },
                  child: Icon(
                      ispassVisible
                          ? Icons.visibility_off
                          : Icons.visibility_rounded,
                      color: color000000),
                )
              : suffix,
        ),
        maxLines: maxLines,
        validator: validator,
      ),
    );
  });
}

MaterialButton CommonButton(BuildContext context,
    {required VoidCallback onPressed, required String name, Color? color}) {
  return MaterialButton(
    onPressed: onPressed,
    child: Text(name, style: colorffffffs18w500),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    color: color ?? colorPrimary,
  );
}
