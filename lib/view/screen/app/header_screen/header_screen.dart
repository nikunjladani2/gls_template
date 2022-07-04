import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gls_template/common/constant/app_constants.dart';
import 'package:gls_template/common/constant/key_constant.dart';
import 'package:gls_template/theme/app_theme.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/elements_button.dart';
import 'package:gls_template/view/common/elements_common.dart';
import 'package:gls_template/view/common/elements_dialog.dart';
import 'package:gls_template/view/common/elements_screen.dart';
import 'package:gls_template/view/common/elements_textfield.dart';
import 'package:gls_template/view/common/elements_textstyle.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:gls_template/view/models/header_vo.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
      title: "Home",
      body: _HeaderBody(),
    );
  }
}

class _HeaderBody extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<_HeaderBody> {
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final FocusNode _storeNameFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _zipcodeFocusNode = FocusNode();
  final FocusNode _phoneNoFocusNode = FocusNode();
  final FocusNode _websiteFocusNode = FocusNode();

  // create some values
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  bool _isStoreNameFieldHasFocus = false;
  bool _isAddressFieldHasFocus = false;
  bool _isCityFieldHasFocus = false;
  bool _isZipcodeFieldHasFocus = false;
  bool _isPhoneNoFieldHasFocus = false;
  bool _isWebsiteFieldHasFocus = false;

  final _picker = ImagePicker();
  String _logoUrl = "";
  String _bannerUrl = "";
  String _storeName = "A1 WINE & SPIRIT";
  String _storeAddress = "7884 Maxico Rd";
  String _storeCity = "Saint Peters";
  String _storeZipCode = "MO 63376";
  String _storePhoneNo = "636 387 0330";
  String _storeWebsite = "www.a1wineandspirit.com";
  Color? _backgroundColor;
  Color? _textColor;
  DateTime? _selectedDate;
  final TextEditingController _storeNameController =
      TextEditingController(text: "A1 WINE & SPIRIT");
  final TextEditingController _addressController =
      TextEditingController(text: "7884 Maxico Rd");
  final TextEditingController _cityController =
      TextEditingController(text: "Saint Peters");
  final TextEditingController _zipcodeController =
      TextEditingController(text: "MO 63376");
  final TextEditingController _phoneNoController =
      TextEditingController(text: "636 387 0330");
  final TextEditingController _websiteController =
      TextEditingController(text: "www.a1wineandspirit.com");
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _backgroundColorController =
      TextEditingController();
  final TextEditingController _textColorController = TextEditingController();

  bool _isShowLogoError = false;
  bool _isShowBannerError = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isShowStoreNameError = false;
  bool _isShowAddressError = false;
  bool _isShowCityError = false;
  bool _isShowZipcodeError = false;
  bool _isShowPhoneNoError = false;
  bool _isShowWebsiteError = false;
  bool _isShowDateError = false;
  bool _isShowBGColorError = false;
  bool _isShowTextColorError = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _bodyView();
  }

  Widget _bodyView() {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: headerFieldContainer(),
      ),
    );
  }

  Widget headerFieldContainer() {
    return Form(
      key: _formKey,
      child: TGView.columnContainer(
          crossAxisAlignment: CrossAxisAlignment.start,
          padding: const EdgeInsets.all(15),
          children: [
            _storeNameFieldWidget(),
            _shopWebsiteWidget(),
            _expiryDateWidget(),
            _storeAddressLineWidget(),
            _storeCityWidget(),
            _storeZipCodeWidget(),
            _shopPhoneNoWidget(),
            _chooseBackgroundColorWidget(),
            _chooseTextColorWidget(),
            _chooseLogoWidget(),
            _chooseBannerWidget(),
            nextButtonContainer()
          ]),
    );
  }

  Widget _storeNameFieldWidget() {
    return Container(
      color: Colors.transparent,
      child: TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              // _updateIsStoreNameFieldHasFocus(hasFocus);
            },
            child: TextFormField(
              enabled: true,
              enableInteractiveSelection: true,
              style: textFieldStyle(
                  color: primaryColor,
                  size: fontSize14,
                  fontWeight: FontWeightSize.medium),
              autovalidateMode: _autoValidateMode,
              controller: _storeNameController,
              focusNode: _storeNameFocusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (String value) {
                _addressFocusNode.requestFocus();
              },
              onChanged: (value) {
                _storeName = value;
                _updateIsShowStoreNameError(
                    value.trim().isNotEmpty ? false : true);
              },
              decoration: textFieldDecoration(
                text: "Store Name",
                textColor: primaryColor,
              ),
            ),
          ),
          TGView.emptySizedBox(height: Spacing.smallSpacing),
          textLabel(
              text: (_autoValidateMode == AutovalidateMode.onUserInteraction &&
                      _isShowStoreNameError)
                  ? "Store Name required"
                  : "",
              size: fontSize13,
              color: redColor),
        ],
      ),
    );
  }

  Widget _storeAddressLineWidget() {
    return Container(
      color: Colors.transparent,
      child: TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              _updateIsAddressFieldHasFocus(hasFocus);
            },
            child: TextFormField(
              enabled: true,
              enableInteractiveSelection: true,
              style: textFieldStyle(
                  color: primaryColor,
                  size: fontSize14,
                  fontWeight: FontWeightSize.medium),
              autovalidateMode: _autoValidateMode,
              controller: _addressController,
              focusNode: _addressFocusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (String value) {
                _cityFocusNode.requestFocus();
                _storeAddress = value;
              },
              onChanged: (value) {
                _storeAddress = value;
                _updateIsShowAddressError(
                    value.trim().isNotEmpty ? false : true);
              },
              decoration: textFieldDecoration(
                text: "Address line 1",
                textColor: primaryColor,
              ),
            ),
          ),
          TGView.emptySizedBox(height: Spacing.smallSpacing),
          textLabel(
              text: (_autoValidateMode == AutovalidateMode.onUserInteraction &&
                      _isShowAddressError)
                  ? "Address required"
                  : "",
              size: fontSize13,
              color: redColor),
        ],
      ),
    );
  }

  Widget _storeCityWidget() {
    return Container(
      color: Colors.transparent,
      child: TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              _updateIsCityFieldHasFocus(hasFocus);
            },
            child: TextFormField(
              enabled: true,
              enableInteractiveSelection: true,
              style: textFieldStyle(
                  color: primaryColor,
                  size: fontSize14,
                  fontWeight: FontWeightSize.medium),
              autovalidateMode: _autoValidateMode,
              controller: _cityController,
              focusNode: _cityFocusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (String value) {
                _zipcodeFocusNode.requestFocus();
                _storeCity = value;
              },
              onChanged: (value) {
                _storeCity = value;
                _updateIsShowCityError(value.trim().isNotEmpty ? false : true);
              },
              decoration: textFieldDecoration(
                text: "City",
                textColor: primaryColor,
              ),
            ),
          ),
          TGView.emptySizedBox(height: Spacing.smallSpacing),
          textLabel(
              text: (_autoValidateMode == AutovalidateMode.onUserInteraction &&
                      _isShowCityError)
                  ? "City required"
                  : "",
              size: fontSize13,
              color: redColor),
        ],
      ),
    );
  }

  Widget _storeZipCodeWidget() {
    return Container(
      color: Colors.transparent,
      child: TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              _updateIsZipcodeFieldHasFocus(hasFocus);
            },
            child: TextFormField(
              enabled: true,
              enableInteractiveSelection: true,
              style: textFieldStyle(
                  color: primaryColor,
                  size: fontSize14,
                  fontWeight: FontWeightSize.medium),
              autovalidateMode: _autoValidateMode,
              controller: _zipcodeController,
              focusNode: _zipcodeFocusNode,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (String value) {
                _phoneNoFocusNode.requestFocus();
                _storeZipCode = value;
              },
              onChanged: (value) {
                _storeZipCode = value;
                _updateIsShowZipcodeError(
                    value.trim().isNotEmpty ? false : true);
              },
              decoration: textFieldDecoration(
                text: "Zipcode",
                textColor: primaryColor,
              ),
            ),
          ),
          TGView.emptySizedBox(height: Spacing.smallSpacing),
          textLabel(
              text: (_autoValidateMode == AutovalidateMode.onUserInteraction &&
                      _isShowZipcodeError)
                  ? "Zipcode required"
                  : "",
              size: fontSize13,
              color: redColor),
        ],
      ),
    );
  }

  Widget _shopPhoneNoWidget() {
    return Container(
      color: Colors.transparent,
      child: TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              _updateIsPhoneNoFieldHasFocus(hasFocus);
            },
            child: TextFormField(
              enabled: true,
              enableInteractiveSelection: true,
              style: textFieldStyle(
                  color: primaryColor,
                  size: fontSize14,
                  fontWeight: FontWeightSize.medium),
              autovalidateMode: _autoValidateMode,
              controller: _phoneNoController,
              focusNode: _phoneNoFocusNode,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (String value) {
                _websiteFocusNode.requestFocus();
                _storePhoneNo = value;
              },
              onChanged: (value) {
                _storePhoneNo = value;
                _updateIsShowPhoneNoError(
                    value.trim().isNotEmpty ? false : true);
              },
              decoration: textFieldDecoration(
                text: "Phone No.",
                textColor: primaryColor,
              ),
            ),
          ),
          TGView.emptySizedBox(height: Spacing.smallSpacing),
          textLabel(
              text: (_autoValidateMode == AutovalidateMode.onUserInteraction &&
                      _isShowPhoneNoError)
                  ? "Phone number is required"
                  : "",
              size: fontSize13,
              color: redColor),
        ],
      ),
    );
  }

  Widget _shopWebsiteWidget() {
    return Container(
      color: Colors.transparent,
      child: TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              _updateIsWebsiteFieldHasFocus(hasFocus);
            },
            child: TextFormField(
              enabled: true,
              enableInteractiveSelection: true,
              style: textFieldStyle(
                  color: primaryColor,
                  size: fontSize14,
                  fontWeight: FontWeightSize.medium),
              autovalidateMode: _autoValidateMode,
              controller: _websiteController,
              focusNode: _websiteFocusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (String value) {
                _storeWebsite = value;
              },
              onChanged: (value) {
                _storeWebsite = value;
                _updateShowWebsiteError(value.trim().isNotEmpty ? false : true);
              },
              decoration: textFieldDecoration(
                text: "Website",
                textColor: primaryColor,
              ),
            ),
          ),
          TGView.emptySizedBox(height: Spacing.smallSpacing),
          textLabel(
              text: (_autoValidateMode == AutovalidateMode.onUserInteraction &&
                      _isShowWebsiteError)
                  ? "Website required"
                  : "",
              size: fontSize13,
              color: redColor),
        ],
      ),
    );
  }

  Widget _expiryDateWidget() {
    return Container(
      color: Colors.transparent,
      child: TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              //      _updateIsWebsiteFieldHasFocus(hasFocus);
            },
            child: TextFormField(
              enabled: true,
              readOnly: true,
              enableInteractiveSelection: true,
              style: textFieldStyle(
                  color: primaryColor,
                  size: fontSize14,
                  fontWeight: FontWeightSize.medium),
              autovalidateMode: _autoValidateMode,
              controller: _expiryDateController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (String value) {},
              onChanged: (value) {},
              onTap: () {
                _selectDate(context);
              },
              decoration: textFieldDecoration(
                text: "Expiry Date",
                textColor: primaryColor,
              ),
            ),
          ),
          TGView.emptySizedBox(height: Spacing.smallSpacing),
          textLabel(
              text: (_autoValidateMode == AutovalidateMode.onUserInteraction &&
                      _isShowDateError)
                  ? "Expiry Date required"
                  : "",
              size: fontSize13,
              color: redColor),
        ],
      ),
    );
  }

  Widget _chooseBackgroundColorWidget() {
    return Container(
      color: Colors.transparent,
      child: TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              //  _updateIsWebsiteFieldHasFocus(hasFocus);
            },
            child: TextFormField(
              enabled: true,
              readOnly: true,
              enableInteractiveSelection: true,
              style: textFieldStyle(
                  color: primaryColor,
                  size: fontSize14,
                  fontWeight: FontWeightSize.medium),
              autovalidateMode: _autoValidateMode,
              controller: _backgroundColorController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (String value) {},
              onChanged: (value) {},
              onTap: () {
                selectColor(ColorSelectionType.background);
              },
              decoration: textFieldDecoration(
                text: "Background Color",
                textColor: primaryColor,
              ),
            ),
          ),
          TGView.emptySizedBox(height: Spacing.smallSpacing),
          textLabel(
              text: (_autoValidateMode == AutovalidateMode.onUserInteraction &&
                      _isShowBGColorError)
                  ? "Background Color required"
                  : "",
              size: fontSize13,
              color: redColor),
        ],
      ),
    );
  }

  Widget _chooseTextColorWidget() {
    return Container(
      color: Colors.transparent,
      child: TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              //  _updateIsWebsiteFieldHasFocus(hasFocus);
            },
            child: TextFormField(
              enabled: true,
              readOnly: true,
              enableInteractiveSelection: true,
              style: textFieldStyle(
                  color: primaryColor,
                  size: fontSize14,
                  fontWeight: FontWeightSize.medium),
              autovalidateMode: _autoValidateMode,
              controller: _textColorController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (String value) {},
              onChanged: (value) {},
              onTap: () {
                selectColor(ColorSelectionType.text);
              },
              decoration: textFieldDecoration(
                text: "Text Color",
                textColor: primaryColor,
              ),
            ),
          ),
          TGView.emptySizedBox(height: Spacing.smallSpacing),
          textLabel(
              text: (_autoValidateMode == AutovalidateMode.onUserInteraction &&
                      _isShowTextColorError)
                  ? "Text Color required"
                  : "",
              size: fontSize13,
              color: redColor),
        ],
      ),
    );
  }

  Widget _chooseLogoWidget() {
    return InkWell(
        onTap: () async {
          await _requestGalleryPermission();
          Permission _permission =
              Platform.isIOS ? Permission.photos : Permission.storage;
          PermissionStatus status = await _permission.status;
          TGLog.d(status.toString());
          if (await _permission.isGranted) {
            _getImageFromGallery(ImageType.logo);
          } else if (await _permission.isDenied ||
              await _permission.isPermanentlyDenied) {
            if (Platform.isAndroid) {
              _permissionAlertDialog();
            }
          }
        },
        child: TGView.columnContainer(
            padding: const EdgeInsets.symmetric(vertical: 20),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textLabel(
                  text: "Upload Logo",
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  size: fontSize14),
              TGView.emptySizedBox(height: 10),
              _logoUrl != ""
                  ? _logoPreViewWidget()
                  : Container(
                      margin: const EdgeInsets.all(5.0),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38)),
                      child: const Icon(Icons.camera_alt_rounded, size: 40),
                    ),
              Container(
                  child: textLabel(
                      text: _isShowLogoError ? "Please select logo" : "",
                      color: Colors.red,
                      size: fontSize14)),
            ]));
  }

  Widget _chooseBannerWidget() {
    return InkWell(
        onTap: () async {
          await _requestGalleryPermission();
          Permission _permission =
              Platform.isIOS ? Permission.photos : Permission.storage;
          PermissionStatus status = await _permission.status;
          TGLog.d(status.toString());
          if (await _permission.isGranted) {
            _getImageFromGallery(ImageType.banner);
          } else if (await _permission.isDenied ||
              await _permission.isPermanentlyDenied) {
            if (Platform.isAndroid) {
              _permissionAlertDialog();
            }
          }
        },
        child: TGView.columnContainer(
            padding: const EdgeInsets.symmetric(vertical: 20),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textLabel(
                  text: "Upload Banner",
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  size: fontSize14),
              TGView.emptySizedBox(height: 10),
              _bannerUrl != ""
                  ? _bannerPreViewWidget()
                  : Container(
                      margin: const EdgeInsets.all(5.0),
                      height: 120,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38)),
                      child: const Icon(Icons.camera_alt_rounded, size: 40),
                    ),
              Container(
                  child: textLabel(
                      text: _isShowBannerError ? "Please select banner" : "",
                      color: Colors.red,
                      size: fontSize14)),
            ]));
  }

  _getImageFromGallery(String imageType) async {
    try {
      final pickedFile = (await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 25));

      if (pickedFile != null) {
        File? croppedFile = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatioPresets: [
              imageType == ImageType.logo
                  ? CropAspectRatioPreset.square
                  : CropAspectRatioPreset.ratio16x9,
              // CropAspectRatioPreset.ratio3x2,
              // CropAspectRatioPreset.original,
              // CropAspectRatioPreset.ratio4x3,
              // CropAspectRatioPreset.ratio16x9
            ],
            androidUiSettings: const AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: ThemeColors.primary,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.square,
                activeControlsWidgetColor: ThemeColors.primary,
                hideBottomControls: true,
                lockAspectRatio: false),
            iosUiSettings: const IOSUiSettings(
                minimumAspectRatio: 1.0,
                aspectRatioLockEnabled: true,
                rectX: 0,
                rectY: 0,
                rectWidth: 1024,
                rectHeight: 1024,
                rotateClockwiseButtonHidden: true,
                hidesNavigationBar: true));

        setState(() {
          imageType == ImageType.logo
              ? _logoUrl = croppedFile != null ? croppedFile.path : ""
              : _bannerUrl = croppedFile != null ? croppedFile.path : "";
          /*final bytes = File(_selectedFile!.path).readAsBytesSync().lengthInBytes;
          final kb = bytes / 1024;
          print("size after crop....$kb");*/
          imageType == ImageType.logo
              ? _updateShowLogoError(false)
              : _updateShowBannerError(false);
          if (croppedFile != null) {
            // _uploadAvatarServiceCall();
          }
        });
      }
    } catch (e) {
      setState(() {
        TGLog.d(e);
      });
    }
  }

  Future<void> _requestGalleryPermission() async {
    Permission _permission =
        Platform.isIOS ? Permission.photos : Permission.storage;
    if (await _permission.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    } else if (await _permission.isPermanentlyDenied) {
      _permissionAlertDialog();
    } else if (await _permission.isDenied) {
      // _permissionAlertDialog("photo");
    } else {
      // You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses =
          await [_permission].request();
      print(statuses[_permission]);
    }
  }

  void _permissionAlertDialog() {
    showDialogConfirmationCustomButton(
        context: context,
        isSuccess: true,
        positiveButtonText: "Settings",
        negativeButtonText: "Cancel",
        title: "Permission Denied",
        message:
            "GLS Template does not have access to your Gallery. To enable access, tap Settings and turn on Storage.",
        messages: [],
        onOkayPress: () async {
          Navigator.of(context).pop(false);
          await openAppSettings();
        },
        onDismiss: () {});
  }

  Widget _logoPreViewWidget() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.file(
        File(_logoUrl),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _bannerPreViewWidget() {
    return SizedBox(
      height: 120,
      width: 300,
      child: Image.file(
        File(_bannerUrl),
        fit: BoxFit.fill,
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: blackColor,
                onPrimary: whiteColor,
                surface: primaryColor,
                onSurface: whiteColor,
              ),
              dialogBackgroundColor: primaryColor,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _expiryDateController
        ..text = DateFormat.yMMMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _expiryDateController.text.length,
            affinity: TextAffinity.upstream));
      _updateShowDateError(false);
    }
  }

  Widget nextButtonContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: elevatedButton("Next", () {
          // performLogout(context);
          _saveHeaderDetailButtonPressed();
        }));
  }

  void _saveHeaderDetailButtonPressed() {
    setState(() {
      _autoValidateMode = AutovalidateMode.onUserInteraction;
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        TGView.clearFocus(context);
        if (_isValid()) {
          _autoValidateMode = AutovalidateMode.disabled;
          HeaderVO headerVO = HeaderVO();
          headerVO.storeName = _storeName;
          headerVO.storeAddress = _storeAddress;
          headerVO.city = _storeCity;
          headerVO.zipcode = _storeZipCode;
          headerVO.phoneNo = _storePhoneNo;
          headerVO.website = _storeWebsite;
          headerVO.expiryDate = _selectedDate != null
              ? DateFormat.yMMMd().format(_selectedDate!)
              : "";
          headerVO.backgroundColor = _backgroundColor;
          headerVO.textColor = _textColor;
          headerVO.logoUrl = _logoUrl;
          headerVO.bannerUrl = _bannerUrl;

          TGSession.getInstance().set(SessionKey.keyObjHeader, headerVO);

          Navigator.of(context).pushNamed(ScreenRoute.templateType);
        }
      }
    });
  }

  bool _isValid() {
    if (_storeNameController.text.trim().isEmpty) {
      _updateIsShowStoreNameError(true);
      return false;
    }
    if (_addressController.text.trim().isEmpty) {
      _updateIsShowAddressError(true);
      return false;
    }
    if (_cityController.text.trim().isEmpty) {
      _updateIsShowCityError(true);
      return false;
    }

    if (_zipcodeController.text.trim().isEmpty) {
      _updateIsShowZipcodeError(true);
      return false;
    }

    if (_phoneNoController.text.trim().isEmpty) {
      _updateIsShowPhoneNoError(true);
      return false;
    }
    if (_websiteController.text.trim().isEmpty) {
      _updateShowWebsiteError(true);
      return false;
    }

    if (_expiryDateController.text.trim().isEmpty) {
      _updateShowDateError(true);
      return false;
    }

    if (_backgroundColorController.text.trim().isEmpty) {
      _updateShowBGColorError(true);
      return false;
    }

    if (_textColorController.text.trim().isEmpty) {
      _updateShowTextColorError(true);
      return false;
    }

    if (_logoUrl.isEmpty) {
      _updateShowLogoError(true);
      return false;
    }
    if (_bannerUrl.isEmpty) {
      _updateShowBannerError(true);
      return false;
    }
    return true;
  }

  void _updateIsShowStoreNameError(bool isShow) {
    setState(() {
      _isShowStoreNameError = isShow;
    });
  }

  void _updateIsShowAddressError(bool isShow) {
    setState(() {
      _isShowAddressError = isShow;
    });
  }

  void _updateIsShowCityError(bool isShow) {
    setState(() {
      _isShowCityError = isShow;
    });
  }

  void _updateIsShowZipcodeError(bool isShow) {
    setState(() {
      _isShowZipcodeError = isShow;
    });
  }

  void _updateIsShowPhoneNoError(bool isShow) {
    setState(() {
      _isShowPhoneNoError = isShow;
    });
  }

  void _updateShowWebsiteError(bool isShow) {
    setState(() {
      _isShowWebsiteError = isShow;
    });
  }

  void _updateShowDateError(bool isShow) {
    setState(() {
      _isShowDateError = isShow;
    });
  }

  void _updateShowBGColorError(bool isShow) {
    setState(() {
      _isShowBGColorError = isShow;
    });
  }

  void _updateShowTextColorError(bool isShow) {
    setState(() {
      _isShowTextColorError = isShow;
    });
  }

  void _updateShowBannerError(bool isShow) {
    setState(() {
      setState(() {
        _isShowBannerError = isShow;
      });
    });
  }

  void _updateShowLogoError(bool isShow) {
    setState(() {
      setState(() {
        _isShowLogoError = isShow;
      });
    });
  }

  void _updateIsStoreNameFieldHasFocus(bool hasFocus) {
    setState(() {
      _isStoreNameFieldHasFocus = hasFocus;
    });
  }

  String? _validateStoreName(String? userName) {
    if (userName == null || userName.isEmpty) {
      return "Store Name required";
    }
    return null;
  }

  void _updateIsAddressFieldHasFocus(bool hasFocus) {
    setState(() {
      _isAddressFieldHasFocus = hasFocus;
    });
  }

  String? _validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return "Address required";
    }
    return null;
  }

  void _updateIsCityFieldHasFocus(bool hasFocus) {
    setState(() {
      _isCityFieldHasFocus = hasFocus;
    });
  }

  String? _validateCity(String? city) {
    if (city == null || city.isEmpty) {
      return "City required";
    }
    return null;
  }

  void _updateIsZipcodeFieldHasFocus(bool hasFocus) {
    setState(() {
      _isZipcodeFieldHasFocus = hasFocus;
    });
  }

  String? _validateZipcode(String? zipcode) {
    if (zipcode == null || zipcode.isEmpty) {
      return "Zipcode required";
    }
    return null;
  }

  void _updateIsPhoneNoFieldHasFocus(bool hasFocus) {
    setState(() {
      _isPhoneNoFieldHasFocus = hasFocus;
    });
  }

  String? _validatePhoneNo(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone No. required";
    }
    return null;
  }

  void _updateIsWebsiteFieldHasFocus(bool hasFocus) {
    setState(() {
      _isWebsiteFieldHasFocus = hasFocus;
    });
  }

  String? _validateWebsite(String? website) {
    if (website == null || website.isEmpty) {
      return "Website required";
    }
    return null;
  }

  String? _validateExpiryDate(String? expiryDate) {
    if (expiryDate == null || expiryDate.isEmpty) {
      return "Expiry Date required";
    }
    return null;
  }

  String? _validateBackgroundColor(String? expiryDate) {
    if (expiryDate == null || expiryDate.isEmpty) {
      return "Please select backgroundColor";
    }
    return null;
  }

  String? _validateTextColor(String? expiryDate) {
    if (expiryDate == null || expiryDate.isEmpty) {
      return "Please select text color";
    }
    return null;
  }

  void selectColor(String colorSelectionType) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: whiteColor,
            // contentPadding: EdgeInsets.zero,
            title: const Text('Pick a Colour'),
            content: _setupColorPickerDialogContainer(),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    currentColor = pickerColor;
                    String color = '#${currentColor.value.toRadixString(16)}';
                    colorSelectionType == ColorSelectionType.background
                        ? _backgroundColorController.text = color
                        : _textColorController.text = color;
                    colorSelectionType == ColorSelectionType.background
                        ? _backgroundColor = pickerColor
                        : _textColor = pickerColor;
                  });
                  colorSelectionType == ColorSelectionType.background
                      ? _updateShowBGColorError(false)
                      : _updateShowTextColorError(false);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Widget _setupColorPickerDialogContainer() {
    return SingleChildScrollView(
      // child: ColorPicker(
      //   pickerColor: pickerColor,
      //   onColorChanged: changeColor,
      // ),
      // Use Material color picker:
      //
      child: MaterialPicker(
        pickerColor: pickerColor,
        onColorChanged: changeColor,
        // showLabel: true, // only on portrait mode
      ),
      //
      // Use Block color picker:
      //
      // child: BlockPicker(
      //   pickerColor: currentColor,
      //   onColorChanged: changeColor,
      // ),
      //
      // child: MultipleChoiceBlockPicker(
      //   pickerColors: currentColors,
      //   onColorsChanged: changeColors,
      // ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
