class RestClienteResponse<T> {
  T? data;
  int? statusCode;
  String? statusMessage;

  RestClienteResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}
