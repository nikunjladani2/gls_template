import 'package:gls_template/view/models/vo/promotions_vo.dart';

class PickUpStoreVO {
  late String storeUrl;
  late String distance;
  late int productId;
  late double price;
  late String displayPrice;
  late bool isSoldOut;
  late bool isFavorite;
  late List<PromotionsVO> promotions;
  late int id;
  late String name;
  late String fullAddress;
  late String addressLine1;
  late String addressLine2;
  late String city;
  late String state;
  late String zipCode;
  late double latitude;
  late double longitude;
  late bool delivery;
  late bool inStorePickup;
  late int qty;

  PickUpStoreVO({
    this.storeUrl = "",
    this.distance = "",
    this.productId = 0,
    this.price = 0.0,
    this.displayPrice = "",
    this.isSoldOut = false,
    this.isFavorite = false,
    this.promotions = const [],
    this.id = 0,
    this.name = "",
    this.fullAddress = "",
    this.addressLine1 = "",
    this.addressLine2 = "",
    this.city = "",
    this.state = "",
    this.zipCode = "",
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.delivery = false,
    this.inStorePickup = false,
    this.qty = 1,
  });

  PickUpStoreVO.fromJson(Map<String, dynamic> json) {
    storeUrl = json['storeUrl'] ?? "";
    distance = json['distance'] ?? "";
    productId = json['productId'] ?? 0;
    price = json['price'] ?? 0.0;
    displayPrice = json['displayPrice'] ?? "";
    isSoldOut = json['isSoldOut'] ?? false;
    isFavorite = json['isFavorite'] ?? false;
    if (json['promotions'] != null) {
      promotions = <PromotionsVO>[];
      json['promotions'].forEach((v) {
        promotions.add(PromotionsVO.fromJson(v));
      });
    }
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    fullAddress = json['fullAddress'] ?? "";
    addressLine1 = json['addressLine1'] ?? "";
    addressLine2 = json['addressLine2'] ?? "";
    city = json['city'] ?? "";
    state = json['state'] ?? "";
    zipCode = json['zipCode'] ?? "";
    latitude = json['latitude'] ?? 0.0;
    longitude = json['longitude'] ?? 0.0;
    delivery = json['delivery'] ?? false;
    inStorePickup = json['inStorePickup'] ?? false;
    qty = (json['qty'] == null || json['qty'] == 0) ? 1 : json['qty'];
  }

  Map<String, dynamic> toJson() => {
        'storeUrl': storeUrl,
        'distance': distance,
        'productId': productId,
        'displayPrice': displayPrice,
        'isSoldOut': isSoldOut,
        'isFavorite': isFavorite,
        'promotions': promotions,
        'id': id,
        'name': name,
        'fullAddress': fullAddress,
        'addressLine1': addressLine1,
        'city': city,
        'state': state,
        'zipCode': zipCode,
        'latitude': latitude,
        'longitude': longitude,
        'delivery': delivery,
        'inStorePickup': inStorePickup,
        'qty': qty,
      };
}
