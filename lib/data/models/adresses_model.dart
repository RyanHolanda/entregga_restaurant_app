import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressesModel {
  String address;
  String complement;
  String clientName;
  String observations;
  AddressesModel({
    required this.address,
    required this.complement,
    required this.clientName,
    required this.observations,
  });

  factory AddressesModel.fromMap(Map<String, dynamic> map) {
    return AddressesModel(
      address: map['address'] as String,
      complement: map['complement'] as String,
      clientName: map['client_name'] as String,
      observations: map['observations'] as String,
    );
  }
}

List<AddressesModel> courierAddresses = [];
