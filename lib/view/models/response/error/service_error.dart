import 'package:techgrains/com/techgrains/service/error/tg_error.dart';

class ServiceError extends TGError {
  double? timestamp;
  int? status;
  int? code;
  String? message;
  List<dynamic>? details;
  String? error;
  List<dynamic>? args;

  ServiceError({
    this.timestamp,
    this.status,
    this.code,
    this.message,
    this.details,
    this.error,
    this.args,
  });

  @override
  ServiceError fromJson(dynamic json) {
    return ServiceError(
        timestamp: json['timestamp'],
        status: json['status'],
        code: json['code'],
        message: json['message'],
        details: json['details'],
        error: json['error'],
        args: json['args']);
  }
}
