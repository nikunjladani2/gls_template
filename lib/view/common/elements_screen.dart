import 'package:flutter/material.dart';
import 'package:gls_template/common/constant/app_constants.dart';
import 'package:gls_template/theme/app_theme.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';


import 'elements_textfield.dart';

Scaffold screenWithAppBar({
  required String title,
  bool drawer = false,
  bool isShowTitleImage = false,
  bool isBackVisible = false,
  Function? onBackPressed,
  required Widget? body,
  Widget? leading,
  List<Widget>? actions,
  double elevation = 0,
  Widget? bottom,
}) {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    backgroundColor: TGView.theme()!.scaffoldBackgroundColor,
    appBar: AppBar(
      backgroundColor: primaryColor,
      title: isShowTitleImage
          ? Container(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.smallSpacing),
        child: Image.asset(
          "assets/images/ic_logo.png",
          height: 22,
        ),
      )
          : textLabelBoldDotted(
          text: title,
          color: whiteColor,
          size: fontSize16,
          fontWeight: FontWeightSize.medium),
      centerTitle: true,
      elevation: elevation,
      leading: isBackVisible ? GestureDetector(
        onTap:
             onBackPressed as void Function()?
           ,
        child: Container(
          color: Colors.transparent,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TGView.emptySizedBox(width: 5),
              SizedBox(
                height: 46.0,
                width: 46.0,
                child: Icon(
                 Icons.arrow_back,
                    size: 22,
                    color: whiteColor),
              ),
            ],
          ),
        ),
      )
          : Container(),
      actions: actions,
      bottom: bottom as PreferredSizeWidget?,
    ),
    body: body,
  );
}

Scaffold screenWithoutAppBar({required Widget body}) {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    backgroundColor: TGView.theme()!.scaffoldBackgroundColor,
    body: body,
  );
}

Widget noDataWidget(String text) {
  return Container(alignment: Alignment.center, child: textLabel(text: text));
}

BoxDecoration backgroundGradientDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          ThemeColors.primary[200]!,
          ThemeColors.primary[100]!,
          ThemeColors.primary[50]!,
        ],
        tileMode: TileMode.clamp),
  );
}

Widget loadingIndicatorWidget() {
  return Container(child: TGView.loadingIndicator(primaryColor));
}

RoundedRectangleBorder cardRoundedRectangleBorder({Color color = g6}) {
  return RoundedRectangleBorder(
    side: BorderSide(
      color: color,
      width: 1,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );
}
