import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_entity_location_face.g.dart';

@JsonSerializable()
@internal
class ApiEntityLocationFace {
  @JsonKey(name: 'top')
  final double top;

  @JsonKey(name: 'bottom')
  final double bottom;

  @JsonKey(name: 'left')
  final double left;

  @JsonKey(name: 'right')
  final double right;

  ApiEntityLocationFace({
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
  });

  factory ApiEntityLocationFace.fromJson(Map<String, dynamic> json) => _$ApiEntityLocationFaceFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityLocationFaceToJson(this);
}
