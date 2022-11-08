// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_visual_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityVisualFields _$ApiEntityVisualFieldsFromJson(
        Map<String, dynamic> json) =>
    ApiEntityVisualFields(
      firstNameUk: json['first_name_uk'] == null
          ? null
          : ApiEntityField.fromJson(
              json['first_name_uk'] as Map<String, dynamic>),
      firstNameEn: json['first_name_en'] == null
          ? null
          : ApiEntityField.fromJson(
              json['first_name_en'] as Map<String, dynamic>),
      lastNameUk: json['last_name_uk'] == null
          ? null
          : ApiEntityField.fromJson(
              json['last_name_uk'] as Map<String, dynamic>),
      lastNameEn: json['last_name_en'] == null
          ? null
          : ApiEntityField.fromJson(
              json['last_name_en'] as Map<String, dynamic>),
      middleNameUk: json['middle_name_uk'] == null
          ? null
          : ApiEntityField.fromJson(
              json['middle_name_uk'] as Map<String, dynamic>),
      documentNumber: json['document_number'] == null
          ? null
          : ApiEntityField.fromJson(
              json['document_number'] as Map<String, dynamic>),
      recordNumber: json['record_number'] == null
          ? null
          : ApiEntityField.fromJson(
              json['record_number'] as Map<String, dynamic>),
      dob: json['dob'] == null
          ? null
          : ApiEntityField.fromJson(json['dob'] as Map<String, dynamic>),
      expirationDate: json['expiration_date'] == null
          ? null
          : ApiEntityField.fromJson(
              json['expiration_date'] as Map<String, dynamic>),
      gender: json['gender'] == null
          ? null
          : ApiEntityField.fromJson(json['gender'] as Map<String, dynamic>),
      issueDate: json['issue_date'] == null
          ? null
          : ApiEntityField.fromJson(json['issue_date'] as Map<String, dynamic>),
      authority: json['authority'] == null
          ? null
          : ApiEntityField.fromJson(json['authority'] as Map<String, dynamic>),
      taxNumber: json['tax_number'] == null
          ? null
          : ApiEntityField.fromJson(json['tax_number'] as Map<String, dynamic>),
      placeOfBirthUk: json['place_of_birth_uk'] == null
          ? null
          : ApiEntityField.fromJson(
              json['place_of_birth_uk'] as Map<String, dynamic>),
      placeOfBirthEn: json['place_of_birth_en'] == null
          ? null
          : ApiEntityField.fromJson(
              json['place_of_birth_en'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiEntityVisualFieldsToJson(
        ApiEntityVisualFields instance) =>
    <String, dynamic>{
      'first_name_uk': instance.firstNameUk,
      'first_name_en': instance.firstNameEn,
      'last_name_uk': instance.lastNameUk,
      'last_name_en': instance.lastNameEn,
      'middle_name_uk': instance.middleNameUk,
      'document_number': instance.documentNumber,
      'record_number': instance.recordNumber,
      'dob': instance.dob,
      'expiration_date': instance.expirationDate,
      'gender': instance.gender,
      'issue_date': instance.issueDate,
      'authority': instance.authority,
      'tax_number': instance.taxNumber,
      'place_of_birth_uk': instance.placeOfBirthUk,
      'place_of_birth_en': instance.placeOfBirthEn,
    };
