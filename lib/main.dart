import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gls_template/common/constant/key_constant.dart';
import 'package:gls_template/theme/app_theme.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:gls_template/view/screen/app/header_screen/header_screen.dart';
import 'package:gls_template/view/screen/app/template_screen/template_screen.dart';
import 'package:gls_template/view/screen/auth/login_screen/login_screen.dart';
import 'package:gls_template/view/screen/loading/loading.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/localization/tg_locale.dart';
import 'package:techgrains/com/techgrains/localization/tg_localizations_delegate.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GLSTemplateApp());
}

class GLSTemplateApp extends StatefulWidget {
  static _GLSTemplateAppState? _state;

  const GLSTemplateApp({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _GLSTemplateAppState createState() => _state = _GLSTemplateAppState();

  static void buildTheme(
      BuildContext context, bool? flagDarkTheme, String textSize) async {
    TGLog.d("GLSTemplateApp.buildTheme : flagDarkTheme = " +
        flagDarkTheme.toString());
    _state?.buildTheme(flagDarkTheme);
  }

  static void setLocale(Locale locale) async {
    TGLog.d("GLSTemplateApp.setLocale : " + locale.toString());
    _state?.setLocale(locale);
  }
}

class _GLSTemplateAppState extends State<GLSTemplateApp> {
  buildTheme(bool? flagDarkTheme) {
    setState(() {
      AppTheme.load(flagDarkTheme: flagDarkTheme!);
    });
  }

  setLocale(Locale locale) {
    setState(() {
      TGLocale.currentLocale = locale;
      TGLog.d("_UgaAppState.setLocale = " + TGLocale.currentLocale.toString());
    });
  }

  @override
  void didChangeDependencies() {
    TGLog.d("main.didChangeDependencies()");
    super.didChangeDependencies();
  }

  @override
  void initState() {
    TGLog.d("main.initState()");
    super.initState();
    _initLocale();
  }

  void _initLocale() {
    TGLocale.init(defaultLocale: const Locale("en", "US"));
  }

  @override
  Widget build(BuildContext context) {
    TGLog.d("main.build");
    TGLog.d("TGLocale.currentLocale = " + TGLocale.currentLocale.toString());
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (TGView.theme() == null) {
      TGSession.getInstance().set(SessionKey.keyFlagDarkTheme, true);
      buildTheme(true);
    }

    return TGView.clearFocusGesture(context, buildMaterialApp());
  }

  Widget buildMaterialApp() {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        theme: TGView.theme(),
        supportedLocales: TGLocale.supportedLocales,
        locale: TGLocale.currentLocale,
        localizationsDelegates: const [
          TGLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) =>
            TGLocale.localeResolutionCallback(locale, supportedLocales),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => const LoadingScreen(),
          ScreenRoute.splash: (BuildContext context) => const LoadingScreen(),
          ScreenRoute.login: (BuildContext context) => const LoginScreen(),
          ScreenRoute.header: (BuildContext context) => const HeaderScreen(),
          ScreenRoute.addProduct: (BuildContext context) => const TemplateScreen(),
        });
  }
}
