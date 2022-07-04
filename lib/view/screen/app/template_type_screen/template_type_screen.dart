import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/elements_button.dart';
import 'package:gls_template/view/common/elements_screen.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

class TemplateTypeScreen extends StatelessWidget {
  const TemplateTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
      isBackVisible: true,
      title: "Select Template",
      onBackPressed: () {
        _onBackPressed(context);
      },
      body: _TemplateTypeBody(),
    );
  }

  void _onBackPressed(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Navigator.of(context).pop();
  }
}

class _TemplateTypeBody extends StatefulWidget {
  @override
  _TemplateTypeBodyState createState() => _TemplateTypeBodyState();
}

class _TemplateTypeBodyState extends State<_TemplateTypeBody> {
  String _groupValue = '';

  void checkRadio(String value) {
    setState(() {
      _groupValue = value;
      print(_groupValue);

    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return _bodyView();
  }

  Widget _bodyView() {
    return TGView.columnContainer(children: [_selectTemplateContainer(), nextButtonContainer()]);
  }

  _selectTemplateContainer() {
    return TGView.columnContainer(padding: EdgeInsets.symmetric(vertical: 20), children: [
      ListTile(
        title: Text('4 * 4'),
        leading: Radio(
            fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
            focusColor: MaterialStateColor.resolveWith((states) => primaryColor),
            value: 'Option1',
            groupValue: _groupValue,
            onChanged: (value) {
              checkRadio(value as String);
            }),
      ),
      ListTile(
        title: Text('5 * 4'),
        leading: Radio(
            fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
            focusColor: MaterialStateColor.resolveWith((states) => primaryColor),
            value: 'Option2',
            groupValue: _groupValue,
            onChanged: (value) {
              checkRadio(value as String);
            }),
      ),
    ]);
  }

  Widget nextButtonContainer() {
    return Container(
        padding: const EdgeInsets.all(20),
        child: elevatedButton("Next", () {
          // performLogout(context);
          _groupValue == "Option1" ?  Navigator.of(context).pushNamed(ScreenRoute.template44): Navigator.of(context).pushNamed(ScreenRoute.template54);
        }));
  }
}
