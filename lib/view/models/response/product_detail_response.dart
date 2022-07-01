import 'package:gls_template/view/models/vo/product_detail_vo.dart';
import 'package:techgrains/com/techgrains/service/response/tg_response.dart';

class ProductDetailResponse extends TGResponse {
  ProductDetailVO productDetailVO = ProductDetailVO();

  ProductDetailResponse();

  ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    if (json != null) {
      productDetailVO = ProductDetailVO.fromJson(json);
    }
  }
}
