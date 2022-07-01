import 'package:gls_template/view/models/vo/package_types_vo.dart';
import 'package:gls_template/view/models/vo/packaging_details_vo.dart';
import 'package:gls_template/view/models/vo/pick_up_store_vo.dart';
import 'package:gls_template/view/models/vo/product_media_details_vo.dart';
import 'package:gls_template/view/models/vo/product_vo.dart';

class ProductDetailVO {
  ProductVO? productVO;
  late List<PackageTypeVO> packageTypes;
  late List<PackagingDetailsVO> packagingDetails;
  late List<ProductMediaDetailsVO> productMediaDetails;
  late List<PickUpStoreVO> pickupStores;

  ProductDetailVO({
    this.productVO,
    this.packageTypes = const [],
    this.packagingDetails = const [],
    this.productMediaDetails = const [],
    this.pickupStores = const [],
  });

  ProductDetailVO.fromJson(Map<String, dynamic> json) {
    productVO =
        json['product'] != null ? ProductVO.fromJson(json['product']) : null;
    if (json['packageTypes'] != null) {
      packageTypes = <PackageTypeVO>[];
      json['packageTypes'].forEach((v) {
        packageTypes.add(PackageTypeVO.fromJson(v));
      });
    }
    if (json['packagingDetails'] != null) {
      packagingDetails = <PackagingDetailsVO>[];
      json['packagingDetails'].forEach((v) {
        packagingDetails.add(PackagingDetailsVO.fromJson(v));
      });
    }
    if (json['productMediaDetails'] != null) {
      productMediaDetails = <ProductMediaDetailsVO>[];
      json['productMediaDetails'].forEach((v) {
        productMediaDetails.add(ProductMediaDetailsVO.fromJson(v));
      });
    }
    if (json['pickupStores'] != null) {
      pickupStores = <PickUpStoreVO>[];
      json['pickupStores'].forEach((v) {
        pickupStores.add(PickUpStoreVO.fromJson(v));
      });
    }
  }
}
