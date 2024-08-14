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

import '../../../../data/my_data/contacts/contact_data.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../widget/base_app_bar.dart';
import '../store/contact_store.dart';

@RoutePage()
class AddContactPage extends StatefulWidget {
  final ContactData? contactData;
  final int? id;
  const AddContactPage({super.key, required this.contactData, this.id});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  ValueNotifier<String> path = ValueNotifier("");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.contactData != null) {
      firstNameController.text = widget.contactData!.firstName;
      lastNameController.text = widget.contactData!.lastName;
      phoneController.text = widget.contactData!.number;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray,
      appBar: buildAppBar(),
      body: buildView(),
      bottomNavigationBar:
          widget.id != null ? buildAddToFavoritesView() : SizedBox.shrink(),
    );
  }

  /** appbar which have done button and add new contacts details */
  buildAppBar() {
    return BaseAppBar(
      backgroundColor: AppColor.gray,
      showTitle: true,
      centerTitle: true,
      leadingIcon: true,
      leadingWidget: Center(
        child: GestureDetector(
          onTap: () {
            _popPage();
          },
          child: Text(
            S.of(context).cancel,
            style: textRegular.copyWith(
                fontSize: 14.spMin, color: Colors.indigoAccent),
          ).wrapPaddingLeft(5),
        ),
      ),
      titleWidget: Text(
        widget.id != null
            ? S.of(context).editContact
            : S.of(context).newContact,
        style: textMedium.copyWith(color: Colors.black),
      ),
      action: [
        ValueListenableBuilder(
          valueListenable: path,
          builder: (context, value, child) {
            return GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  if (widget.id != null) {
                    contactStore.updateData(
                        firstNameController,
                        lastNameController,
                        phoneController,
                        path.value,
                        widget.id!,
                        widget.contactData!.isFavorite,
                        widget.contactData?.image);
                    _popPage();
                  } else {
                    contactStore.addData(firstNameController,
                        lastNameController, phoneController, path.value);
                    showMessage(S.of(context).contactAddedSuccesfully);
                    _popPage();
                  }
                }
              },
              child: Center(
                child: Text(
                  S.of(context).done,
                  style: textMedium.copyWith(
                      fontSize: 14.spMin, color: AppColor.grey),
                ).wrapPaddingOnly(left: 15, right: 15),
              ),
            );
          },
        ),
      ],
    );
  }

  /** view below the app bar */
  Widget buildView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.verticalSpace,
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: ValueListenableBuilder(
                valueListenable: path,
                builder: (context, value, child) {
                  var contactImage = path.value.isNotEmpty
                      ? File(path.value)
                      : (widget.contactData?.image is File
                          ? widget.contactData?.image
                          : null);
                  return contactImage != null
                      ? Image.file(
                          contactImage,
                          height: 125.r,
                          width: 125.w,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          Assets.imageProfile,
                          height: 125.r,
                          width: 125.w,
                          fit: BoxFit.fill,
                        );
                },
              ),
            ),
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
                  widget.id != null
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
          widget.id != null
              ? GestureDetector(
                  onTap: () {
                    alertDialogueForDeleteContact();
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
      ),
    );
  }

  /** form that contains fields like firstname,lastname & number */
  Widget buildContactForm() {
    return Column(
      children: [
        AppTextField(
          keyboardType: TextInputType.name,
          keyboardAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          controller: firstNameController,
          validators: firstNameValidator,
          maxLength: 15,
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
          maxLength: 15,
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

  /** This is a view for add to favorites contacts at bottom */
  Widget buildAddToFavoritesView() {
    return ValueListenableBuilder(
      valueListenable: widget.contactData!.isFavorite,
      builder: (context, value, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                widget.contactData!.isFavorite.value =
                    !widget.contactData!.isFavorite.value;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    value == false
                        ? S.of(context).addToFavorites
                        : S.of(context).removeFromFavorites,
                    style: textMedium.copyWith(
                        fontSize: 14.spMin, color: AppColor.black),
                  ),
                  value != false
                      ? Icon(
                          Icons.favorite,
                          size: 22.r,
                          color: AppColor.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                          size: 22.r,
                          color: AppColor.red,
                        ),
                ],
              ),
            )
          ],
        ).wrapPaddingBottom(20);
      },
    );
  }

  /** for back the existing page */
  _popPage() {
    appRouter.maybePop();
  }

  /** alert dialogue when user delete a contact */
  alertDialogueForDeleteContact() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).areYouSureYouWantToDelete),
          actions: [
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                _popPage();
              },
            ),
            TextButton(
              child: Text(S.of(context).ok),
              onPressed: () {
                contactStore.contactDataList.removeAt(widget.id! - 1);
                appRouter.replaceAll([ContactListRoute()]);
                showMessage(S.of(context).contactDeletedSuccesfully);
              },
            ),
          ],
        );
      },
    );
  }

  /** an image picker for profile image of contacts */
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
    path.dispose();
    super.dispose();
  }
}
