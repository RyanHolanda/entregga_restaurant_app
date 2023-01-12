import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoreCouriers {
  String name;
  String id;
  StoreCouriers({
    required this.name,
    required this.id,
  });

  factory StoreCouriers.fromMap(Map<String, dynamic> map) {
    return StoreCouriers(
      name: map['courierName'] as String,
      id: map['courierUid'] as String,
    );
  }
}

List<StoreCouriers> storeCouriers = [];
