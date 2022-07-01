class ApplicableStoresVO {
  late int storeId;
  late String storeName;
  late bool promotionAlreadyApplied;


  ApplicableStoresVO({
    this.storeId = 0,
    this.storeName = "",
    this.promotionAlreadyApplied = false,
  });

  ApplicableStoresVO.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'] ?? 0;
    storeName = json['storeName'] ?? "";
    promotionAlreadyApplied = json['promotionAlreadyApplied'] ?? false;
  }

  Map<String, dynamic> toJson() => {
    'storeId': storeId,
    'storeName': storeName,
    'promotionAlreadyApplied': promotionAlreadyApplied,
  };
}
