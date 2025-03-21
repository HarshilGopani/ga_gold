// coverage:ignore-file
/// [ResponseModel] handels the Api [data], [statusCode] and tells
/// api is called Successfully or it has error while calling.
class ResponseModel {
  ResponseModel({
    required this.data,
    required this.hasError,
    this.statusCode,
  });
  final String data;
  final bool hasError;
  final int? statusCode;
}
