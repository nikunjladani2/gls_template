import 'package:flutter/material.dart';
import 'package:gls_template/common/constant/app_constants.dart';
import 'package:gls_template/common/constant/locales_constant.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/elements_textstyle.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/localization/tg_locale.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

showAlertDialog({
  required BuildContext context,
  String positiveButtonText = "Ok",
  String negativeButtonText = "Cancel",
  String title = "",
  required bool isSuccess,
  required String message,
  required List<String> messages,
  bool barrierDismissible = true,
  double horizontalPadding = 0,
  double verticalPadding = 0,
  required Function onOkayPress,
  required Function onCancelPress,
  Color positiveTextColor = primaryColor,
  Color negativeTextColor = primaryColor,
}) {
  AlertDialog alert = AlertDialog(
    backgroundColor: whiteColor,
    title: _dialogTitle(context, title, isSuccess),
    titlePadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding, vertical: verticalPadding),
    content: _dialogContent(message, messages),
    actions: [
      _dialogButton(context, negativeButtonText, onCancelPress,
          textColor: negativeTextColor),
      _dialogButton(context, positiveButtonText, onOkayPress,
          textColor: positiveTextColor),
    ],
  );

  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Text _dialogTitle(BuildContext context, String? title, bool isSuccess) {
  TextStyle titleTextStyle = isSuccess
      ? textLabelRegularStyle(fontSize18, g1,
          letterSpacing: 0.0, fontWeight: FontWeight.w600)
      : textLabelRegularStyle(fontSize18, TGView.theme()!.errorColor,
          letterSpacing: 0.0, fontWeight: FontWeight.normal);
  if (title != null) {
    return Text(title, style: titleTextStyle);
  } else {
    return isSuccess
        ? Text(TGLocale.text(LocaleKey.localeTitleSuccess),
            style: titleTextStyle)
        : Text("  " + TGLocale.text(LocaleKey.localeTitleFail),
            style: titleTextStyle);
  }
}

Widget _dialogContent(String? message, List<String?>? messages) {
  if (message != null) {
    return Text(message,
        style: textLabelRegularStyle(fontSize15, blackColor,
            letterSpacing: 0.0, fontWeight: FontWeight.normal));
  }
  if (messages != null && messages.isNotEmpty) {
    String _content = "";
    for (String? msg in messages) {
      _content += msg!;
      if (messages.indexOf(msg) != messages.length - 1) _content += "\n";
    }
    return Text(_content,
        style: textLabelRegularStyle(fontSize16, blackColor,
            letterSpacing: 0.0, fontWeight: FontWeight.normal));
  }
  return const Text("");
}

Widget _dialogButton(
    BuildContext context, String btnText, Function onLabelPress,
    {Color textColor = primaryColor}) {
  return TextButton(
    onPressed: onLabelPress as void Function()?,
    child: Text(
      btnText,
      style: textLabelRegularStyle(fontSize16, textColor,
          letterSpacing: 0.0, fontWeight: FontWeightSize.medium),
    ),
  );
}

void showDialogConfirmationCustomButton(
    {required BuildContext context,
    required bool isSuccess,
    String title = "",
    required String positiveButtonText,
    required String negativeButtonText,
    required String message,
    required List<String> messages,
    required Function onDismiss,
    required Function onOkayPress}) {
  TGView.clearFocus(context);
  List<Widget> titleRowWidgets = [
    if (title != "") _dialogTitle(context, title, isSuccess)
  ];
  Widget content = _dialogContent(message, messages);
  List<Widget> actions = [
    _dialogButton(context, positiveButtonText, onOkayPress),
    _dialogButton(
        context, negativeButtonText, () => Navigator.of(context).pop(false))
  ];
  TGView.showAlertDialog(
      context: context,
      titleRowWidgets: titleRowWidgets,
      content: content,
      actions: actions,
      onDismiss: () => TGLog);
}
