import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/api_entity_location_face.dart';

part 'api_entity_face_spoofing.g.dart';

@JsonSerializable()
@internal
class ApiEntityFaceSpoofing {
  @JsonKey(name: 'probability')
  final double probability;

  ApiEntityFaceSpoofing({
    required this.probability,
  });

  factory ApiEntityFaceSpoofing.fromJson(Map<String, dynamic> json) => _$ApiEntityFaceSpoofingFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityFaceSpoofingToJson(this);
}
