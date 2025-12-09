class Product {
  final String id;
  final String storeId;
  final String ownerId;
  final String storeName;
  final String name;
  final double price;
  final String desc;
  final String productPhotoPath;
  final int stock;
  final String createdAt;
  final String updatedAt;
  final bool deleted;

  const Product({
    required this.id,
    required this.storeId,
    required this.ownerId,
    required this.storeName,
    required this.name,
    required this.price,
    required this.desc,
    required this.productPhotoPath,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
  });

  factory Product.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      '_id': String id,
      'store': {
        "_id": String storeId,
        "user_id": String ownerId,
        "store_name": String storeName,
        "photo_path": String storePhotoPath,
        "deleted": String storeDeleted,
        "created_at": String storeCreatedAt,
        "updated_at": String storeUpdatedAt,
      },
      'name': String name,
      'price': int price,
      'desc': String desc,
      'product_photo_path': String productPhotoPath,
      'stock': int stock,
      'deleted': bool deleted,
      'created_at': String createdAt,
      'updated_at': String updatedAt,
    } =>
      Product(
        id: id,
        storeId: storeId,
        ownerId: ownerId,
        storeName: storeName,
        name: name,
        price: price.toDouble(),
        desc: desc,
        productPhotoPath: productPhotoPath,
        stock: stock,
        createdAt: createdAt,
        updatedAt: updatedAt,
        deleted: deleted,
      ),
    _ => throw const FormatException('Failed to load Product'),
  };

  Map<String, dynamic> toMapJson() => {
    '_id': id,
    'store_id': storeId,
    'owner_id': ownerId,
    'store_name': storeName,
    'name': name,
    'price': price,
    'desc': desc,
    'product_photo_path': productPhotoPath,
    'deleted': deleted,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };


  Map<String,dynamic> toJson() => {
    'store': storeId,
    'name': name,
    'price': price,
    'desc': desc,
    'product_photo_path': productPhotoPath
  };
}
