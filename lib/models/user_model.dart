
class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String role;
  final bool isActive;
  final List<dynamic> orders;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.isActive,
    required this.orders,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      isActive: json['isActive'] as bool,
      orders: List<dynamic>.from(json['orders'] as List),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int,
    );
  }
  factory UserModel.empty() {
    return UserModel(
      id: '',
      name: '',
      email: '',
      password: '',
      role: '',
      isActive: false,
      orders: const [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      v: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'isActive': isActive,
      'orders': orders,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
