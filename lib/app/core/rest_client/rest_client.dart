import 'package:flutter_cuidapet/app/core/rest_client/rest_cliente_response.dart';

abstract class RestClient {
  RestClient auth();
  RestClient unAuth();

  Future<RestClienteResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClienteResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClienteResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClienteResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClienteResponse<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClienteResponse<T>> request<T>(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
