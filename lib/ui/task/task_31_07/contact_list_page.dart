import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/base_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/my_data/contact_data.dart';
import '../../../generated/l10n.dart';
import '../../../router/app_router.dart';
import '../../../widget/app_image.dart';
import '../../../widget/app_text_filed.dart';

@RoutePage()
class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: buildAppBar(),
      ),
      body: buildView(),
    );
  }

  Widget buildAppBar() {
    return BaseAppBar(
      backgroundColor: AppColor.white,
      showTitle: true,
      centerTitle: false,
      titleWidget: Text(
        S.of(context).list,
        style: textRegular.copyWith(
            fontSize: 14.spMin, color: Colors.indigoAccent),
      ),
      action: [
        GestureDetector(
          onTap: () {
            appRouter.push(AddContactRoute(contactData: null));
          },
          child: Icon(
            Icons.add,
            color: Colors.indigoAccent,
            size: 20.r,
          ).wrapPaddingRight(10),
        )
      ],
    );
  }

  Widget buildView() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).contacts,
            style: textBold.copyWith(fontSize: 26.spMin, color: AppColor.black),
          ),
          15.verticalSpace,
          SizedBox(
            height: 30.r,
            child: AppTextField(
              onSubmit: (value) {
                for (var contact in contactDataList.value) {
                  String firstName = contact.firstName;
                  if (firstName == searchController.text) {
                    List<ContactData> searchedContactList =
                        contactDataList.value.where((contact) {
                      return contactDataList.value.contains(firstName);
                    }).toList();
                    ;
                  }
                }
              },
              onChanged: (val) {
                setState(() {
                  searchController.text = val!;
                });
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
                    fontSize: 16.spMin,
                    color: AppColor.black.withOpacity(0.50)),
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
          ),
          20.verticalSpace,
          buildContactList(),
        ],
      ).wrapPaddingHorizontal(15),
    );
  }

  Widget buildContactList() {
    return searchController.text != ""
        ? Text("No Contacts found")
        : ValueListenableBuilder(
            valueListenable: contactDataList,
            builder: (context, value, child) {
              final groupSortedContacts = sortAndGroupContacts();
              List<Widget> contactWidgets = [];
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
                        GestureDetector(
                          onTap: () {
                            appRouter.push(
                              AddContactRoute(
                                  contactData: contact,
                                  index: value.indexOf(contact)),
                            );
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
                            leading: AppImage(
                              radius: 16.r,
                              file: contact.Image,
                            ),
                            subtitle: Text(
                              "${contact.number}",
                              style: textMedium.copyWith(
                                fontSize: 12.spMin,
                                color: AppColor.black.withOpacity(0.80),
                              ),
                            ).wrapPaddingTop(5),
                          ),
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
                  : Expanded(
                      child: Column(
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
                      ),
                    );
            },
          );
  }

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
