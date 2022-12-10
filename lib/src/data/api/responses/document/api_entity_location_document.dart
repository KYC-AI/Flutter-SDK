import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'api_entity_location_document.g.dart';

@JsonSerializable()
@internal
class ApiEntityLocationDocument {
  @JsonKey(name: 'top_left', defaultValue: [0.0, 0.0])
  final List<double> topLeft;

  @JsonKey(name: 'top_right', defaultValue: [0.0, 0.0])
  final List<double> topRight;

  @JsonKey(name: 'bottom_left', defaultValue: [0.0, 0.0])
  final List<double> bottomLeft;

  @JsonKey(name: 'bottom_right', defaultValue: [0.0, 0.0])
  final List<double> bottomRight;

  ApiEntityLocationDocument({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  factory ApiEntityLocationDocument.fromJson(Map<String, dynamic> json) => _$ApiEntityLocationDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityLocationDocumentToJson(this);
}
