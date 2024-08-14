import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/base_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../../../../data/my_data/contacts/contact_data.dart';
import '../../../../generated/l10n.dart';
import '../../../../router/app_router.dart';
import '../../../../widget/app_text_filed.dart';
import '../store/contact_store.dart';

@RoutePage()
class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  ValueNotifier<List<ContactData>> contactDataView =
      ValueNotifier(contactStore.contactDataList);
  TextEditingController searchController = TextEditingController();
  ValueNotifier<bool> isPressed = ValueNotifier(false);
  ValueNotifier<bool> isAllSelected = ValueNotifier(false);
  ValueNotifier<bool> isAnySelected = ValueNotifier(false);
  ValueNotifier<int> flag = ValueNotifier(-1);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: AppColor.white,
          appBar: buildAppBar(),
          body: buildView(),
          bottomNavigationBar: buildBottomDeleteActionView(),
        ));
  }

  /** This is searchbar, favorites, all contacts list view */
  Widget buildView() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildSearchBar(),
          10.verticalSpace,
          Observer(
            builder: (context) {
              if (contactDataView.value.isEmpty) {
                contactDataView.value = contactStore.contactDataList;
              }
              if (contactStore.contactDataList.isNotEmpty) {
                final groupedContacts =
                    groupAndSortContacts(contactStore.contactDataList);
                final favoriteContacts = contactStore.contactDataList
                    .where((contact) => contact.isFavorite.value)
                    .toList();
                favoriteContacts.sort((a, b) {
                  final nameA = "${a.firstName} ${a.lastName}".toLowerCase();
                  final nameB = "${b.firstName} ${b.lastName}".toLowerCase();
                  return nameA.compareTo(nameB);
                });
                return Column(
                  children: [
                    if (favoriteContacts.isNotEmpty) ...[
                      buildFavoriteList(favoriteContacts),
                    ],
                    buildFirstLetterContacts(groupedContacts),
                  ],
                );
              } else if (searchController.text.isEmpty) {
                return Center(child: Text("No contacts"));
              } else {
                return Center(child: Text("no contacts"));
              }
            },
          ),
        ],
      ).wrapPaddingHorizontal(10),
    );
  }

  /** This is a appbar for contact list... */
  buildAppBar() {
    return BaseAppBar(
      backgroundColor: AppColor.white,
      showTitle: true,
      centerTitle: false,
      titleWidget: Text(
        S.of(context).list,
        style: textRegular.copyWith(
            fontSize: 16.spMin, color: Colors.indigoAccent),
      ),
      action: [
        ValueListenableBuilder(
          valueListenable: isPressed,
          builder: (context, value, child) {
            return isPressed.value == false
                ? GestureDetector(
                    onTap: () {
                      appRouter.push(AddContactRoute(contactData: null));
                      if (searchController.text.isNotEmpty) {
                        searchController.clear();
                      }
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.indigoAccent,
                      size: 20,
                    ).wrapPaddingRight(10),
                  )
                : Row(
                    children: [
                      Text(
                        S.of(context).selectAll,
                        style: textMedium.copyWith(
                            fontSize: 14.spMin, color: AppColor.black),
                      ),
                      ValueListenableBuilder(
                        valueListenable: isAllSelected,
                        builder: (context, value, child) {
                          return Checkbox(
                            activeColor: Colors.indigoAccent,
                            shape: CircleBorder(eccentricity: 0.1.r),
                            onChanged: (value) {
                              isAllSelected.value = !isAllSelected.value;
                              for (var contacts
                                  in contactStore.contactDataList) {
                                if (isAllSelected.value) {
                                  flag.value = 1;
                                  contacts.isSelected.value = true;
                                } else {
                                  flag.value = 0;
                                  contacts.isSelected.value = false;
                                }
                              }
                            },
                            value: isAllSelected.value,
                          );
                        },
                      ),
                    ],
                  ).wrapPaddingRight(12);
          },
        ),
      ],
    );
  }

  /** This is search bar for contacts search... */
  Widget buildSearchBar() {
    return SizedBox(
      height: 30,
      child: AppTextField(
        autoFocus: false,
        onChanged: (val) {
          if (val!.isNotEmpty) {
            contactStore.contactDataList = contactDataView.value
                .where((contact) {
                  String name =
                      "${contact.firstName.toLowerCase()} ${contact.lastName.toLowerCase()}";
                  return name.contains(val.toLowerCase());
                })
                .toList()
                .asObservable();
          } else {
            if (contactDataView.value.isNotEmpty) {
              contactStore.contactDataList =
                  contactDataView.value.asObservable();
            }
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 20.r,
            color: AppColor.grey,
          ),
          suffixIcon: Icon(
            Icons.mic,
            size: 20.r,
            color: AppColor.grey,
          ),
          hintText: "Search",
          hintStyle: textRegular.copyWith(
              fontSize: 16.spMin, color: AppColor.black.withOpacity(0.50)),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: AppColor.grey.withOpacity(0.10),
        ),
        keyboardType: TextInputType.name,
        keyboardAction: TextInputAction.search,
        textCapitalization: TextCapitalization.none,
        controller: searchController,
        label: '',
        hint: '',
      ),
    );
  }

  /** This is favorite list where all favorite contacts are */
  Widget buildFavoriteList(List<ContactData> favoriteContacts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.favorite,
              size: 18.r,
              color: AppColor.red,
            ),
            5.horizontalSpace,
            Text(
              S.of(context).favorites,
              style: textMedium.copyWith(
                  fontSize: 16.spMin, color: AppColor.black),
            ),
          ],
        ).wrapPaddingLeft(13),
        5.verticalSpace,
        Divider(
          height: 0,
        ).wrapPaddingBottom(5),
        buildContactsGroupList(favoriteContacts),
      ],
    );
  }

  /** This is a list of all different first letter in capital like A, B, C .. */
  Widget buildFirstLetterContacts(groupedContacts) {
    return Column(
      children: List.generate(
        groupedContacts.entries.length,
        (groupIndex) {
          final group = groupedContacts.entries.elementAt(groupIndex);
          final header = group.key;
          final contacts = group.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ).wrapPaddingOnly(left: 15, bottom: 5),
              Divider(height: 0),
              buildContactsGroupList(contacts),
            ],
          );
        },
      ),
    );
  }

  /** This is a list of group of similar first letter contacts .. */
  Widget buildContactsGroupList(contacts) {
    return Column(
      children: List.generate(
        contacts.length,
        (contactIndex) {
          ContactData contactData = contacts[contactIndex];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onLongPress: () {
                  isPressed.value = true;
                  flag.value = 1;
                  contactData.isSelected.value = true;
                  if (contactStore.contactDataList.length == 1) {
                    isAllSelected.value = true;
                  }
                },
                onTap: () {
                  if (!isPressed.value) {
                    appRouter.push(AddContactRoute(
                        contactData: contactData, id: contactData.id));
                  }
                },
                child: ListTile(
                  tileColor: AppColor.white,
                  minTileHeight: 50,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: contactData.image is File
                        ? Image.file(
                            contactData.image,
                            height: 35,
                            width: 35,
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            contactData.image,
                            height: 35,
                            width: 35,
                            fit: BoxFit.fill,
                          ),
                  ),
                  title:
                      Text("${contactData.firstName} ${contactData.lastName}")
                          .wrapPaddingTop(5),
                  subtitle: Text(contactData.number).wrapPaddingBottom(5),
                  trailing: ValueListenableBuilder(
                    builder: (context, value, child) {
                      return ValueListenableBuilder(
                        valueListenable: contactData.isSelected,
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          if (isPressed.value) {
                            return Checkbox(
                              activeColor: Colors.indigoAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              value: contactData.isSelected.value,
                              onChanged: (val) {
                                contactData.isSelected.value = val!;
                                updateSelectionCheckBox(val);
                              },
                            );
                          }
                          return SizedBox.shrink();
                        },
                      );
                    },
                    valueListenable: isPressed,
                  ),
                ),
              ),
              Divider(height: 0).wrapPaddingBottom(5),
            ],
          );
        },
      ),
    );
  }

  /** This is a bottom delete view when user select any contact */
  buildBottomDeleteActionView() {
    return ValueListenableBuilder(
      valueListenable: flag,
      builder: (context, value, child) {
        if (value == 1) {
          return Container(
            color: AppColor.grey.withOpacity(0.40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                5.verticalSpace,
                GestureDetector(
                  onTap: () {
                    showDialogueOnDelete();
                  },
                  child: Column(
                    children: [
                      Center(
                        child: Icon(
                          Icons.delete,
                          size: 20.r,
                          color: AppColor.red,
                        ),
                      ),
                      3.verticalSpace,
                      Text(
                        S.of(context).delete,
                        style: textMedium.copyWith(
                          fontSize: 14.spMin,
                          color: AppColor.black.withOpacity(0.50),
                        ),
                      ),
                    ],
                  ),
                ),
                5.verticalSpace,
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  /** This is a function when user pop the particular activity in between */
  Future<bool> _onWillPop() async {
    if (isPressed.value || searchController.text != "") {
      searchController.text = "";
      contactStore.contactDataList = contactDataView.value.asObservable();
      isPressed.value = false;
      isAnySelected.value = false;
      isAllSelected.value = false;
      flag.value = -1;
      for (var contacts in contactStore.contactDataList) {
        contacts.isSelected.value = false;
      }
      return false;
    }
    return true;
  }

  /** This is a alert dialogue when user delete any contact */
  showDialogueOnDelete() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).areYouSureYouWantToDelete),
            actions: [
              TextButton(
                child: Text(S.of(context).cancel),
                onPressed: () {
                  appRouter.maybePop();
                },
              ),
              TextButton(
                  child: Text(S.of(context).ok),
                  onPressed: () {
                    contactDataView.value
                        .removeWhere((contact) => contact.isSelected.value);
                    contactStore.contactDataList
                        .removeWhere((contact) => contact.isSelected.value);
                    appRouter.maybePop();
                    isPressed.value = false;
                    isAnySelected.value = false;
                    isAllSelected.value = false;
                    flag.value = -1;
                    for (var contact in contactStore.contactDataList) {
                      contact.isSelected.value = false;
                    }
                  }),
            ],
          );
        });
  }

  /** This is a function for all list checkbox selection status*/
  void updateSelectionCheckBox(val) {
    if (val == true) {
      flag.value = 1;
    }
    bool allSelected = contactStore.contactDataList
        .every((contact) => contact.isSelected.value);
    isAllSelected.value = allSelected;
    bool notSelected = contactStore.contactDataList
        .every((contact) => contact.isSelected.value == false);
    if (notSelected) {
      flag.value = 0;
    }
  }

  /** This is a function for group and sorting contacts... */
  Map<String, List<ContactData>> groupAndSortContacts(
      List<ContactData> contacts) {
    Map<String, List<ContactData>> groupedContacts = {};
    for (var contact in contacts) {
      final initial = contact.firstName[0].toUpperCase();
      if (contact.isFavorite.value != true) {
        if (groupedContacts.containsKey(initial)) {
          groupedContacts[initial]!.add(contact);
        } else {
          groupedContacts[initial] = [contact];
        }
      }
    }

    groupedContacts.forEach((key, value) {
      value.sort((a, b) {
        final nameA = "${a.firstName} ${a.lastName}".toLowerCase();
        final nameB = "${b.firstName} ${b.lastName}".toLowerCase();
        return nameA.compareTo(nameB);
      });
    });

    final sortedKeys = groupedContacts.keys.toList()..sort();

    return Map.fromIterable(
      sortedKeys,
      key: (key) => key,
      value: (key) => groupedContacts[key]!,
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    isPressed.dispose();
    isAllSelected.dispose();
    isAnySelected.dispose();
    contactDataView.dispose();
    flag.dispose();
    super.dispose();
  }
}
