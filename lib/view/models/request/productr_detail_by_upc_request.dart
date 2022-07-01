import 'dart:convert';
import 'package:gls_template/common/constant/uris_constant.dart';
import 'package:techgrains/com/techgrains/service/request/tg_post_request.dart';

class ProductDetailByUpcRequest extends TGPostRequest {
  String? upc;
  double? latitude;
  double? longitude;
  int? locationId;

  ProductDetailByUpcRequest({required this.upc, required this.latitude, required this.longitude, required this.locationId});

  @override
  String getUri() {
    return URI.getProductDetailByUpc;
  }


  Map<String, dynamic> toJson() => {
    'upc': upc,
    'latitude': latitude,
    'longitude': longitude,
    'locationId': locationId,
  };

  @override
  String body() {
    return json.encode(toJson());
  }
}
