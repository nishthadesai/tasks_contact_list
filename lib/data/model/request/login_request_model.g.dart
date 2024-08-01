// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      email: json['email'] as String?,
      userType: json['user_type'] as String?,
      loginType: json['login_type'] as String?,
      deviceType: json['device_type'] as String?,
      deviceToken: json['device_token'] as String?,
      countryCode: json['country_code'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      ip: json['ip'] as String?,
      uuid: json['uuid'] as String?,
      osVersion: json['os_version'] as String?,
      deviceModel: json['device_model'] as String?,
      socialId: json['social_id'] as String?,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('user_type', instance.userType);
  writeNotNull('login_type', instance.loginType);
  writeNotNull('device_type', instance.deviceType);
  writeNotNull('device_token', instance.deviceToken);
  writeNotNull('country_code', instance.countryCode);
  writeNotNull('phone', instance.phone);
  writeNotNull('password', instance.password);
  writeNotNull('address', instance.address);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('ip', instance.ip);
  writeNotNull('uuid', instance.uuid);
  writeNotNull('os_version', instance.osVersion);
  writeNotNull('device_model', instance.deviceModel);
  writeNotNull('social_id', instance.socialId);
  return val;
}
