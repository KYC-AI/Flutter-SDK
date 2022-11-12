import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:stargaze_kyc_sdk/src/data/api/responses/document/api_entity_document.dart';

part 'api_entity_check_document.g.dart';

@JsonSerializable()
@internal
class ApiEntityCheckDocument {
  @JsonKey(name: 'status', defaultValue: 0)
  final int status;

  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @JsonKey(name: 'request_id', defaultValue: '')
  final String requestId;

  @JsonKey(name: 'document')
  final ApiEntityDocument? document;

  ApiEntityCheckDocument({
    required this.status,
    required this.message,
    required this.requestId,
    required this.document,
  });

  factory ApiEntityCheckDocument.fromJson(Map<String, dynamic> json) => _$ApiEntityCheckDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$ApiEntityCheckDocumentToJson(this);
}
