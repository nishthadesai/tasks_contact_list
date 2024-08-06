import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/base_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/my_data/contact_data.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../router/app_router.dart';
import '../../../widget/app_text_filed.dart';

@RoutePage()
class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  TextEditingController searchController = TextEditingController();
  List searchedContactList = [];
  List<Widget> contactWidgets = [];
  List<ValueNotifier<bool>> checkboxStates = [];
  ValueNotifier<bool> isPressed = ValueNotifier(false);
  ValueNotifier<bool> isAnySelected = ValueNotifier(false);
  ValueNotifier<bool> isAllSelected = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: buildAppBar(),
        body: buildView(),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: isAnySelected,
          builder: (context, value, child) {
            return ValueListenableBuilder(
              valueListenable: isAllSelected,
              builder: (context, value, child) {
                return isAllSelected.value || isAnySelected.value
                    ? Container(
                        color: AppColor.grey.withOpacity(0.40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            5.verticalSpace,
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(S
                                            .of(context)
                                            .areYouSureYouWantToDelete),
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
                                              setState(() {
                                                contactDataList
                                                    .notifyListeners();
                                                appRouter.maybePop();
                                                isAllSelected.value = false;
                                                isPressed.value = false;
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 20.r,
                                  color: AppColor.red,
                                ),
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
                            5.verticalSpace,
                          ],
                        ),
                      )
                    : SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (isPressed.value) {
      isPressed.value = false;
      isAllSelected.value = false;
      isAnySelected.value = false;
      checkboxStates = List.generate(
          contactDataList.value.length, (_) => ValueNotifier(false));
      return false; // Prevents the default back button behavior
    }
    return true; // Allows the default back button behavior
  }

  buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: ValueListenableBuilder(
        valueListenable: isPressed,
        builder: (context, value, child) {
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
              isPressed.value == false
                  ? GestureDetector(
                      onTap: () {
                        appRouter.push(AddContactRoute(contactData: null));
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
                                if (isAllSelected.value) {
                                  checkboxStates = List.generate(
                                      contactDataList.value.length,
                                      (_) => ValueNotifier(true));
                                } else {
                                  checkboxStates = List.generate(
                                      contactDataList.value.length,
                                      (_) => ValueNotifier(false));
                                }
                              },
                              value: isAllSelected.value,
                            );
                          },
                        ),
                      ],
                    ).wrapPaddingRight(12),
            ],
          );
        },
      ),
    );
  }

  Widget buildView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).contacts,
            style: textBold.copyWith(fontSize: 26.spMin, color: AppColor.black),
          ),
          15.verticalSpace,
          buildSearchBar(),
          20.verticalSpace,
          buildContactList(),
        ],
      ).wrapPaddingHorizontal(15),
    );
  }

  /**
   * This is search bar for contacts search...

   */
  Widget buildSearchBar() {
    return SizedBox(
      height: 30,
      child: AppTextField(
        onChanged: (val) {
          if (val != null) {
            setState(() {
              searchedContactList = contactDataList.value.where((contact) {
                String name =
                    "${contact.firstName.toLowerCase()} ${contact.lastName.toLowerCase()}";
                return name.contains(val.toLowerCase());
              }).toList();
            });
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

  Widget buildContactList() {
    return searchController.text != ""
        ? searchedContactList.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.imageNoDataFound,
                      height: 100.r,
                      width: 100.w,
                    ),
                  ),
                  Text(
                    S.of(context).noContactsFound,
                    style: textMedium.copyWith(
                      fontSize: 16.spMin,
                      color: AppColor.black,
                    ),
                  ),
                ],
              )
            : Column(
                children: List.generate(
                  searchedContactList.length,
                  (index) {
                    ContactData contactData = searchedContactList[index];
                    return ListTile(
                      hoverColor: AppColor.transparent,
                      splashColor: AppColor.transparent,
                      contentPadding: EdgeInsets.zero,
                      minTileHeight: 40,
                      title: Text(
                        "${contactData.firstName.toTitleCase()} ${contactData.lastName.toTitleCase()}",
                        style: textMedium.copyWith(
                          fontSize: 14.spMin,
                          color: AppColor.black,
                        ),
                      ),
                      leading: contactData.Image is File
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50).r,
                              child: Image.file(
                                fit: BoxFit.fill,
                                contactData.Image,
                                height: 35.r,
                                width: 35.w,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50).r,
                              child: Image.asset(
                                fit: BoxFit.fill,
                                contactData.Image,
                                height: 35.r,
                                width: 35.w,
                              ),
                            ),
                      subtitle: Text(
                        "${contactData.number}",
                        style: textMedium.copyWith(
                          fontSize: 12.spMin,
                          color: AppColor.black.withOpacity(0.80),
                        ),
                      ).wrapPaddingTop(5),
                    ).wrapPaddingBottom(5);
                  },
                ),
              )
        : GestureDetector(
            child: ValueListenableBuilder(
              valueListenable: contactDataList,
              builder: (context, list, child) {
                final groupSortedContacts = sortAndGroupContacts();
                contactWidgets = [];
                checkboxStates = List.generate(
                    contactDataList.value.length, (_) => ValueNotifier(false));
                groupSortedContacts.forEach((letter, contacts) {
                  contactWidgets.add(
                    Text(
                      letter,
                      style: textMedium.copyWith(
                        fontSize: 16.spMin,
                        color: AppColor.black,
                      ),
                    ),
                  );

                  contactWidgets.add(Divider());

                  for (var contact in contacts) {
                    contactWidgets.add(
                      Column(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: isPressed,
                            builder: (context, isPressValue, child) {
                              return GestureDetector(
                                onTap: () {
                                  if (!isPressed.value) {
                                    appRouter.push(
                                      AddContactRoute(
                                          contactData: contact,
                                          index: list.indexOf(contact)),
                                    );
                                  }
                                },
                                onLongPress: () {
                                  isPressed.value = true;
                                  isAnySelected.value = true;
                                  if (isPressed.value == true) {
                                    checkboxStates[list.indexOf(contact)] =
                                        ValueNotifier(true);
                                  }
                                },
                                child: ListTile(
                                  hoverColor: AppColor.transparent,
                                  splashColor: AppColor.transparent,
                                  contentPadding: EdgeInsets.zero,
                                  minTileHeight: 40,
                                  title: Text(
                                    "${contact.firstName.toTitleCase()} ${contact.lastName.toTitleCase()}",
                                    style: textMedium.copyWith(
                                      fontSize: 14.spMin,
                                      color: AppColor.black,
                                    ),
                                  ),
                                  leading: contact.Image is File
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50).r,
                                          child: Image.file(
                                            fit: BoxFit.fill,
                                            contact.Image,
                                            height: 35.r,
                                            width: 35.w,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50).r,
                                          child: Image.asset(
                                            fit: BoxFit.fill,
                                            contact.Image,
                                            height: 35.r,
                                            width: 35.w,
                                          ),
                                        ),
                                  subtitle: Text(
                                    "${contact.number}",
                                    style: textMedium.copyWith(
                                      fontSize: 12.spMin,
                                      color: AppColor.black.withOpacity(0.80),
                                    ),
                                  ).wrapPaddingTop(5),
                                  trailing: isPressed.value
                                      ? ValueListenableBuilder(
                                          valueListenable: isAllSelected,
                                          builder: (context, value, child) {
                                            return ValueListenableBuilder<bool>(
                                              valueListenable: checkboxStates[
                                                  list.indexOf(contact)],
                                              builder:
                                                  (context, isChecked, child) {
                                                return Checkbox(
                                                  activeColor:
                                                      Colors.indigoAccent,
                                                  shape: CircleBorder(
                                                      eccentricity: 0.1.r),
                                                  onChanged: (val) {
                                                    checkboxStates[list
                                                            .indexOf(contact)]
                                                        .value = val ?? false;
                                                    isAllSelected.value = false;
                                                    bool allTrue =
                                                        checkboxStates.every(
                                                            (notifier) =>
                                                                notifier.value);
                                                    if (allTrue) {
                                                      isAllSelected.value =
                                                          true;
                                                    }
                                                    bool containsTrue =
                                                        checkboxStates.any(
                                                            (notifier) =>
                                                                notifier.value);
                                                    if (containsTrue) {
                                                      isAnySelected.value =
                                                          true;
                                                    } else {
                                                      isAnySelected.value =
                                                          false;
                                                    }
                                                  },
                                                  value: isChecked,
                                                );
                                              },
                                            );
                                          },
                                        )
                                      : null,
                                ),
                              );
                            },
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  }
                });

                return contactWidgets.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: contactWidgets,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              S.of(context).noContactsYet,
                              style: textMedium.copyWith(
                                fontSize: 16.spMin,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ],
                      );
              },
            ),
          );
  }
  //
  // void updateSelectAll() {
  //   bool allSelected = checkboxStates.every((notifier) => notifier.value);
  //   print(allSelected);
  //   isAllSelected.value = allSelected;
  // }

  Map<String, List<ContactData>> sortAndGroupContacts() {
    contactDataList.value.sort((a, b) => a.firstName.compareTo(b.firstName));

    Map<String, List<ContactData>> groupedContacts = {};
    for (var contact in contactDataList.value) {
      String firstLetter = contact.firstName[0].toUpperCase();
      if (groupedContacts[firstLetter] == null) {
        groupedContacts[firstLetter] = [];
      }
      groupedContacts[firstLetter]!.add(contact);
    }

    return groupedContacts;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
