class Inventory {
  Inventory({
    required this.inventoryId,
    required this.category,
    required this.brand,
    required this.supplier,
    required this.minimumStock,
    required this.updateDate,
    required this.taxRate,
    required this.notes,
    required this.productSize,
    required this.productWeight,
    required this.partnershipProgramInfo,
    required this.storageLocation,
  });
  final String inventoryId;
  final String category;
  final String brand;
  final String supplier;
  final int minimumStock;
  final String updateDate;
  final double taxRate;
  final String notes;
  final String productSize;
  final String productWeight;
  final String partnershipProgramInfo;
  final String storageLocation;

  // クラスのプロパティ数をカウントする方法があれば知りたい
  static const itemCount = 12;
}
