import 'package:flutter/material.dart';
import 'package:gls_template/common/constant/app_constants.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/elements_textstyle.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';


InputDecoration textFieldDecoration({ String? text ,Color textColor = primaryColor,}) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      labelStyle: textLabelRegularStyle(fontSize14, primaryColor, fontWeight: FontWeightSize.medium),
      labelText: text,

      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: TGView.theme()!.colorScheme.primary)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: TGView.theme()!.colorScheme.primary)),
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
               color: Colors.red
              )),
      errorStyle: const TextStyle(
          color: Colors.redAccent
          ));

}

InputDecoration textFieldContactUsDecoration({IconData? icon, String? text}) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      labelStyle: const TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontSize: fontSize14),
      labelText: text,
      alignLabelWithHint: true,
      // prefixIconConstraints: const BoxConstraints(
      //   maxHeight: 10,
      //   minWidth: 28,
      // ),
      //
      enabledBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      errorBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      errorStyle: const TextStyle(color: Colors.redAccent));
}


InputDecoration textFieldDecorationOutlined({IconData? icon, Color textColor = g4, Color borderColor = g4, Color focusedBorderColor = g4, String? text, FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.auto}) {
  return InputDecoration(
    fillColor: blackColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.normalSpacing, vertical: Spacing.largeSpacing),
    labelStyle: const TextStyle(color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: fontSize18),
    floatingLabelBehavior: floatingLabelBehavior,
    errorStyle: textLabelRegularStyle(
      fontSize16,
      redColor,
    ),
    labelText: text,
    counterText: '',
    //prefixIcon: Icon(icon, color: Colors.white),
    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
    focusedBorder:
    OutlineInputBorder(borderSide: BorderSide(color: focusedBorderColor)),
    focusedErrorBorder:
    OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: borderColor)),
  );
}



