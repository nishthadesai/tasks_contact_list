import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_demo_structure/widget/show_message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/my_data/contact_data.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../widget/base_app_bar.dart';

@RoutePage()
class AddContactPage extends StatefulWidget {
  final ContactData? contactData;
  final int? index;
  const AddContactPage({super.key, required this.contactData, this.index});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<String> path = ValueNotifier("");
  @override
  void initState() {
    if (widget.contactData != null) {
      firstNameController.text = widget.contactData!.firstName;
      lastNameController.text = widget.contactData!.lastName;
      phoneController.text = widget.contactData!.number;
      path.value = widget.contactData?.Image;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: buildAppBar(),
      ),
      body: buildView(),
    );
  }

  Widget buildAppBar() {
    return BaseAppBar(
      backgroundColor: AppColor.gray,
      showTitle: true,
      centerTitle: true,
      leadingIcon: true,
      leadingWidget: Center(
        child: GestureDetector(
          onTap: () {
            appRouter.maybePop();
          },
          child: Text(
            S.of(context).cancel,
            style: textRegular.copyWith(
                fontSize: 14.spMin, color: Colors.indigoAccent),
          ).wrapPaddingLeft(5),
        ),
      ),
      titleWidget: Text(
        widget.index != null
            ? S.of(context).editContact
            : S.of(context).newContact,
        style: textMedium.copyWith(color: Colors.black),
      ),
      action: [
        GestureDetector(
          onTap: () {
            if (formKey.currentState!.validate()) {
              if (path.value.isNotEmpty) {
                // List<ContactData> updatedList =
                //     List.from(contactDataList.value);
                if (widget.index != null) {
                  contactDataList.value[widget.index!] = ContactData(
                    Image: path.value,
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    number: phoneController.text,
                  );
                  appRouter.maybePop();
                } else {
                  contactDataList.value.add(ContactData(
                    Image: path.value,
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    number: phoneController.text,
                  ));
                  appRouter.maybePop();
                  // contactDataList.value =
                  //     updatedList; //for notify to list bcz it directly can't notify
                }
                contactDataList.notifyListeners();
              } else {
                showMessage(S.of(context).pleaseAddAPhoto);
              }
            }
          },
          child: Center(
            child: Text(
              S.of(context).done,
              style:
                  textMedium.copyWith(fontSize: 14.spMin, color: AppColor.grey),
            ).wrapPaddingOnly(left: 15, right: 15),
          ),
        ),
      ],
    );
  }

  Widget buildView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        10.verticalSpace,
        ValueListenableBuilder(
          valueListenable: path,
          builder: (context, value, child) {
            return Center(
              child: path.value != ""
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        File(path.value),
                        height: 125.r,
                        width: 125.r,
                        fit: BoxFit.fill,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        Assets.imageProfile,
                        height: 125.r,
                        width: 125.w,
                        fit: BoxFit.fill,
                      ),
                    ),
            );
          },
        ),
        10.verticalSpace,
        GestureDetector(
          onTap: () {
            _pickImageFromCamera();
          },
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.grey.withOpacity(0.40),
                  borderRadius: BorderRadius.circular(15).r),
              child: Text(
                widget.index != null
                    ? S.of(context).editPhoto
                    : S.of(context).addPhoto,
                style: textMedium.copyWith(
                    fontSize: 14.spMin, color: AppColor.black),
              ).wrapPaddingSymmetric(vertical: 5, horizontal: 15),
            ),
          ),
        ),
        15.verticalSpace,
        Form(
          key: formKey,
          child: buildContactForm(),
        ),
        25.verticalSpace,
        widget.index != null
            ? GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Are you sure! you want to delete?"),
                        actions: [
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              appRouter.maybePop();
                            },
                          ),
                          TextButton(
                            child: Text("ok"),
                            onPressed: () {
                              contactDataList.value.removeAt(widget.index!);
                              contactDataList.notifyListeners();
                              appRouter.replaceAll([ContactListRoute()]);
                              showMessage(
                                  S.of(context).contactDeletedSuccesfully);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.grey.withOpacity(0.40),
                      borderRadius: BorderRadius.circular(15).r),
                  child: Text(
                    S.of(context).deleteContact,
                    style: textMedium.copyWith(
                        fontSize: 14.spMin, color: AppColor.red),
                  ).wrapPaddingSymmetric(vertical: 5, horizontal: 15),
                ).wrapPaddingRight(10),
              )
            : SizedBox.shrink(),
      ],
    );
  }

  Widget buildContactForm() {
    return Column(
      children: [
        AppTextField(
          keyboardType: TextInputType.name,
          keyboardAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          controller: firstNameController,
          validators: firstNameValidator,
          label: "",
          hint: S.of(context).firstName,
          contentPadding: EdgeInsets.only(left: 15).r,
          hintStyle:
              textRegular.copyWith(fontSize: 14.spMin, color: AppColor.grey),
          borderRadius: BorderRadius.zero,
          filled: true,
          fillColor: AppColor.white,
        ),
        1.verticalSpace,
        AppTextField(
          keyboardType: TextInputType.name,
          keyboardAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          controller: lastNameController,
          validators: lastNameValidator,
          label: "",
          hint: S.of(context).lastName,
          contentPadding: EdgeInsets.only(left: 15).r,
          hintStyle:
              textRegular.copyWith(fontSize: 14.spMin, color: AppColor.grey),
          borderRadius: BorderRadius.zero,
          filled: true,
          fillColor: AppColor.white,
        ),
        1.verticalSpace,
        AppTextField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          prefixIcon: Container(
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            child: Icon(
              Icons.add,
              color: AppColor.white,
              size: 15.r,
            ),
          ).wrapPaddingOnly(left: 15, right: 15),
          maxLength: 10,
          keyboardType: TextInputType.phone,
          keyboardAction: TextInputAction.done,
          textCapitalization: TextCapitalization.none,
          validators: phoneValidator,
          controller: phoneController,
          label: "",
          hint: S.of(context).phoneNumber,
          contentPadding: EdgeInsets.only(left: 15).r,
          hintStyle:
              textRegular.copyWith(fontSize: 14.spMin, color: AppColor.grey),
          borderRadius: BorderRadius.zero,
          filled: true,
          fillColor: AppColor.white,
        ),
      ],
    );
  }

  _pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? returnImage =
        await picker.pickImage(source: ImageSource.camera);
    if (returnImage != null) {
      path.value = returnImage.path;
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
