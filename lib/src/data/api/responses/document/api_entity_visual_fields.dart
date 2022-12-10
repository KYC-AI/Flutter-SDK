import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_field.dart';

part 'api_entity_visual_fields.g.dart';

@JsonSerializable()
@internal
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

  @JsonKey(name: 'issue_date')
  final ApiEntityField? issueDate;

  @JsonKey(name: 'authority')
  final ApiEntityField? authority;

  @JsonKey(name: 'tax_number')
  final ApiEntityField? taxNumber;

  @JsonKey(name: 'place_of_birth_uk')
  final ApiEntityField? placeOfBirthUk;

  @JsonKey(name: 'place_of_birth_en')
  final ApiEntityField? placeOfBirthEn;

  @JsonKey(name: 'nationality_en')
  final ApiEntityField? nationalityEn;

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
    required this.issueDate,
    required this.authority,
    required this.taxNumber,
    required this.placeOfBirthUk,
    required this.placeOfBirthEn,
    required this.nationalityEn,
  });

  factory ApiEntityVisualFields.fromJson(Map<String, dynamic> json) => _$ApiEntityVisualFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityVisualFieldsToJson(this);
}
