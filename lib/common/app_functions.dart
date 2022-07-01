import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gls_template/common/constant/app_constants.dart';
import 'package:gls_template/common/constant/key_constant.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/elements_textfield.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/singleton/tg_shared_preferences.dart';
import 'package:techgrains/com/techgrains/util/tg_flavor.dart';
import 'package:url_launcher/url_launcher.dart';

String serviceBaseUrl() {
  switch (AppConstant.serviceEnvironment) {
    case AppConstant.envProd:
      return AppConstant.prodServiceBaseUrl;
    case AppConstant.envStage:
      return AppConstant.stageServiceBaseUrl;
    case AppConstant.envDev:
      return AppConstant.devServiceBaseUrl;
  }
  return "";
}

Map<String, String> defaultHeaders() {
  Map<String, String> headers = {};
  headers['Content-Type'] = 'application/json';
  headers['StoreId'] = '0';
  headers['AppSource'] = Platform.isAndroid ? "Android" : "ios";
  headers['AppVersion'] =
      TGSession.getInstance().get(SessionKey.keyAppVersionForService) ?? "";
  return headers;
}


void removeKey(String key) {
  TGSharedPreferences.getInstance().remove(key);
  TGSession.getInstance().remove(key);
}

bool isMockMappingsApply() {
  return (Platform.isAndroid
      ? TGFlavor.applyMock()
      : AppConstant.applyMockMappings);
}

String getEnvironment() {
  if (Platform.isAndroid) {
    return TGFlavor.param('environment');
  } else {
    switch (AppConstant.serviceEnvironment) {
      case AppConstant.envProd:
        return "Prod";
      case AppConstant.envStage:
        return 'Stage';
      case AppConstant.envDev:
        return 'Dev';
    }
  }

  return "";
}

void showSimpleSnackBar(
    {required BuildContext context,
    String message = "",
    Color textColor = whiteColor,
    Color bgColor = g5,
    Duration duration = const Duration(milliseconds: 300)}) {
  final snackBar = SnackBar(
    duration: duration,
    backgroundColor: bgColor,
    content: textLabelWithCustomSize(
        text: message,
        size: fontSize13,
        color: textColor,
        textAlign: TextAlign.center),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

void openEmail(String email) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
  );

  if (await canLaunchUrl(params)) {
    await launchUrl(params);
  } else {
    TGLog.d('Could not launch email');
  }
}

Future<void> openMap({
  required double latitude,
  required double longitude,
  required String label,
}) async {
  if (Platform.isAndroid) {
    final query = '$latitude,$longitude($latitude, $longitude)';
    final uri = Uri(scheme: 'geo', host: '0,0', queryParameters: {'q': query});

    await launchUrl(uri);
  } else {
    var query = 'https://maps.apple.com/?q=$latitude,$longitude';
    Uri appleUrl = Uri.parse('maps:q=$query');
    if (await canLaunchUrl(appleUrl)) {
      await launchUrl(appleUrl);
    } else {
      throw 'Could not launch $appleUrl';
    }
  }
}
