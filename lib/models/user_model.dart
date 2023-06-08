import 'package:flutter/material.dart';

class UserModel {
  int id;
  String name;
  String email;
  String phone;
  int orderCount;
  UserModel(
      {required this.email,
      required this.id,
      required this.name,
      required this.orderCount,
      required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['f_name'],
        email: json['email'],
        phone: json['phone'],
        orderCount: json['order_count']);
  }
}
