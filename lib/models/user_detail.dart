class UserDetail {
  final String id;
  final String name;
  final String address;
  final String photo;

  const UserDetail({
    required this.id,
    required this.name,
    required this.address,
    required this.photo,
  });

  factory UserDetail.formJson(Map<String, dynamic> json) => switch (json) {
    {
      '_id': String id,
      'name': String name,
      'address': String address,
      'photo': String photo,
    } =>
      UserDetail(id: id, name: name, address: address, photo: photo),
    _ => throw const FormatException('Failed to load UserDetail'),
  };
}
