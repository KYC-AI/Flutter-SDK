import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'api_entity_field.g.dart';

@JsonSerializable()
@internal
class ApiEntityField {
  @JsonKey(name: 'field')
  final String field;

  @JsonKey(name: 'confidence')
  final double confidence;

  @JsonKey(name: 'value')
  final String value;

  @JsonKey(name: 'lang', defaultValue: null)
  final String? lang;

  ApiEntityField({
    required this.field,
    required this.confidence,
    required this.value,
    required this.lang,
  });

  factory ApiEntityField.fromJson(Map<String, dynamic> json) => _$ApiEntityFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityFieldToJson(this);
}
