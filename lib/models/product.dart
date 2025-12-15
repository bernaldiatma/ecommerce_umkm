class Product {
  String id;
  String storeId;
  String ownerId;
  String storeName;
  String name;
  double price;
  String desc;
  String productPhotoPath;
  int stock;
  String createdAt;
  String updatedAt;
  bool deleted;

  Product({
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
        "username": String ownerId,
        "email": String storeName,
        "password": String password,
        "role": String role,
        "deleted": bool storeDeleted,
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
        ownerId: storeId,
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

  Map<String, dynamic> toJson() => {
    'store': storeId,
    'name': name,
    'price': price,
    'desc': desc,
    'stock': stock,
  };

  @override
  String toString() {
    return '$id,$storeId,$ownerId,$storeName,$name,$price,$desc,$productPhotoPath,$stock,$createdAt,$updatedAt,$deleted';
  }
}
