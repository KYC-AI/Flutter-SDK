import 'package:json_annotation/json_annotation.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_face_document.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_field.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_location_document.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_string.dart';

part 'api_entity_document.g.dart';

@JsonSerializable()
class ApiEntityDocument {
  @JsonKey(name: 'fake')
  final String? fake;

  @JsonKey(name: 'brightness')
  final double? brightness;

  @JsonKey(name: 'content')
  final String? content;

  @JsonKey(name: 'location')
  final ApiEntityLocationDocument? location;

  @JsonKey(name: 'face')
  final ApiEntityFace? face;

  @JsonKey(name: 'visual_fields')
  final List<ApiEntityField>? visualFields;

  @JsonKey(name: 'mrz_fields')
  final List<ApiEntityField>? mrzFields;

  @JsonKey(name: 'mrz_strings')
  final List<ApiEntityString>? mrzStrings;

  ApiEntityDocument({
    required this.fake,
    required this.brightness,
    required this.content,
    required this.location,
    required this.face,
    required this.visualFields,
    required this.mrzFields,
    required this.mrzStrings,
  });

  factory ApiEntityDocument.fromJson(Map<String, dynamic> json) => _$ApiEntityDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityDocumentToJson(this);
}
