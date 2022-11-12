import 'package:json_annotation/json_annotation.dart';

part 'api_entity_string.g.dart';

@JsonSerializable()
class ApiEntityString {

  @JsonKey(name: 'confidence')
  final double confidence;

  @JsonKey(name: 'value')
  final String value;

  ApiEntityString({
    required this.confidence,
    required this.value,
  });

  factory ApiEntityString.fromJson(Map<String, dynamic> json) => _$ApiEntityStringFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityStringToJson(this);
}
