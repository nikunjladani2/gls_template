import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:gls_template/common/app_functions.dart';
import 'package:gls_template/common/constant/app_constants.dart';
import 'package:gls_template/common/constant/key_constant.dart';
import 'package:gls_template/main.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/localization/tg_locale.dart';
import 'package:techgrains/com/techgrains/service/tg_service.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/singleton/tg_shared_preferences.dart';
import 'package:techgrains/com/techgrains/util/tg_flavor.dart';

initTheme(BuildContext context) async {
  bool? flagDarkTheme =
  await TGSharedPreferences.getInstance().get(SessionKey.keyFlagDarkTheme);
  if (flagDarkTheme == null) {
    flagDarkTheme = false;
    TGSharedPreferences.getInstance().set(SessionKey.keyFlagDarkTheme, flagDarkTheme);
  }
  TGSession.getInstance().set(SessionKey.keyFlagDarkTheme, flagDarkTheme);

  String? textSize = await TGSharedPreferences.getInstance().get(SessionKey.keyTextSize);
  if (textSize == null) {
    textSize = "R";
    TGSharedPreferences.getInstance().set(SessionKey.keyTextSize, textSize);
  }
  TGSession.getInstance().set(SessionKey.keyTextSize, textSize);

  GLSTemplateApp.buildTheme(context, flagDarkTheme, textSize);
}




Future<void> initFlavor() async {
  TGLog.d("initFlavor()");
  TGFlavor.init(AppConstant.configFlavorsFile);
}

Future<void> initLocale() async {
  TGLog.d("initLocale()");
  String? storedLocaleCode =
  await TGSharedPreferences.getInstance().get(SessionKey.keyAppLocaleCode);
  if (storedLocaleCode != null) {
    Locale? locale = TGLocale.findLocaleByCode(storedLocaleCode);
    GLSTemplateApp.setLocale(locale);
  }
}

Future<void> initGuestUser() async {
  TGLog.d("initGuestUser()");
  String? guestUserToken =
  await TGSharedPreferences.getInstance().get(SessionKey.keyGuestUserToken);
  if (guestUserToken != null) {
   TGSession.getInstance().set(SessionKey.keyGuestUserToken, guestUserToken);
  }
}

Future<void> initAppVersionInfo() async {
  TGLog.d("_initAppVersionInfo()");
  String? projectVersion;
  try {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    TGLog.d(appName);
    TGLog.d(packageName);
    TGLog.d(version);
    TGLog.d(buildNumber);
    projectVersion = version;

    String appVersionForService = version.toString().replaceAll(".", "") +buildNumber;
    TGLog.e('appVersionForService.....$appVersionForService');
    TGSession.getInstance().set(SessionKey.keyAppVersionForService, appVersionForService);
  } on PlatformException {
    TGLog.e('Failed to get project version.');
  }
  TGSession.getInstance().set(SessionKey.keyAppVersion, (projectVersion != null) ? "v" + projectVersion : "");
}


Future<void> initService() async {
  TGLog.d("initService()");
  await TGService.init(
      baseUrl: serviceBaseUrl(),
      applyMock: AppConstant.applyMockMappings,
      mockMappingsFile: AppConstant.mockMappingFile,
      headers: defaultHeaders(),
      badCertificateCallbackEnabled: false);
  setAccessTokenInRequestHeader();
}