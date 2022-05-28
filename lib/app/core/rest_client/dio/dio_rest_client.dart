import 'package:dio/dio.dart';
import 'package:flutter_cuidapet/app/core/helpers/constants.dart';
import 'package:flutter_cuidapet/app/core/helpers/environments.dart';
import 'package:flutter_cuidapet/app/core/rest_client/rest_client.dart';
import 'package:flutter_cuidapet/app/core/rest_client/rest_client_exception.dart';
import 'package:flutter_cuidapet/app/core/rest_client/rest_cliente_response.dart';

class DioRestClient implements RestClient {
  late Dio _dio;

  final _defaultOptions = BaseOptions(
    baseUrl: Environments.param(Constants.ENV_BASE_URL_KEY) ?? '',
    connectTimeout: int.tryParse(
        Environments.param(Constants.ENV_RESTCLIENT_CONNECT_TIMEOUT) ?? '0'),
    receiveTimeout: int.tryParse(
        Environments.param(Constants.ENV_RESTCLIENT_RECEIVE_TIMEOUT) ?? '0'),
  );

  DioRestClient({BaseOptions? baseOptions}) {
    _dio = Dio(baseOptions ?? _defaultOptions);
  }

  @override
  RestClient auth() {
    _defaultOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  RestClient unAuth() {
    _defaultOptions.extra['auth_required'] = false;
    return this;
  }

  /// Method DELETE
  @override
  Future<RestClienteResponse<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioResponseException(e);
    }
  }

  /// Method GET
  @override
  Future<RestClienteResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioResponseException(e);
    }
  }

  /// Method PATCH
  @override
  Future<RestClienteResponse<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioResponseException(e);
    }
  }

  /// Method POST
  @override
  Future<RestClienteResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioResponseException(e);
    }
  }

  /// Method PUT
  @override
  Future<RestClienteResponse<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioResponseException(e);
    }
  }

  /// Method REQUEST
  @override
  Future<RestClienteResponse<T>> request<T>(
    String path, {
    required String method,
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      throw _dioResponseException(e);
    }
  }

  Future<RestClienteResponse<T>> _dioResponseConverter<T>(
      Response<dynamic> response) async {
    return RestClienteResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _dioResponseException(DioError error) {
    throw RestClientException(
      error: error.error,
      response: RestClienteResponse(
        data: error.response?.data,
        statusCode: error.response?.statusCode,
        statusMessage: error.response?.statusMessage,
      ),
    );
  }
}
