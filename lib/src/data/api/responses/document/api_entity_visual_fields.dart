import 'package:json_annotation/json_annotation.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_field.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/api_entity_location_face.dart';

part 'api_entity_visual_fields.g.dart';

@JsonSerializable()
class ApiEntityVisualFields {
  @JsonKey(name: 'first_name_uk')
  final ApiEntityField? firstNameUk;

  @JsonKey(name: 'first_name_en')
  final ApiEntityField? firstNameEn;

  @JsonKey(name: 'last_name_uk')
  final ApiEntityField? lastNameUk;

  @JsonKey(name: 'last_name_en')
  final ApiEntityField? lastNameEn;

  @JsonKey(name: 'middle_name_uk')
  final ApiEntityField? middleNameUk;

  @JsonKey(name: 'document_number')
  final ApiEntityField? documentNumber;

  @JsonKey(name: 'record_number')
  final ApiEntityField? recordNumber;

  @JsonKey(name: 'dob')
  final ApiEntityField? dob;

  @JsonKey(name: 'expiration_date')
  final ApiEntityField? expirationDate;

  @JsonKey(name: 'gender')
  final ApiEntityField? gender;

  ApiEntityVisualFields({
    required this.firstNameUk,
    required this.firstNameEn,
    required this.lastNameUk,
    required this.lastNameEn,
    required this.middleNameUk,
    required this.documentNumber,
    required this.recordNumber,
    required this.dob,
    required this.expirationDate,
    required this.gender,
  });

  factory ApiEntityVisualFields.fromJson(Map<String, dynamic> json) => _$ApiEntityVisualFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityVisualFieldsToJson(this);
}
