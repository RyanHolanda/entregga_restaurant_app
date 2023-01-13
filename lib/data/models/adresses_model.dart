// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressesModel {
  String address;
  bool completed;
  String date;
  String complement;
  String clientName;
  String observations;
  AddressesModel({
    required this.date,
    required this.completed,
    required this.address,
    required this.complement,
    required this.clientName,
    required this.observations,
  });

  factory AddressesModel.fromMap(Map<String, dynamic> map) {
    return AddressesModel(
      completed: map['completed'] as bool,
      date: map['date'] as String,
      address: map['address'] as String,
      complement: map['complement'] as String,
      clientName: map['client_name'] as String,
      observations: map['observations'] as String,
    );
  }
}

List<AddressesModel> courierAddresses = [];
