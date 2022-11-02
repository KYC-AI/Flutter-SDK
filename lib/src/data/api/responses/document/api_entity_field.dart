import 'package:json_annotation/json_annotation.dart';

part 'api_entity_field.g.dart';

@JsonSerializable()
class ApiEntityField {
  @JsonKey(name: 'confidence')
  final double confidence;

  @JsonKey(name: 'value')
  final String value;

  ApiEntityField({
    required this.confidence,
    required this.value,
  });

  factory ApiEntityField.fromJson(Map<String, dynamic> json) => _$ApiEntityFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityFieldToJson(this);
}
