import 'package:flutter/material.dart';
import 'package:gls_template/common/constant/app_constants.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/elements_textstyle.dart';
import 'package:gls_template/view/common/view_constant.dart';

Text textLabelDoted(
    {required String text,
    double size = fontSize14,
    double letterSpacing = 0.3,
    int maxLines = 1,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      softWrap: false,
      style: textLabelRegularStyle(size, color, fontWeight: fontWeight, letterSpacing: letterSpacing));
}

Text textLabel(
    {required String text,
    double size = fontSize14,
    double letterSpacing = 0.3,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    int maxLines = 1, TextAlign textAlign = TextAlign.center}) {
  return Text(
    text,
    style: textLabelRegularStyle(size, color, fontWeight: fontWeight, letterSpacing: letterSpacing),
    maxLines: maxLines,
    overflow: TextOverflow.clip,
    textAlign: textAlign,
  );
}

Text textField(String text, {Color color = blackColor}) {
  return Text(text, style: textFieldStyle(color: color, size: fontSize12));
}

Text textFieldTitle(String text) {
  return Text(text, style: textFieldTitleStyle());
}

Text textCaption({
  required String text,
  required double size,
  Color color = blackColor,
  double letterSpacing = 0,
  String fontFamily = FontName.poppins,
  FontWeight fontWeight = FontWeightSize.regular,
}) {
  return Text(text,
      style: textCaptionStyle(
          size: size,
          fontFamily: fontFamily,
          color: color,
          letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
          fontWeight: fontWeight));
}

Text textLabelWithCustomSize({
  required String text,
  double height = 1.0,
  required double size,
  Color color = blackColor,
  double letterSpacing = 0,
  TextAlign textAlign = TextAlign.start,
  String fontFamily = FontName.poppins,
  FontWeight fontWeight = FontWeightSize.regular,
}) {
  return Text(text,
      textAlign: textAlign,
      style: textLabelStyleWithCustomSize(size, color,
          height: height,
          letterSpacing: letterSpacing == 0 ? 0 : letterSpacing,
          fontWeight: fontWeight,
          fontFamily: fontFamily));
}

Text textLabelBoldWithCustomSize({
  required String text,
  required double size,
  Color color = blackColor,
  String fontFamily = FontName.poppins,
  double letterSpacing = 0,
  TextAlign textAlign = TextAlign.start,
  FontWeight fontWeight = FontWeightSize.bold,
}) {
  return Text(text,
      textAlign: textAlign,
      style: textLabelBoldStyleWithCustomSize(size, color,
          letterSpacing: letterSpacing == 0 ? 0 : letterSpacing, fontWeight: fontWeight, fontFamily: fontFamily));
}

Text textCaptionBold({required String text, Color color = blackColor}) {
  return Text(text, style: textCaptionBoldStyle(color));
}

Text textLabelDotted(
    {required String text,
    required double size,
    Color color = blackColor,
    int maxLine = 1,
    double letterSpacing = 0,
    TextAlign textAlign = TextAlign.start,
    String fontFamily = FontName.poppins,
    FontWeight fontWeight = FontWeightSize.regular}) {
  return Text(text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      softWrap: false,
      style: textLabelRegularStyle(size, color,
          fontWeight: fontWeight, letterSpacing: letterSpacing == 0 ? 0 : letterSpacing, fontFamily: fontFamily));
}

Text textLabelBoldDotted(
    {required String text,
    required double size,
    Color color = blackColor,
    String fontFamily = FontName.poppins,
    double letterSpacing = 0,
    int maxLines = 1,
    TextAlign textAlign = TextAlign.start,
    FontWeight fontWeight = FontWeightSize.bold}) {
  return Text(text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      softWrap: false,
      style: textLabelBoldStyleWithCustomSize(size, color,
          letterSpacing: letterSpacing == 0 ? 0 : letterSpacing, fontWeight: fontWeight, fontFamily: fontFamily));
}
