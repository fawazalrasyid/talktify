import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  Activity({
    required this.name,
    required this.descriptions,
    required this.image,
    required this.mentor,
    required this.type,
    required this.price,
    required this.date,
    required this.createdAt,
  });

  final String name;
  final String descriptions;
  final String image;
  final String mentor;
  final String type;
  final int price;
  final DateTime date;
  final DateTime createdAt;

  Activity.fromJson(Map<String, Object?> json)
      : this(
          name: json['name'] == null ? '' : json['name'] as String,
          descriptions: json['descriptions'] == null
              ? ''
              : json['descriptions'] as String,
          image: json['image'] == null ? '' : json['image'] as String,
          mentor: json['mentor'] == null ? '' : json['mentor'] as String,
          type: json['type'] == null ? '' : json['type'] as String,
          price: json['price'] == null ? 0 : json['price'] as int,
          date: json['date'] == null
              ? DateTime.now()
              : DateTime.parse(json['date'] as String),
          createdAt: json['createdAt'] == null
              ? DateTime.now()
              : DateTime.parse(json['createdAt'] as String),
        );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'descriptions': descriptions,
      'image': image,
      'mentor': mentor,
      'type': type,
      'price': price,
      'date': date.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
