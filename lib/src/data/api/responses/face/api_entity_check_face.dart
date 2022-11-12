import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/face/api_entity_face.dart';

part 'api_entity_check_face.g.dart';

@JsonSerializable()
@internal
class ApiEntityCheckFace {
  @JsonKey(name: 'status', defaultValue: 0)
  final int status;

  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @JsonKey(name: 'request_id', defaultValue: '')
  final String requestId;

  @JsonKey(name: 'face')
  final ApiEntityFace? face;

  ApiEntityCheckFace({
    required this.status,
    required this.message,
    required this.requestId,
    required this.face,
  });

  factory ApiEntityCheckFace.fromJson(Map<String, dynamic> json) => _$ApiEntityCheckFaceFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityCheckFaceToJson(this);
}
