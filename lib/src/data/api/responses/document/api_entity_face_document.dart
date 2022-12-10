import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/api_entity_location_face.dart';

part 'api_entity_face_document.g.dart';

@JsonSerializable()
@internal
class ApiEntityFace {
  @JsonKey(name: 'location')
  final ApiEntityLocationFace location;

  @JsonKey(name: 'content')
  final String? content;

  ApiEntityFace({
    required this.location,
    required this.content,
  });

  factory ApiEntityFace.fromJson(Map<String, dynamic> json) => _$ApiEntityFaceFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityFaceToJson(this);
}
