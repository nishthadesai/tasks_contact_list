// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Demo Structure`
  String get applicationTitle {
    return Intl.message(
      'Flutter Demo Structure',
      name: 'applicationTitle',
      desc: '',
      args: [],
    );
  }

  /// `The connection has timed out. Please try again`
  String get connectionTimedOut {
    return Intl.message(
      'The connection has timed out. Please try again',
      name: 'connectionTimedOut',
      desc: '',
      args: [],
    );
  }

  /// `There are some problems with the connection. Please try again`
  String get connectionProblem {
    return Intl.message(
      'There are some problems with the connection. Please try again',
      name: 'connectionProblem',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credentials`
  String get invalidCredentials {
    return Intl.message(
      'Invalid credentials',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Response is null`
  String get responseNull {
    return Intl.message(
      'Response is null',
      name: 'responseNull',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Connect timeout`
  String get connectTimeout {
    return Intl.message(
      'Connect timeout',
      name: 'connectTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout`
  String get receiveTimeout {
    return Intl.message(
      'Receive timeout',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout`
  String get sendTimeout {
    return Intl.message(
      'Send timeout',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Please check internet connection`
  String get pleaseCheckInternetConnection {
    return Intl.message(
      'Please check internet connection',
      name: 'pleaseCheckInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Server error.`
  String get serverError {
    return Intl.message(
      'Server error.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get unknownError {
    return Intl.message(
      'Unknown error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Server unknown error`
  String get serverUnknownError {
    return Intl.message(
      'Server unknown error',
      name: 'serverUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Server not found`
  String get serverNotFound {
    return Intl.message(
      'Server not found',
      name: 'serverNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Database exception`
  String get databaseException {
    return Intl.message(
      'Database exception',
      name: 'databaseException',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get welComeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welComeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue.`
  String get loginToContinue {
    return Intl.message(
      'Login to continue.',
      name: 'loginToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get kConfirm {
    return Intl.message(
      'Confirm',
      name: 'kConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure \n\nYou want to logout?`
  String get kLogoutMsg {
    return Intl.message(
      'Are you sure \n\nYou want to logout?',
      name: 'kLogoutMsg',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure \n\nYou want to delete account?`
  String get kDeleteAccount {
    return Intl.message(
      'Are you sure \n\nYou want to delete account?',
      name: 'kDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email address or mobile number`
  String get kEmptyField {
    return Intl.message(
      'Please enter email address or mobile number',
      name: 'kEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Please enter country code`
  String get kEnterCountryCode {
    return Intl.message(
      'Please enter country code',
      name: 'kEnterCountryCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter mobile number`
  String get kEnterMobileNumber {
    return Intl.message(
      'Please enter mobile number',
      name: 'kEnterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid mobile number`
  String get kEnterValidMobileNumber {
    return Intl.message(
      'Please enter valid mobile number',
      name: 'kEnterValidMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email address`
  String get kEnterValidEmailAddress {
    return Intl.message(
      'Please enter valid email address',
      name: 'kEnterValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email address`
  String get kEnterEmailAddress {
    return Intl.message(
      'Please enter email address',
      name: 'kEnterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter first name`
  String get kEnterFirstName {
    return Intl.message(
      'Please enter first name',
      name: 'kEnterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter at least 1 character for first name`
  String get kEnterValidFirstName {
    return Intl.message(
      'Please enter at least 1 character for first name',
      name: 'kEnterValidFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter last name`
  String get kEnterLastName {
    return Intl.message(
      'Please enter last name',
      name: 'kEnterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter at least 3 characters for last name`
  String get kEnterValidLastName {
    return Intl.message(
      'Please enter at least 3 characters for last name',
      name: 'kEnterValidLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get kEnterPassword {
    return Intl.message(
      'Please enter password',
      name: 'kEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password should be 8 or more characters`
  String get kEnterValidPassword {
    return Intl.message(
      'Password should be 8 or more characters',
      name: 'kEnterValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter new password`
  String get kEnterNewPassword {
    return Intl.message(
      'Please enter new password',
      name: 'kEnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter OTP`
  String get kPleaseEnterOtp {
    return Intl.message(
      'Please enter OTP',
      name: 'kPleaseEnterOtp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid OTP`
  String get kPleaseEnterValidOtp {
    return Intl.message(
      'Please enter valid OTP',
      name: 'kPleaseEnterValidOtp',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Data not found`
  String get dataNotFound {
    return Intl.message(
      'Data not found',
      name: 'dataNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Pick Image`
  String get pickImage {
    return Intl.message(
      'Pick Image',
      name: 'pickImage',
      desc: '',
      args: [],
    );
  }

  /// `Pick Video`
  String get pickVideo {
    return Intl.message(
      'Pick Video',
      name: 'pickVideo',
      desc: '',
      args: [],
    );
  }

  /// `Pick Documents`
  String get pickDocuments {
    return Intl.message(
      'Pick Documents',
      name: 'pickDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Pick Audio`
  String get pickAudio {
    return Intl.message(
      'Pick Audio',
      name: 'pickAudio',
      desc: '',
      args: [],
    );
  }

  /// `Add New Card`
  String get addNewCard {
    return Intl.message(
      'Add New Card',
      name: 'addNewCard',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your card details`
  String get addNewCardDesc {
    return Intl.message(
      'Please enter your card details',
      name: 'addNewCardDesc',
      desc: '',
      args: [],
    );
  }

  /// `Please enter card number`
  String get enterCardNumber {
    return Intl.message(
      'Please enter card number',
      name: 'enterCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter card name`
  String get enterCardName {
    return Intl.message(
      'Please enter card name',
      name: 'enterCardName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter expiry date`
  String get enterExpiryDate {
    return Intl.message(
      'Please enter expiry date',
      name: 'enterExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter cvv`
  String get enterCvv {
    return Intl.message(
      'Please enter cvv',
      name: 'enterCvv',
      desc: '',
      args: [],
    );
  }

  /// `Card is invalid`
  String get numberIsInvalid {
    return Intl.message(
      'Card is invalid',
      name: 'numberIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message(
      'Card Number',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Card Name`
  String get cardName {
    return Intl.message(
      'Card Name',
      name: 'cardName',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiryDate {
    return Intl.message(
      'Expiry Date',
      name: 'expiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Cvv`
  String get cvv {
    return Intl.message(
      'Cvv',
      name: 'cvv',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With`
  String get signInWith {
    return Intl.message(
      'Sign In With',
      name: 'signInWith',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get hello {
    return Intl.message(
      'Hello!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Forgot?`
  String get forgot {
    return Intl.message(
      'Forgot?',
      name: 'forgot',
      desc: '',
      args: [],
    );
  }

  /// `Don"t have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don"t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Fill your below detail to create account`
  String get fillDetails {
    return Intl.message(
      'Fill your below detail to create account',
      name: 'fillDetails',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobNumber',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter confirm password`
  String get kConfPassword {
    return Intl.message(
      'Please enter confirm password',
      name: 'kConfPassword',
      desc: '',
      args: [],
    );
  }

  /// `I agree to `
  String get iAgree {
    return Intl.message(
      'I agree to ',
      name: 'iAgree',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get tNc {
    return Intl.message(
      'Terms & Conditions',
      name: 'tNc',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy.`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy.',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Password and Confirm password not match`
  String get passwordMismatch {
    return Intl.message(
      'Password and Confirm password not match',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Please accept $tNc $and $privacyPolicy`
  String get acceptTnC {
    return Intl.message(
      'Please accept \$tNc \$and \$privacyPolicy',
      name: 'acceptTnC',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Picked file count: `
  String get pickedFileCount {
    return Intl.message(
      'Picked file count: ',
      name: 'pickedFileCount',
      desc: '',
      args: [],
    );
  }

  /// `Photo Permission`
  String get photoPermission {
    return Intl.message(
      'Photo Permission',
      name: 'photoPermission',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied always user need to allow manually`
  String get permissionDeniedAlwaysUserNeedToAllowManually {
    return Intl.message(
      'Permission denied always user need to allow manually',
      name: 'permissionDeniedAlwaysUserNeedToAllowManually',
      desc: '',
      args: [],
    );
  }

  /// `User Allowed to access photos`
  String get userAllowedToAccessPhotos {
    return Intl.message(
      'User Allowed to access photos',
      name: 'userAllowedToAccessPhotos',
      desc: '',
      args: [],
    );
  }

  /// `User Denied to access photos`
  String get userDeniedToAccessPhotos {
    return Intl.message(
      'User Denied to access photos',
      name: 'userDeniedToAccessPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Select your phone code`
  String get selectYourPhoneCode {
    return Intl.message(
      'Select your phone code',
      name: 'selectYourPhoneCode',
      desc: '',
      args: [],
    );
  }

  /// `Error During Communication:`
  String get errorDuringCommunication {
    return Intl.message(
      'Error During Communication:',
      name: 'errorDuringCommunication',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Request:`
  String get invalidRequest {
    return Intl.message(
      'Invalid Request:',
      name: 'invalidRequest',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorised:`
  String get unauthorised {
    return Intl.message(
      'Unauthorised:',
      name: 'unauthorised',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Input:`
  String get invalidInput {
    return Intl.message(
      'Invalid Input:',
      name: 'invalidInput',
      desc: '',
      args: [],
    );
  }

  /// `No Active Internet Connection`
  String get noActiveInternetConnection {
    return Intl.message(
      'No Active Internet Connection',
      name: 'noActiveInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Connection to server failed due to internet connection.`
  String get connectionToServerFailedDueToInternetConnection {
    return Intl.message(
      'Connection to server failed due to internet connection.',
      name: 'connectionToServerFailedDueToInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try after sometime.`
  String get somethingWentWrongPleaseTryAfterSometime {
    return Intl.message(
      'Something went wrong. Please try after sometime.',
      name: 'somethingWentWrongPleaseTryAfterSometime',
      desc: '',
      args: [],
    );
  }

  /// `Request to server was cancelled`
  String get requestToServerWasCancelled {
    return Intl.message(
      'Request to server was cancelled',
      name: 'requestToServerWasCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with server`
  String get connectionTimeoutWithServer {
    return Intl.message(
      'Connection timeout with server',
      name: 'connectionTimeoutWithServer',
      desc: '',
      args: [],
    );
  }

  /// `Request can't be handled for now. Please try after sometime.`
  String get requestCantBeHandledForNowPleaseTryAfterSometime {
    return Intl.message(
      'Request can\'t be handled for now. Please try after sometime.',
      name: 'requestCantBeHandledForNowPleaseTryAfterSometime',
      desc: '',
      args: [],
    );
  }

  /// `Please login again.`
  String get pleaseLoginAgain {
    return Intl.message(
      'Please login again.',
      name: 'pleaseLoginAgain',
      desc: '',
      args: [],
    );
  }

  /// `Something when wrong. Please try again.`
  String get somethingWhenWrongPleaseTryAgain {
    return Intl.message(
      'Something when wrong. Please try again.',
      name: 'somethingWhenWrongPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Error uploading photo`
  String get errorUploadingPhoto {
    return Intl.message(
      'Error uploading photo',
      name: 'errorUploadingPhoto',
      desc: '',
      args: [],
    );
  }

  /// `CVV is invalid`
  String get cvvIsInvalid {
    return Intl.message(
      'CVV is invalid',
      name: 'cvvIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Expiry month is invalid`
  String get expiryMonthIsInvalid {
    return Intl.message(
      'Expiry month is invalid',
      name: 'expiryMonthIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Expiry year is invalid`
  String get expiryYearIsInvalid {
    return Intl.message(
      'Expiry year is invalid',
      name: 'expiryYearIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Card has expired`
  String get cardHasExpired {
    return Intl.message(
      'Card has expired',
      name: 'cardHasExpired',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get pleaseCheckYourInternetConnection {
    return Intl.message(
      'Please check your internet connection',
      name: 'pleaseCheckYourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Add employee`
  String get addEmployee {
    return Intl.message(
      'Add employee',
      name: 'addEmployee',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list {
    return Intl.message(
      'List',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `New Contact`
  String get newContact {
    return Intl.message(
      'New Contact',
      name: 'newContact',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Add Photo`
  String get addPhoto {
    return Intl.message(
      'Add Photo',
      name: 'addPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid phone number`
  String get pleaseEnterValidPhoneNumber {
    return Intl.message(
      'Please enter valid phone number',
      name: 'pleaseEnterValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get pleaseEnterPhoneNumber {
    return Intl.message(
      'Please enter phone number',
      name: 'pleaseEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `No contacts yet`
  String get noContactsYet {
    return Intl.message(
      'No contacts yet',
      name: 'noContactsYet',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Edit Contact`
  String get editContact {
    return Intl.message(
      'Edit Contact',
      name: 'editContact',
      desc: '',
      args: [],
    );
  }

  /// `Please add a photo`
  String get pleaseAddAPhoto {
    return Intl.message(
      'Please add a photo',
      name: 'pleaseAddAPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Edit Photo`
  String get editPhoto {
    return Intl.message(
      'Edit Photo',
      name: 'editPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Contact Deleted Succesfully`
  String get contactDeletedSuccesfully {
    return Intl.message(
      'Contact Deleted Succesfully',
      name: 'contactDeletedSuccesfully',
      desc: '',
      args: [],
    );
  }

  /// `Delete Contact`
  String get deleteContact {
    return Intl.message(
      'Delete Contact',
      name: 'deleteContact',
      desc: '',
      args: [],
    );
  }

  /// `No Contacts found`
  String get noContactsFound {
    return Intl.message(
      'No Contacts found',
      name: 'noContactsFound',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure! you want to delete?`
  String get areYouSureYouWantToDelete {
    return Intl.message(
      'Are you sure! you want to delete?',
      name: 'areYouSureYouWantToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Select all`
  String get selectAll {
    return Intl.message(
      'Select all',
      name: 'selectAll',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Contact deleted Successfully`
  String get contactDeletedSuccessfully {
    return Intl.message(
      'Contact deleted Successfully',
      name: 'contactDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Add to favorite`
  String get addToFavorite {
    return Intl.message(
      'Add to favorite',
      name: 'addToFavorite',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
