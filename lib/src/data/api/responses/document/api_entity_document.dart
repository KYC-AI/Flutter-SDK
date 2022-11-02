import 'package:json_annotation/json_annotation.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_face_document.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_location_document.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_visual_fields.dart';

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
  final ApiEntityVisualFields? visualFields;

  ApiEntityDocument({
    required this.fake,
    required this.brightness,
    required this.content,
    required this.location,
    required this.face,
    required this.visualFields,
  });

  factory ApiEntityDocument.fromJson(Map<String, dynamic> json) => _$ApiEntityDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityDocumentToJson(this);
}
