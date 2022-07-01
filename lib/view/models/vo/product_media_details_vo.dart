class ProductMediaDetailsVO {
  late int id;
  late int productId;
  late String midSize;
  late String normalSize;
  late String fullSize;
  late int mediaType;
  late int displayOrder;

  ProductMediaDetailsVO({
    this.id = 0,
    this.productId = 0,
    this.midSize = '',
    this.normalSize = '',
    this.fullSize = '',
    this.mediaType = 0,
    this.displayOrder = 0,
  });

  ProductMediaDetailsVO.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    productId = json['productId'] ?? 0;
    midSize = json['midSize'] ?? '';
    normalSize = json['normalSize'] ?? '';
    fullSize = json['fullSize'] ?? '';
    mediaType = json['mediaType'] ?? 0;
    displayOrder = json['displayOrder'] ?? 0;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'midSize': midSize,
        'normalSize': normalSize,
        'fullSize': fullSize,
        'mediaType': mediaType,
        'displayOrder': displayOrder,
      };
}
