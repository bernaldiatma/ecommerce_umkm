class Cart {
  final String idProduct;
  final int amount;
  final double totalPrice;

  const Cart({
    required this.idProduct,
    required this.amount,
    required this.totalPrice,
  });

  factory Cart.formJson(Map<String, dynamic> json) => switch (json) {
  {
    '_id_product': String idProduct,
  'amount': int amount,
  'total_price': double totalPrice,
  } =>
  Cart(
    idProduct: idProduct,
    amount: amount,
    totalPrice: totalPrice,
  ),
  _=> throw const FormatException('Failed to load Cart 6'),
  };
}
