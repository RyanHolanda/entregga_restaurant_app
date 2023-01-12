import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoreIdModel {
  String? storeId;
  StoreIdModel({
    this.storeId,
  });

  factory StoreIdModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return StoreIdModel(storeId: data?['storeId']);
  }

  Map<String, dynamic> toFirestore() {
    return {if (storeId != null) "storeId": storeId};
  }
}

String? storeIdModelString;
