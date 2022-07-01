class CategoryVO {
  String categoryName = "";
  List<ItemVO> itemList = [];

  CategoryVO({required this.categoryName, required this.itemList});
}

class ItemVO {
  String name = "";
  String image = "";
  String price = "";
  String quantity = "";
  bool isProductAdded = false;

  ItemVO({required this.name, required this.isProductAdded, required this.price, required this.quantity});
}
