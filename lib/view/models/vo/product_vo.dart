class ProductVO {
  late String name;
  late String unitPackageType;
  late String packageSize;
  late String seName;
  late String category;
  late String subCategory;
  late String type;
  late String subType;
  late String brand;
  late String systemCategory;
  late String originCountry;
  late String originState;
  late String originCity;
  dynamic alcoholPercentage;
  late int quantity;
  late String shortDescription;
  dynamic price;
  late String displayPrice;
  late bool isPriceOverridden;
  late bool hasImage;
  late String mediaThumbUrl;
  late int isAlreadyMapped;
  late bool isInWishlist;
  late String productGuid;
  late bool isSugarFree;
  late bool isGlutenFree;
  late int priceVariance;
  late bool displayAddButton;
  late bool deleted;
  late bool isGift;
  late bool isNewArrival;
  late int id;
  late int year;
  late String company;
  late String region;
  late bool displayCheckAvailabilityButton;
  late String checkAvailabilityText;
  late List<String> noStoreTexts = [];

  ProductVO({
    this.name = "",
    this.unitPackageType = "",
    this.packageSize = "",
    this.seName = "",
    this.category = "",
    this.subCategory = "",
    this.type = "",
    this.subType = "",
    this.brand = "",
    this.systemCategory = "",
    this.originCountry = "",
    this.originState = "",
    this.originCity = "",
    this.alcoholPercentage,
    this.quantity = 0,
    this.shortDescription = "",
    this.price,
    this.displayPrice = "",
    this.isPriceOverridden = false,
    this.hasImage = false,
    this.mediaThumbUrl = "",
    this.isAlreadyMapped = 0,
    this.isInWishlist = false,
    this.productGuid = "",
    this.isSugarFree = false,
    this.isGlutenFree = false,
    this.priceVariance = 0,
    this.displayAddButton = false,
    this.deleted = false,
    this.isGift = false,
    this.isNewArrival = false,
    this.id = 0,
    this.year = 0,
    this.company = "",
    this.region = "",
    this.displayCheckAvailabilityButton = false,
    this.checkAvailabilityText = "",
    this.noStoreTexts = const [],
  });

  ProductVO.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    unitPackageType = json['unitPackageType'] ?? "";
    packageSize = json['packageSize'] ?? "";
    seName = json['seName'] ?? "";
    category = json['category'] ?? "";
    subCategory = json['subCategory'] ?? "";
    type = json['type'] ?? "";
    subType = json['subType'] ?? "";
    brand = json['brand'] ?? "";
    systemCategory = json['systemCategory'] ?? "";
    originCountry = json['originCountry'] ?? "";
    originState = json['originState'] ?? "";
    originCity = json['originCity'] ?? "";
    alcoholPercentage = json['alcoholPercentage'];
    quantity = json['quantity'] ?? 0;
    shortDescription = json['shortDescription'] ?? "";
    price = json['price'];
    displayPrice = json['displayPrice'] ?? "";
    isPriceOverridden = json['isPriceOverridden'] ?? false;
    hasImage = json['hasImage'] ?? false;
    mediaThumbUrl = json['mediaThumbUrl'] ?? "";
    isAlreadyMapped = json['isAlreadyMapped'] ?? 0;
    isInWishlist = json['isInWishlist'] ?? false;
    productGuid = json['productGuid'] ?? "";
    isSugarFree = json['isSugarFree'] ?? false;
    isGlutenFree = json['isGlutenFree'] ?? false;
    priceVariance = json['priceVariance'] ?? 0;
    displayAddButton = json['displayAddButton'] ?? false;
    deleted = json['deleted'] ?? false;
    isGift = json['isGift'] ?? false;
    isNewArrival = json['isNewArrival'] ?? false;
    id = json['id'] ?? 0;
    year = json['year'] ?? 0;
    company = json['company'] ?? "";
    region = json['region'] ?? "";
    displayCheckAvailabilityButton =
        json['displayCheckAvailabilityButton'] ?? false;
    checkAvailabilityText = json['checkAvailabilityText'] ?? "";
    noStoreTexts =
        json["noStoreTexts"] != null ? json["noStoreTexts"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'unitPackageType': unitPackageType,
        'packageSize': packageSize,
        'seName': seName,
        'category': category,
        'subCategory': subCategory,
        'type': type,
        'subType': subType,
        'brand': brand,
        'systemCategory': systemCategory,
        'originCountry': originCountry,
        'originState': originState,
        'originCity': originCity,
        'alcoholPercentage': alcoholPercentage,
        'quantity': quantity,
        'shortDescription': shortDescription,
        'price': price,
        'displayPrice': displayPrice,
        'isPriceOverridden': isPriceOverridden,
        'hasImage': hasImage,
        'mediaThumbUrl': mediaThumbUrl,
        'isAlreadyMapped': isAlreadyMapped,
        'productGuid': productGuid,
        'isSugarFree': isSugarFree,
        'isGlutenFree': isGlutenFree,
        'priceVariance': priceVariance,
        'displayAddButton': displayAddButton,
        'deleted': deleted,
        'isGift': isGift,
        'isNewArrival': isNewArrival,
        'id': id,
        'year': year,
        'company': company,
        'region': region,
        'displayCheckAvailabilityButton': displayCheckAvailabilityButton,
        'checkAvailabilityText': checkAvailabilityText,
        'noStoreTexts': noStoreTexts,
      };
}
