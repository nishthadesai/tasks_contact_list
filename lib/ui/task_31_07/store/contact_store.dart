import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:mobx/mobx.dart';

import '../../../../data/my_data/contacts/contact_data.dart';
import '../../../../generated/assets.dart';

part 'contact_store.g.dart';

class ContactStore = _ContactStoreBase with _$ContactStore;

abstract class _ContactStoreBase with Store {
  @observable
  ObservableList<ContactData> contactDataList = ObservableList<ContactData>();

  @action
  addData(
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController phoneController,
      String path) {
    contactDataList.add(ContactData(
      image: path != "" ? File(path) : Assets.imageProfile,
      firstName: firstNameController.text.toTitleCase(),
      lastName: lastNameController.text.toTitleCase(),
      number: phoneController.text,
      isSelected: ValueNotifier(false),
      isFavorite: ValueNotifier(false),
      id: contactDataList.length + 1,
    ));
  }

  @action
  updateData(
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController phoneController,
      String path,
      int id,
      ValueNotifier<bool> isFavorite,
      dynamic defaultImage) {
    contactDataList[id - 1] = ContactData(
      image: path != "" ? File(path) : defaultImage,
      firstName: firstNameController.text.toTitleCase(),
      lastName: lastNameController.text.toTitleCase(),
      number: phoneController.text,
      isSelected: ValueNotifier(false),
      isFavorite: isFavorite,
      id: id,
    );
  }
}

final contactStore = locator<ContactStore>();
