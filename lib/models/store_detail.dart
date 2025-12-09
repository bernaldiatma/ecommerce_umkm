class StoreDetail {
  final String userId;
  final String storeName;
  final String storeDesc;
  final String photoPath;
  final String createdAt;
  final String updatedAt;
  final bool deleted;

  const StoreDetail({
    required this.userId,
    required this.storeName,
    required this.storeDesc,
    required this.photoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
  });

  factory StoreDetail.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      'user_id': String userId,
      'store_name': String storeName,
      'store_desc': String storeDesc,
      'photo_path': String photoPath,
      'created_at': String createdAt,
      'updated-at': String updateAt,
      'deleted': bool deleted,
    } =>
      StoreDetail(
        userId: userId,
        storeName: storeName,
        storeDesc: storeDesc,
        photoPath: photoPath,
        createdAt: createdAt,
        updatedAt: updateAt,
        deleted: deleted,
      ),
    _ => throw const FormatException('Failed to load StoreDetail'),
  };
}
