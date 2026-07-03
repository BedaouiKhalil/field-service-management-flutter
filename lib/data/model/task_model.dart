import 'package:fsm_mobile/data/model/customer_model.dart';
import 'package:fsm_mobile/data/model/user_model.dart';

class TaskModel {
  final int id;
  final String title;
  final String? description;
  final String status;
  final String statusLabel;
  final DateTime? completedAt;

  final CustomerModel? customer;
  final UserModel? technician;
  final UserModel? creator;
  final UserModel? updater;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.status,
    required this.statusLabel,
    this.completedAt,
    this.customer,
    this.technician,
    this.creator,
    this.updater,
    this.createdAt,
    this.updatedAt,
  });


  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],

      title: json['title'],

      description: json['description'],

      status: json['status'],

      statusLabel: json['status_label'],

      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'])
          : null,

      customer: json['customer'] != null
          ? CustomerModel.fromJson(json['customer'])
          : null,

      technician: json['technician'] != null
          ? UserModel.fromJson(json['technician'])
          : null,

      creator: json['creator'] != null
          ? UserModel.fromJson(json['creator'])
          : null,

      updater: json['updater'] != null
          ? UserModel.fromJson(json['updater'])
          : null,

      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,

      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'status_label': statusLabel,
      'completed_at': completedAt?.toIso8601String(),

      'customer': customer?.toJson(),

      'technician': technician?.toJson(),

      'creator': creator?.toJson(),

      'updater': updater?.toJson(),

      'created_at': createdAt?.toIso8601String(),

      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}