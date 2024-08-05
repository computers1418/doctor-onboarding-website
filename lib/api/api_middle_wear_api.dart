import 'package:dio/dio.dart';
import 'package:doctor_app/constants/api_constant.dart';

import 'api.dart';
import 'networking.dart';

class ApiMiddleWear extends APIInterface {
  String url;
  dynamic data;

  ApiMiddleWear({required this.url, this.data});

  DioService dio = DioService(
    dioClient: Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        validateStatus: (status) {
          return true;
        },
      ),
    ),
  );

  @override
  Future<Response> delete() async {
    final response = await dio.delete(endpoint: url);
    return response;
  }

  @override
  Future<Response> get() async {
    final response = await dio.get(endpoint: url);
    return response;
  }

  @override
  Future<Response> patch() {
    throw UnimplementedError();
  }

  @override
  Future<Response> post({Options? options}) async {
    final response = await dio.post(
      endpoint: url,
      data: data,
      options: options,
    );
    return response;
  }
}
