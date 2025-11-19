class Product {
  final String id;
  final String name;
  final double price;
  final String desc;
  final String productPhotoPath;
  final String createdAt;
  final String updateAt;
  final bool deleted;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.desc,
    required this.productPhotoPath,
    required this.createdAt,
    required this.updateAt,
    required this.deleted,
  });

  factory Product.formJson(Map<String, dynamic> json) => switch (json) {
    {
      '_id': String id,
      'name': String name,
      'price': double price,
      'desc': String desc,
      'product_photo_path': String productPhotoPath,
      'created_at': String createdAt,
      'updated_at': String updatedAt,
      'deleted': bool deleted,
    } =>
      Product(
        id: id,
        name: name,
        price: price,
        desc: desc,
        productPhotoPath: productPhotoPath,
        createdAt: createdAt,
        updateAt: updatedAt,
        deleted: deleted,
      ),
    _ => throw const FormatException('Failed to load Product'),
  };
}
