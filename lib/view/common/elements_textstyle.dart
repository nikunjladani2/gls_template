import 'package:flutter/material.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';
import 'package:gls_template/common/constant/app_constants.dart';
import 'package:gls_template/view/common/app_colors.dart';

TextStyle textFieldStyle({
  required double size,
  Color color = blackColor,
  double letterSpacing = 0,
  String fontFamily = FontName.poppins,
  FontWeight fontWeight = FontWeightSize.regular,
}) {
  return TGView.textTheme().bodyText1!.merge(TextStyle(
      color: color,
      fontSize: size,
      letterSpacing: letterSpacing == 0 ? null : letterSpacing,
      fontFamily: fontFamily,
      fontWeight: fontWeight));
}

TextStyle? textFieldTitleStyle({Color color = blackColor}) {
  return TGView.textTheme().headline3!.merge(TextStyle(color: color));
}

TextStyle textCaptionStyle({
  required double size,
  Color color = blackColor,
  double letterSpacing = 0,
  String fontFamily = FontName.poppins,
  FontWeight fontWeight = FontWeightSize.medium,
}) {
  return TGView.textTheme().caption!.merge(TextStyle(
      color: color,
      fontSize: size,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing == 0 ? null : letterSpacing,
      fontWeight: fontWeight));
}

TextStyle textLabelStyleWithCustomSize(
  double size,
  Color color, {
  double letterSpacing = 0.0,
  double height = 1.0,
  String fontFamily = FontName.poppins,
  FontWeight fontWeight = FontWeightSize.medium,
}) {
  return TGView.textTheme().bodyText1!.merge(TextStyle(
        fontSize: size,
        letterSpacing: letterSpacing,
        color: color,
        height: height,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ));
}

TextStyle textLabelBoldStyleWithCustomSize(
  double size,
  Color color, {
  double letterSpacing = 0,
  double height = 1.0,
  String fontFamily = FontName.poppins,
  FontWeight fontWeight = FontWeightSize.bold,
}) {
  return TGView.textTheme().bodyText1!.merge(TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing == 0 ? null : letterSpacing,
      fontSize: size,
      color: color));
}

TextStyle textCaptionBoldStyle(Color color) {
  return TGView.textTheme()
      .caption!
      .merge(TextStyle(fontWeight: FontWeightSize.medium, color: color));
}

TextStyle textLabelRegularStyle(
  double size,
  Color color, {
  double letterSpacing = 0.3,
  String fontFamily = FontName.poppins,
  FontWeight fontWeight = FontWeightSize.regular,
}) {
  return TGView.textTheme().bodyText1!.merge(TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: size,
      letterSpacing: letterSpacing,
      color: color));
}
