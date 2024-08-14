import 'package:flutter/material.dart';

class ContactData {
  final int id;
  final dynamic image;
  final String firstName;
  final String lastName;
  final String number;
  final ValueNotifier<bool> isSelected;
  final ValueNotifier<bool> isFavorite;
  ContactData({
    required this.id,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.number,
    required this.isSelected,
    required this.isFavorite,
  });
}

// ValueNotifier<List<ContactData>> contactDataList = ValueNotifier(
//   [
//     ContactData(
//       id: 1,
//       image: Assets.imageProfile,
//       firstName: "Raghav",
//       lastName: "Ghoda",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 2,
//       image: Assets.imageProfile,
//       firstName: "Ragv",
//       lastName: "Ghda",
//       number: "9985555555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 3,
//       image: Assets.imageProfile,
//       firstName: "Om",
//       lastName: "Dedva",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 4,
//       image: Assets.imageProfile,
//       firstName: "Mansi",
//       lastName: "Gor",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 5,
//       image: Assets.imageProfile,
//       firstName: "Jaldhi",
//       lastName: "Gopi",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 6,
//       image: Assets.imageProfile,
//       firstName: "Raju",
//       lastName: "Jethva",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 7,
//       image: Assets.imageProfile,
//       firstName: "Abhi",
//       lastName: "Narayan",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 8,
//       image: Assets.imageProfile,
//       firstName: "Aakashi",
//       lastName: "Naray",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 9,
//       image: Assets.imageProfile,
//       firstName: "Bobi",
//       lastName: "Gopla",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 10,
//       image: Assets.imageProfile,
//       firstName: "John",
//       lastName: "Gala",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 11,
//       image: Assets.imageProfile,
//       firstName: "Harsh",
//       lastName: "Gala",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 12,
//       image: Assets.imageProfile,
//       firstName: "Zahra",
//       lastName: "Jada",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 13,
//       image: Assets.imageProfile,
//       firstName: "Krishna",
//       lastName: "Yug",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 14,
//       image: Assets.imageProfile,
//       firstName: "Nishu",
//       lastName: "Om",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//     ContactData(
//       id: 15,
//       image: Assets.imageProfile,
//       firstName: "Popat",
//       lastName: "Myur",
//       number: "9988855555",
//       isSelected: ValueNotifier(false),
//       isFavorite: ValueNotifier(false),
//     ),
//   ],
// );
