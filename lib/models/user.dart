class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final String role;
  final bool deleted;
  final String createdAt;
  final String updatedAt;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
  });

  // dipakai untuk membaca data dari server API, lebih tepatnya mencocokkan data yang diterima
  // cocokkan atribut dari respon API nya (contoh di postman), dengan atribut dibawah ini
  factory User.fromJson(Map<String, dynamic> json) => switch (json) {
    {
      //pattern matching
      '_id': String id,
      'username': String username,
      'email': String email,
      'password': String password,
      'role': String role,
      'deleted': bool deleted,
      'created_at': String createdAt,
      'updated_at': String updatedAt,
    } =>
      User(
        id: id,
        username: username,
        email: email,
        password: password,
        role: role,
        deleted: deleted,
        createdAt: createdAt,
        updatedAt: updatedAt,
      ),
    _ => throw const FormatException('Failed to load User'),
  };

  @override
  String toString() {
    return '$id;$username;$email;$role';
  }
}
