import 'package:fsm_mobile/data/model/user_model.dart';

class CustomerModel {
  final String name;
  final String contactName;
  final String phone;
  final String email;
  final String nif;
  final int wilayaId;
  final int communeId;
  final String address;
  final UserModel? creator;

  CustomerModel({
    required this.name,
    required this.contactName,
    required this.phone,
    required this.email,
    required this.nif,
    required this.wilayaId,
    required this.communeId,
    required this.address,
    this.creator,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      name: json['name'] ?? '',
      contactName: json['contact_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      nif: json['nif'] ?? '',

      wilayaId: json['wilaya_id'] ?? 0,
      communeId: json['commune_id'] ?? 0,

      address: json['address'] ?? '',

      creator: json['creator'] != null
          ? UserModel.fromJson(json['creator'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'contact_name': contactName,
      'phone': phone,
      'email': email,
      'nif': nif,
      'wilaya_id': wilayaId,
      'commune_id': communeId,
      'address': address,
      'creator': creator?.toJson(),
    };
  }
}