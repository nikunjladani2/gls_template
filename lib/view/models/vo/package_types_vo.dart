class PackageTypeVO {
  String name = "";

  PackageTypeVO({
    this.name = "",
  });

  PackageTypeVO.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
  }

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
