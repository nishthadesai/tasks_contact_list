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
            "Contacts",
            style: textBold.copyWith(fontSize: 26.spMin, color: AppColor.black),
          ),
          15.verticalSpace,
          SizedBox(
            height: 30.r,
            child: AppTextField(
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
              keyboardAction: TextInputAction.done,
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
    return ValueListenableBuilder(
      valueListenable: contactDataList,
      builder: (context, value, child) {
        return value.isNotEmpty
            ? Column(
                children: List.generate(
                  value.length,
                  (index) {
                    ContactData data = contactDataList.value[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.firstName.split('').first),
                        Divider(),
                        GestureDetector(
                          onTap: () {
                            appRouter.push(
                              AddContactRoute(contactData: data, index: index),
                            );
                          },
                          child: ListTile(
                            hoverColor: AppColor.transparent,
                            splashColor: AppColor.transparent,
                            contentPadding: EdgeInsets.zero,
                            minTileHeight: 50,
                            title: Text(
                              "${data.firstName.toTitleCase()} ${data.lastName.toTitleCase()}",
                              style: textMedium.copyWith(
                                  fontSize: 14.spMin, color: AppColor.black),
                            ),
                            leading: AppImage(
                              radius: 16.r,
                              file: data.Image,
                            ),
                            subtitle: Text(
                              "${data.number}",
                              style: textMedium.copyWith(
                                fontSize: 12.spMin,
                                color: AppColor.black.withOpacity(0.80),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).wrapPaddingBottom(10);
                  },
                ),
              )
            : Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      S.of(context).noContactsYet,
                      style: textMedium.copyWith(
                          fontSize: 16.spMin, color: AppColor.black),
                    )),
                  ],
                ),
              );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
