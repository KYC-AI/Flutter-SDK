// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_check_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEntityCheckDocument _$ApiEntityCheckDocumentFromJson(
        Map<String, dynamic> json) =>
    ApiEntityCheckDocument(
      status: json['status'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      requestId: json['request_id'] as String? ?? '',
      document: json['document'] == null
          ? null
          : ApiEntityDocument.fromJson(
              json['document'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiEntityCheckDocumentToJson(
        ApiEntityCheckDocument instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'request_id': instance.requestId,
      'document': instance.document,
    };
