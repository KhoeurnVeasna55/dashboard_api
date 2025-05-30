import 'dart:convert';

class User {
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

  User({
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      isActive: json['isActive'] as bool,
      orders: List<dynamic>.from(json['orders'] as List), // Adjust if Order type is known
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int,
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

// Example usage:
void main() {
  String jsonString = '''
  {
    "_id": "68396a9db775ca688a9295e3",
    "name": "VeasnaKH",
    "email": "veasna@gmail.com",
    "password": "\$2b\$10\$3ygcFIKKGton03n7Y4kInuCid1LeHCdDQ.KbZEdVL1FBSjBrydMY.",
    "role": "customer",
    "isActive": true,
    "orders": [],
    "createdAt": "2025-05-30T08:21:49.203Z",
    "updatedAt": "2025-05-30T08:21:49.203Z",
    "__v": 0
  }
  ''';

  // Parse JSON string to Map
  Map<String, dynamic> jsonMap = json.decode(jsonString) as Map<String, dynamic>;

  // Create User object from JSON map
  User user = User.fromJson(jsonMap);

  // Print some values to verify
  print('User ID: ${user.id}');
  // print('User Name: ${user.name}');
  // print('User Email: ${user.email}');
  // print('User Is Active: ${user.isActive}');
  // print('User Created At: ${user.createdAt}');
  // print('User Orders: ${user.orders}');

  // Convert User object back to JSON map
  Map<String, dynamic> userJson = user.toJson();
//   print('\nUser back to JSON:');
//   print(json.encode(userJson)); // For pretty print: print(JsonEncoder.withIndent('  ').convert(userJson));
// 
}