import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gls_template/common/constant/key_constant.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/app_init.dart';
import 'package:gls_template/view/common/elements_screen.dart';
import 'package:gls_template/view/common/view_constant.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenWithoutAppBar(body: _LoadingBody());
  }
}

class _LoadingBody extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<_LoadingBody> {
  @override
  void initState() {
    TGLog.d("Loading.initState()");
    super.initState();
    _asyncInit();
  }

  _asyncInit() async {
    TGLog.d("Loading._asyncInit()");
    await _init();
    Timer(const Duration(seconds: 3), () {
      checkAutoLogin();
    });
  }

  void checkAutoLogin() async {
    TGLog.d("Loading.checkAutoLogin()");
    String keyGuestUserToken = TGSession.getInstance().get(SessionKey.keyGuestUserToken) ?? "";

    if (keyGuestUserToken.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed(ScreenRoute.header);
    } else {
      Navigator.of(context).pushReplacementNamed(ScreenRoute.login);
    }
  }

  Future<void> _init() async {
    TGLog.d("_init: Start");
    await initFlavor();
    await initTheme(context);
    await initAppVersionInfo();
    await initLocale();
    await initService();
    TGLog.d("_init: End");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: blackColor, // Color for Android
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
      ),
    );
    return Stack(
      children: <Widget>[
        TGView.columnsContainer(
            crossAxisAlignment: CrossAxisAlignment.center,
            columns: [
              [
                Expanded(flex: 1, child: loadingIndicatorWidget()),
              ],
            ]),
      ],
    );
  }
}
