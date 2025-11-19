class Order {
  final String id;
  final String storeName;
  final String productName;
  final int quantity;
  final double price;
  final double totalPrice;
  final String statusOrder;
  final int receiptNumber;

  const Order({
    required this.id,
    required this.storeName,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.statusOrder,
    required this.receiptNumber,
  });

  factory Order.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      '_id': String id,
      'store_name': String storeName,
      'product_name': String productName,
      'quantity': int quantity,
      'price': double price,
      'total_price': double totalPrice,
      'status_order': String statusOrder,
      'receipt_number': int receiptNumber,
    } =>
      Order(
        id: id,
        storeName: storeName,
        productName: productName,
        quantity: quantity,
        price: price,
        totalPrice: totalPrice,
        statusOrder: statusOrder,
        receiptNumber: receiptNumber,
      ),
    _ => throw const FormatException('Failed to load Order'),
  };
}
