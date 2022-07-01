import 'package:gls_template/view/models/vo/applicable_stores_vo.dart';

class PromotionsVO {
  late int storeId;
  late String promoCode;
  late String promotionName;
  late String promotionDescription;
  late List<String> promotionSummary;
  late String errorMessage;
  late List<ApplicableStoresVO> applicableStoresVO;

  PromotionsVO({
    this.storeId = 0,
    this.promoCode = "",
    this.promotionName = "",
    this.promotionDescription = "",
    this.promotionSummary = const [],
    this.errorMessage = "",
    this.applicableStoresVO = const [],
  });

  PromotionsVO.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'] ?? 0;
    promoCode = json['promoCode'] ?? "";
    promotionName = json['promotionName'] ?? "";
    promotionDescription = json['promotionDescription'] ?? "";
    promotionSummary = json['promotionSummary'] != null ? json['promotionSummary'].cast<String>() : [];
    errorMessage = json['errorMessage'] ?? "";
    //applicableStoresVO = (json['applicableStores'] != null && json['applicableStores'].isNotEmpty) ? ApplicableStoresVO.fromJson(json['applicableStores']) : null;
    if (json['applicableStores'] != null) {
      applicableStoresVO = <ApplicableStoresVO>[];
      json['applicableStores'].forEach((v) {
        applicableStoresVO.add(ApplicableStoresVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
    'storeId': storeId,
    'promoCode': promoCode,
    'promotionName': promotionName,
    'promotionDescription': promotionDescription,
    'promotionSummary': promotionSummary,
    'errorMessage': errorMessage,
    'applicableStores': applicableStoresVO,
  };
}
