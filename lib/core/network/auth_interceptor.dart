import 'package:dio/dio.dart';
import 'package:heros/core/security/token_provider.dart';

class AuthInterceptor extends Interceptor {
  final TokenProvider tokenProvider;

  AuthInterceptor(this.tokenProvider);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await tokenProvider.getToken();
      if (token != null && token.isNotEmpty) {
        if (!options.path.startsWith('/$token')) {
          options.path = '/$token${options.path}';
        }
      }

      handler.next(options);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: e,
        ),
      );
    }
  }
}
