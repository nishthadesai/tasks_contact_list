import 'package:flutter/cupertino.dart';

class ContactData {
  final dynamic Image;
  final String firstName;
  final String lastName;
  final String number;

  ContactData(
      {required this.Image,
      required this.firstName,
      required this.lastName,
      required this.number});
}

ValueNotifier<List<dynamic>> contactDataList = ValueNotifier([]);
