import 'package:flutter/cupertino.dart';

import '../../generated/assets.dart';

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

ValueNotifier<List<ContactData>> contactDataList = ValueNotifier([
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Raghav",
      lastName: "Ghoda",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Ragv",
      lastName: "Ghda",
      number: "9985555555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Om",
      lastName: "Dedva",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Mansi",
      lastName: "Gor",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Jaldhi",
      lastName: "Gopi",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Raju",
      lastName: "Jethva",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Abhi",
      lastName: "Narayan",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Aakashi",
      lastName: "Naray",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Bobi",
      lastName: "Gopla",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "John",
      lastName: "Gala",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Harsh",
      lastName: "Gala",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Zahra",
      lastName: "Jada",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Krishna",
      lastName: "Yug",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Nishu",
      lastName: "Om",
      number: "9988855555"),
  ContactData(
      Image: Assets.imageProfile,
      firstName: "Popat",
      lastName: "Myur",
      number: "9988855555"),
]);
