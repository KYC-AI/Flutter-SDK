import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'api_entity_face_representation.g.dart';

@JsonSerializable()
@internal
class ApiEntityFaceRepresentation {
  @JsonKey(name: 'version')
  final int version;

  @JsonKey(name: 'recommended_threshold')
  final double recommendedThreshold;

  @JsonKey(name: 'vector')
  final List<double> vector;

  ApiEntityFaceRepresentation({
    required this.version,
    required this.recommendedThreshold,
    required this.vector,
  });

  factory ApiEntityFaceRepresentation.fromJson(Map<String, dynamic> json) => _$ApiEntityFaceRepresentationFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityFaceRepresentationToJson(this);
}
