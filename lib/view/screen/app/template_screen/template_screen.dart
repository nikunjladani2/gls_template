import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:barcode_scan2/model/scan_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gls_template/common/app_functions.dart';
import 'package:gls_template/common/constant/key_constant.dart';
import 'package:gls_template/manager/service_manager.dart';
import 'package:gls_template/view/common/app_colors.dart';
import 'package:gls_template/view/common/elements_button.dart';
import 'package:gls_template/view/common/elements_dialog.dart';
import 'package:gls_template/view/common/elements_screen.dart';
import 'package:gls_template/view/common/elements_textfield.dart';
import 'package:gls_template/view/common/view_constant.dart';
import 'package:gls_template/view/models/category_vo.dart';
import 'package:gls_template/view/models/header_vo.dart';
import 'package:gls_template/view/models/request/productr_detail_by_upc_request.dart';
import 'package:gls_template/view/models/response/product_detail_response.dart';
import 'package:gls_template/view/models/vo/product_vo.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/service/request/tg_post_request.dart';
import 'package:techgrains/com/techgrains/service/response/tg_response.dart';
import 'package:techgrains/com/techgrains/singleton/tg_session.dart';
import 'package:techgrains/com/techgrains/util/tg_net_util.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';
import 'dart:ui' as ui;

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
      isBackVisible: true,
      title: "Template",
      onBackPressed: () {
        _onBackPressed(context);
      },
      body: _TemplateBody(),
    );
  }

  void _onBackPressed(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Navigator.of(context).pop();
  }
}

class _TemplateBody extends StatefulWidget {
  @override
  _TemplateBodyState createState() => _TemplateBodyState();
}

class _TemplateBodyState extends State<_TemplateBody> {
  HeaderVO? _headerVO;
  List<CategoryVO> category = [];
  GlobalKey _globalKey = GlobalKey();

  double IMAGE_SIZE = 1080;
  double HEADER_HEIGHT = 180;
  double PRODUCT_CELL_HEIGHT = 0;
  double TOP_DEVIDER_HEIGHT = 5;
  double CELL_DEVIDER_HEIGHT = 1;

  @override
  void initState() {
    super.initState();
    List<ItemVO> taquilaItemList = [];
    taquilaItemList.add(ItemVO(
        name: "Don Julio 1942",
        isProductAdded: false,
        price: "\$139.99",
        quantity: "750ml"));
    taquilaItemList.add(ItemVO(
        name: "Clazse Azul Reposado ",
        isProductAdded: false,
        price: "\$149.99",
        quantity: "650ml"));
    taquilaItemList.add(ItemVO(
        name: "Cincoro Anejo",
        isProductAdded: false,
        price: "\$159.99",
        quantity: "750ml"));
    taquilaItemList.add(ItemVO(
        name: "Tesoro Maya Anejo",
        isProductAdded: false,
        price: "\$169.99",
        quantity: "650ml"));
    taquilaItemList.add(ItemVO(
        name: "Don Julio Anejo",
        isProductAdded: false,
        price: "\$139.99",
        quantity: "750ml"));

    List<ItemVO> bourbonItemList = [];
    bourbonItemList.add(ItemVO(
        name: "Jim Beam",
        isProductAdded: false,
        price: "\$129.99",
        quantity: "1.75ml"));
    bourbonItemList.add(ItemVO(
        name: "Basil Hayden's Toast",
        isProductAdded: false,
        price: "\$139.99",
        quantity: "750ml"));
    bourbonItemList.add(ItemVO(
        name: "Larceny Small Batch",
        isProductAdded: false,
        price: "\$149.99",
        quantity: "1.75ml"));
    bourbonItemList.add(ItemVO(
        name: "Maker's Mark",
        isProductAdded: false,
        price: "\$169.99",
        quantity: "750ml"));
    List<ItemVO> scotchItemList = [];
    scotchItemList.add(ItemVO(
        name: "Johnnie Walker Red Label",
        isProductAdded: false,
        price: "\$129.99",
        quantity: "750ml"));
    scotchItemList.add(ItemVO(
        name: "Glenfiddich 12 Year Old",
        isProductAdded: false,
        price: "\$99.99",
        quantity: "1.75ml"));
    scotchItemList.add(ItemVO(
        name: "Buchanan's Deluxe",
        isProductAdded: false,
        price: "\$139.99",
        quantity: "750ml"));
    scotchItemList.add(ItemVO(
        name: "Doublewood 12 Year Old",
        isProductAdded: false,
        price: "\$149.99",
        quantity: "1.75ml"));
    scotchItemList.add(ItemVO(
        name: "Oban 14 Year Old",
        isProductAdded: false,
        price: "\$159.99",
        quantity: "750ml"));
    category = [
      CategoryVO(categoryName: "TEQUILA", itemList: taquilaItemList),
      CategoryVO(categoryName: "BOURBON", itemList: bourbonItemList),
      CategoryVO(categoryName: "SCOTCH", itemList: scotchItemList)
    ];

    PRODUCT_CELL_HEIGHT = (IMAGE_SIZE -
            HEADER_HEIGHT -
            TOP_DEVIDER_HEIGHT -
            ((category.length) * CELL_DEVIDER_HEIGHT)) /
        category.length;
    TGLog.d("PRODUCT_CELL_HEIGHT " + PRODUCT_CELL_HEIGHT.toString());
    initHeader();
  }

  Future<void> initHeader() async {
    setState(() {
      _headerVO = TGSession.getInstance().get(SessionKey.keyObjHeader);
      TGLog.d("HeaderVO storeName -->>>" + _headerVO!.storeName!);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return _bodyView();
  }

  Widget _bodyView() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: TGView.columnContainer(
            children: [_templateContainer(), exportButtonContainer()]),
      ),
    );
  }

  Widget _templateContainer() {
    return RepaintBoundary(
      key: _globalKey,
      child: SizedBox(
        height: IMAGE_SIZE,
        width: IMAGE_SIZE,
        child: TGView.columnContainer(
            color: Colors.black12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerViewContainer(),
              divider(Colors.black),
              Column(
                children: category
                    .map((item) => _categoryContainer(
                          item,
                        ))
                    .toList(),
              )
            ]),
      ),
    );
  }

  Future<void> capturePng() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    print(pngBytes);
    Directory? dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    final File file = File('${dir!.path}/file.png');
    await file.writeAsBytes(pngBytes);

    if (!await file.exists()) {
      await file.create(recursive: true);
      await file.writeAsBytes(pngBytes);
    }
    final result = await ImageGallerySaver.saveImage(pngBytes);
    print(result);
  }

  Future getPdf() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Expanded(
              child:
                  pw.Image(pw.MemoryImage(pngBytes), fit: pw.BoxFit.contain));
        },
      ),
    );
    Directory? dir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    final File pdfFile = File('${dir!.path}/template.pdf');
    pdfFile.writeAsBytesSync(await pdf.save());
  }

  Widget _categoryContainer(CategoryVO categoryVO) {
    return TGView.columnContainer(
      children: [
        Row(
          children: [
            RotatedBox(
                quarterTurns: 3,
                child: Container(
                    color: Colors.blue,
                    width: PRODUCT_CELL_HEIGHT,
                    height: 80,
                    child: Center(
                      child: (textLabel(
                        text: categoryVO.categoryName,
                        color: whiteColor,
                        size: fontSize20,
                        fontWeight: FontWeight.bold,
                      )),
                    ))),
            Expanded(
              child: Row(
                  children: categoryVO.itemList
                      .map((item) => Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: InkWell(
                                child: Container(
                                  color: whiteColor,
                                  height: PRODUCT_CELL_HEIGHT,
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      if (!item.isProductAdded) ...[
                                        const Expanded(
                                            child: Icon(Icons.camera_alt,
                                                size: 50))
                                      ],
                                      if (item.isProductAdded) ...[
                                        _categoryItemContainer(item)
                                      ]
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  // setState(() {
                                  //   item.isProductAdded = true;
                                  // });
                                  _scanQRCode(item);
                                },
                              ),
                            ),
                          ))
                      .toList()),
            ),
          ],
        ),
        TGView.emptySizedBox(height: CELL_DEVIDER_HEIGHT)
      ],
    );
  }

  Widget exportButtonContainer() {
    return SizedBox(
      width: 1080,
      child: TGView.rowContainer(
        left: [
          Container(
            padding: const EdgeInsets.all(20),
            child: button(() {
              capturePng();
            }, text: "Export as PNG"),
          )
        ],
        center: [TGView.emptySizedBox(width: 10)],
        right: [
          Container(
              padding: const EdgeInsets.all(20),
              child: button(() {
                // performLogout(context);
                getPdf();
              }, text: "Export as PDF"))
        ],
      ),
    );
  }

  Widget divider(Color color) {
    return SizedBox(
      height: TOP_DEVIDER_HEIGHT,
      child: Center(
        child: Container(
          height: TOP_DEVIDER_HEIGHT,
          color: color,
        ),
      ),
    );
  }

  Widget _headerViewContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: _headerVO!.backgroundColor,
      height: HEADER_HEIGHT,
      child: IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(width: 250, child: _logoNameContainer()),
          TGView.emptySizedBox(width: 10),
          Expanded(child: _bannerImageContainer()),
          TGView.emptySizedBox(width: 10),
          SizedBox(width: 250, child: _addressContainer())
        ]),
      ),
    );
  }

  Widget _logoNameContainer() {
    return TGView.columnContainer(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.file(File(_headerVO!.logoUrl!),
                  height: 80, width: 80, fit: BoxFit.cover),
              TGView.emptySizedBox(width: 5),
              Expanded(
                child: textLabel(
                    text: _headerVO!.storeName!,
                    color: _headerVO!.textColor!,
                    size: fontSize22,
                    fontWeight: FontWeight.bold,
                    maxLines: 2,
                    textAlign: TextAlign.start),
              )
            ],
          ),
          TGView.emptySizedBox(height: 5),
          textLabel(
              text: _headerVO!.website!,
              color: _headerVO!.textColor!,
              size: fontSize15),
          textLabel(
              text: "Offer Expires ${_headerVO!.expiryDate!}",
              color: _headerVO!.textColor!,
              size: fontSize15),
        ]);
  }

  Widget _bannerImageContainer() {
    return SizedBox(
      height: 100,
      child: Image.file(File(_headerVO!.bannerUrl!), fit: BoxFit.fitWidth),
    );
  }

  Widget _addressContainer() {
    return TGView.columnContainer(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textLabel(
              text: _headerVO!.storeAddress!,
              color: _headerVO!.textColor!,
              fontWeight: FontWeight.bold,
              size: fontSize20),
          textLabel(
              text: "${_headerVO!.city!}, ${_headerVO!.zipcode!}",
              color: _headerVO!.textColor!,
              fontWeight: FontWeight.bold,
              size: fontSize20),
          TGView.emptySizedBox(height: 5),
          textLabel(
              text: _headerVO!.phoneNo!,
              color: _headerVO!.textColor!,
              fontWeight: FontWeight.bold,
              size: fontSize25),
        ]);
  }

  Widget _categoryItemContainer(ItemVO itemVO) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              color: Colors.transparent,
              child: Image(
                  width: 30,
                  height: 110,
                  image: AssetImage('assets/images/${itemVO.image}')),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: TGView.columnContainer(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 30,
                      child: textLabel(
                          text: itemVO.name,
                          maxLines: 2,
                          size: fontSize10,
                          fontWeight: FontWeight.bold)),
                ),
                TGView.emptySizedBox(height: 18),
                textLabel(
                    text: itemVO.quantity,
                    size: fontSize9,
                    fontWeight: FontWeight.bold),
                TGView.emptySizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.red,
                  child: textLabel(
                      text: itemVO.price,
                      size: fontSize14,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                )
              ]),
        )
      ],
    );
  }

  Future _scanQRCode(ItemVO item) async {
    ScanResult qrCode;
    try {
      qrCode = await BarcodeScanner.scan();
      if (qrCode.rawContent.isNotEmpty) {
        TGLog.d("qrCode.rawContent....." + qrCode.rawContent);
        _fetchProductDetailByUpcCall(item);
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        showAlertDialog(
            context: context,
            title: "Permission Denied",
            isSuccess: false,
            positiveButtonText: "GRANT",
            negativeButtonText: "DENY",
            message:
                "Scan Product won't work without Camera permission. Tap on GRANT to give the permission for Scan Product",
            messages: [],
            onOkayPress: () async {
              Navigator.of(context).pop(false);
              await openAppSettings();
            },
            onCancelPress: () {
              Navigator.of(context).pop(false);
            });
      } else {
        TGLog.d("Scan error.........");
      }
    }
  }

  Future<void> _fetchProductDetailByUpcCall(ItemVO item) async {
    if (await TGNetUtil.isInternetAvailable()) {
      TGPostRequest request = ProductDetailByUpcRequest(
          upc: "080480280017",
          locationId: 2,
          latitude: 38.5344927,
          longitude: -90.3045836);

      ServiceManager.getInstance().fetchProductDetailByUpc(
          request: request,
          onSuccess: (response) => _onSuccessProductDetail(response, item),
          onError: (error) => _onErrorProductDetail(error, context: context));
    } else {
      showSimpleSnackBar(
          context: context,
          duration: const Duration(milliseconds: 800),
          message: "Internet not reachable",
          bgColor: Colors.red);
    }
  }

  _onSuccessProductDetail(
    ProductDetailResponse response,
    ItemVO item,
  ) {
    TGLog.d("ProductDetailResponse : onSuccess()");
    setState(() {
      ProductVO? productVO = response.productDetailVO.productVO;
      if (productVO != null) {
        item.name = productVO.name;
        item.image = "bottle1.png";
        //item.price = productVO.displayPrice;
        // item.quantity = productVO.quantity.toString();
        item.isProductAdded = true;
      }
    });
  }

  _onErrorProductDetail(TGResponse errorResponse,
      {required BuildContext context}) async {
    TGLog.d(
        "ProductDetailResponse : onError() > " + errorResponse.body.toString());
    final response = json.decode(errorResponse.body!);
    showSimpleSnackBar(
        context: context,
        duration: const Duration(milliseconds: 800),
        message: response['message'],
        bgColor: Colors.red);
  }
}
