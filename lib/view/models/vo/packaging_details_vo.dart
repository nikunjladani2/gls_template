class PackagingDetailsVO {
  late String unitPackageType;
  late String packageSize;
  late String sku;
  late String name;
  late String seName;
  late String systemName;
  late int id;
  late String unitType;
  late String unitSize;

  PackagingDetailsVO({
    this.unitPackageType = "",
    this.packageSize = "",
    this.sku = "",
    this.name = "",
    this.seName = "",
    this.systemName = "",
    this.id = 0,
    this.unitType = "",
    this.unitSize = "",
  });

  PackagingDetailsVO.fromJson(Map<String, dynamic> json) {
    unitPackageType = json['unitPackageType'] ?? "";
    packageSize = json['packageSize'] ?? "";
    sku = json['sku'] ?? "";
    name = json['name'] ?? "";
    seName = json['seName'] ?? "";
    systemName = json['systemName'] ?? "";
    id = json['id'] ?? 0;
    unitType = json['unitType'] ?? "";
    unitSize = json['unitSize'] ?? "";
  }

  Map<String, dynamic> toJson() => {
        'unitPackageType': unitPackageType,
        'packageSize': packageSize,
        'sku': sku,
        'name': name,
        'seName': seName,
        'systemName': systemName,
        'id': id,
        'unitType': unitType,
        'unitSize': unitSize,
      };
}
