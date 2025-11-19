class OrderDetail {
  final String id;
  final String name;
  final double price;
  final String desc;
  final String productPhotoPath;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  const OrderDetail({
    required this.id,
    required this.name,
    required this.price,
    required this.desc,
    required this.productPhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      '_id': String id,
      'name': String name,
      'price': double price,
      'desc': String desc,
      'product_photo_path': String productPhotoPath,
      'created_at': String createdAt,
      'updated_at': String updatedAt,
      'deleted_at': String deletedAt,
    } =>
      OrderDetail(
        id: id,
        name: name,
        price: price,
        desc: desc,
        productPhotoPath: productPhotoPath,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      ),
    _ => throw const FormatException('Failed to load orderDetail'),
  };
}
