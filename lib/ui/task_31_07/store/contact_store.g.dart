// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactStore on _ContactStoreBase, Store {
  late final _$contactDataListAtom =
      Atom(name: '_ContactStoreBase.contactDataList', context: context);

  @override
  ObservableList<ContactData> get contactDataList {
    _$contactDataListAtom.reportRead();
    return super.contactDataList;
  }

  @override
  set contactDataList(ObservableList<ContactData> value) {
    _$contactDataListAtom.reportWrite(value, super.contactDataList, () {
      super.contactDataList = value;
    });
  }

  late final _$_ContactStoreBaseActionController =
      ActionController(name: '_ContactStoreBase', context: context);

  @override
  dynamic addData(
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController phoneController,
      String path) {
    final _$actionInfo = _$_ContactStoreBaseActionController.startAction(
        name: '_ContactStoreBase.addData');
    try {
      return super.addData(
          firstNameController, lastNameController, phoneController, path);
    } finally {
      _$_ContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateData(
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController phoneController,
      String path,
      int id,
      ValueNotifier<bool> isFavorite,
      dynamic defaultImage) {
    final _$actionInfo = _$_ContactStoreBaseActionController.startAction(
        name: '_ContactStoreBase.updateData');
    try {
      return super.updateData(firstNameController, lastNameController,
          phoneController, path, id, isFavorite, defaultImage);
    } finally {
      _$_ContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contactDataList: ${contactDataList}
    ''';
  }
}
