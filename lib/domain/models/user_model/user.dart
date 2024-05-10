class UserModel {
  String? id;
  final String? name;
  final int? age;
  final String? imageUrl;

  UserModel({
    this.id,
    this.name,
    this.age,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      age: map['age']?.toInt(),
      imageUrl: map['imageUrl'],
    );
  }
}