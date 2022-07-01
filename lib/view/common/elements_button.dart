import 'package:flutter/material.dart';
import 'package:gls_template/theme/app_theme.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';



Widget button(Function onPressed,
    {required String text,
    Color color = Colors.black,
    BorderRadius borderRadius = BorderRadius.zero}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
    child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: borderRadius))),
      onPressed: onPressed as void Function()?,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TGView.textTheme()
                  .button!
                  .merge(const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget settingButton(Function? onPressed,
    {required String text, Color color = Colors.black}) {
  return SizedBox(
    width: 62, // <-- Your width
    height: 28,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: onPressed as void Function()?,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TGView.textTheme().button!.merge(const TextStyle(
                color: Colors.white, fontSize: fontSize10)),
          ),
        ],
      ),
    ),
  );
}

Widget buttonLink(String text, Function onPressed) {
  return TextButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
    ),
    onPressed: onPressed as Function()?,
    child: Text(
      text,
      style: TGView.textTheme()
          .button!
          .merge(TextStyle(color: ThemeColors.lightGrey.shade50)),
    ),
  );
}

Widget buttonText(
    {double? width,
    double height = 44.0,
    String text = "",
    EdgeInsets margin = const EdgeInsets.all(0),
    EdgeInsets padding = const EdgeInsets.all(5),
    Color? textColor,
    Color? backgroundColor,
    Function? onPressed,
    Function? onLongPressed}) {
  return Container(
    margin: margin,
    height: height,
    width: width,
    color: backgroundColor,
    padding: padding,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed as void Function()?,
      onLongPress: onLongPressed as void Function()?,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: textColor,
        ),
      ),
    ),
  );
}

//Button With Image
Widget buttonWithImage(String imagePath, String text, Function onPressed) {
  return OutlinedButton(
    onPressed: onPressed as void Function()?,
    // shape: StadiumBorder(),
    // highlightElevation: 0,
    // borderSide: BorderSide(color: TGView.theme()!.primaryColor),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage(imagePath), height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: TGView.textTheme().subtitle1,
            ),
          )
        ],
      ),
    ),
  );
}

Widget elevatedButton(String text, Function onPressed,
    {Color textColor = Colors.white,
      bool isGreyButton = false,
      bool isShowDiscountIcon = false,
      bool isShowBagIcon = false,
      bool isShowCartIcon = false,
      bool isShowAddIcon = false,
      bool isEnable = true}) {
  Color getColor(Set<MaterialState> states) {
    if (isGreyButton) {
      return g5;
    }
    if (states.contains(MaterialState.pressed)) {
      return primaryColor;
    }
    return primaryColor;
  }

  return Stack(
    children: [
      SizedBox(
        height: 46,
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: ElevatedButton(
            onPressed: onPressed as void Function()?,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              fixedSize: MaterialStateProperty.all(const Size(double.infinity, 42)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  )),
              elevation: MaterialStateProperty.resolveWith<double>(
                // As you said you dont need elevation. I'm returning 0 in both case
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return 0;
                  }
                  return 0; // Defer to the widget's default.
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith(getColor),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text(
                text,
                style: TGView.textTheme()
                    .button!
                    .merge(const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
