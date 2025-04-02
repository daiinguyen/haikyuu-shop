class Item {
  String itemName;
  String itemImage;
  String itemPrice;
  String itemRate;
  int itemCount;

  Item({
    required this.itemName,
    required this.itemImage,
    required this.itemPrice,
    required this.itemRate,
    this.itemCount = 0,
  });
  set setItemCount(int value) => itemCount = value;

  void increaseCount() {
    itemCount++;
  }
}
