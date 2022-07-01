import 'dart:core';
import 'package:flutter/material.dart';
import 'package:gls_template/common/constant/app_constants.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/elements_button.dart';
import 'package:gls_template/view/common/elements_screen.dart';
import 'package:gls_template/view/common/elements_textstyle.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:techgrains/com/techgrains/localization/tg_locale.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

import '../../../common/elements_common.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenWithoutAppBar(
      body: _LoginBody(),
    );
  }
}

class _LoginBody extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<_LoginBody> with WidgetsBindingObserver {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isEmailTextFiledHasFocus = false;
  bool _isPasswordTextFiledHasFocus = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = "tester3@techgrains.com";
    _passwordController.text = "test#123";
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: screenWithAppBar(
        title: "Login",
        body: TGView.columnContainer(color: Colors.white, children: [
          Expanded(child: _detailsWidget()),
          // const Divider(
          //   height: 1,
          // ),
          // bottomWidget()
        ]),
      ),
    );
  }

  Widget _detailsWidget() {
    return SingleChildScrollView(
      child: TGView.columnContainer(
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: const EdgeInsets.all(20),
          children: [
            TGView.emptySizedBox(
                height: MediaQuery.of(context).size.height * 0.05),
            _formContainer(),
            TGView.emptySizedBox(height: 40),
            _loginButtonWidget(),
          ]),
    );
  }

  Widget _formContainer() {
    return Form(
      key: _formKey,
      child: TGView.columnContainer(children: <Widget>[
        TGView.columnContainer(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _emailFieldWidget(),
              TGView.emptySizedBox(height: 10),
              _passwordFieldWidget(),
            ]),
      ]),
    );
  }

  Widget _emailFieldWidget() {
    return Container(
      height: 75,
      color: Colors.transparent,
      child: Focus(
        onFocusChange: (hasFocus) {
          _updateIsEmailTextFiledHasFocus(hasFocus);
        },
        child: TextFormField(
          enabled: true,
          enableInteractiveSelection: true,
          style: textFieldStyle(
              color: primaryColor,
              size: fontSize14,
              fontWeight: FontWeightSize.medium),
          autovalidateMode: _autoValidateMode,
          controller: _emailController,
          focusNode: _emailFocusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (String value) {
            _passwordFocusNode.requestFocus();
          },
          decoration: textFieldDecoration(
            text: "User Name",
            textColor: primaryColor,
          ),
          validator: _validateUserName,
        ),
      ),
    );
  }

  void _updateIsEmailTextFiledHasFocus(bool hasFocus) {
    setState(() {
      _isEmailTextFiledHasFocus = hasFocus;
    });
  }

  Widget _passwordFieldWidget() {
    return Container(
      height: 75,
      color: Colors.transparent,
      child: Focus(
        onFocusChange: (hasFocus) {
          _updateIsPasswordTextFiledHasFocus(hasFocus);
        },
        child: TextFormField(
          enabled: true,
          enableInteractiveSelection: true,
          style: textFieldStyle(
              color: primaryColor,
              size: fontSize14,
              fontWeight: FontWeightSize.medium),
          autovalidateMode: _autoValidateMode,
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          obscureText: true,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
            decoration: textFieldDecoration(
              text: "Password",
              textColor: primaryColor,
            ),
          validator: _validatePassword,
          onFieldSubmitted: (String value) {
            _loginButtonPressed();
          },
        ),
      ),
    );
  }

  void _updateIsPasswordTextFiledHasFocus(bool hasFocus) {
    setState(() {
      _isPasswordTextFiledHasFocus = hasFocus;
    });
  }

  Widget _loginButtonWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _isLoading
              ? loadingIndicatorWidget()
              : elevatedButton(
                  TGLocale.text("Login"), _loginButtonPressed),
        ],
      ),
    );
  }

  void _loginButtonPressed() async {
    setState(() {
      _autoValidateMode = AutovalidateMode.onUserInteraction;
      if (_formKey.currentState!.validate()) {
      //  _showHideLoader(true);
        _formKey.currentState!.save();
        TGView.clearFocus(context);
        Navigator.of(context).pushReplacementNamed(ScreenRoute.header);
        // loginServiceCall(
        //     context: context,
        //     email: _emailController.text.trim(),
        //     password: _passwordController.text.trim());
      }
    });
  }

  // Future<void> loginServiceCall(
  //     {required BuildContext context,
  //     String email = "",
  //     String password = ""}) async {
  //   if (await TGNetUtil.isInternetAvailable()) {
  //     TGPostRequest request = LoginRequest(email: email, password: password);
  //
  //     ServiceManager.getInstance().login(
  //         request: request,
  //         onSuccess: (response) => _onSuccessLogin(
  //               response,
  //             ),
  //         onError: (error) => _onErrorLogin(error, context: context));
  //   } else {
  //     _showHideLoader(false);
  //     showSimpleSnackBar(
  //         context: context,
  //         duration: const Duration(milliseconds: 800),
  //         message: TGLocale.text(LocaleKey.localeMessageInternetNotAvailable),
  //         bgColor: redColor);
  //   }
  // }
  //
  // _onSuccessLogin(LoginResponse response) {
  //   TGLog.d("LoginResponse : onSuccess()");
  //   TGSession.getInstance().set(SessionKey.keyObjUser, response.userVO());
  //   TGSharedPreferences.getInstance()
  //       .set(SessionKey.keyObjUser, json.encode(response.userVO().toJson()));
  //   setAccessTokenInRequestHeader();
  //   _showHideLoader(false);
  //
  //   //goToNavigation
  //   Navigator.of(context).pushReplacementNamed(ScreenRoute.navigation);
  // }
  //
  // _onErrorLogin(TGResponse errorResponse, {required BuildContext context}) {
  //   TGLog.d("LoginResponse : onError() > " + errorResponse.body.toString());
  //   _showHideLoader(false);
  //   final response = json.decode(errorResponse.body!);
  //   showSimpleSnackBar(
  //       context: context,
  //       duration: const Duration(milliseconds: 800),
  //       message: response['message'],
  //       bgColor: redColor);
  // }

  void _showHideLoader(bool isShow) {
    setState(() {
      _isLoading = isShow;
    });
  }

  String? _validateUserName(String? userName) {
    if (userName == null || userName.isEmpty) {
      return TGLocale.text("Enter User Name");
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return TGLocale.text("Enter Password");
    }
    return null;
  }
}
