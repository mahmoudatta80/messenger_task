class UserModel {
  late final String number;
  late final String name;
  late final String image;
  late final String id;

  UserModel({
    required this.number,
    required this.name,
    required this.image,
    required this.id,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      number: json['number'],
      name: json['name'],
      image: json['image'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
      'image': image,
      'id': id,
    };
  }
}
