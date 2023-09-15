import 'dart:convert';

import 'package:bravo_smtp/src/models/body.dart';
import 'package:dio/dio.dart';

class SmtpService {
  final String apiKey;
  final Dio _dio;
  SmtpService(this.apiKey)
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.brevo.com/v3',
            headers: {
              'accept': "application/json",
              "api-key": apiKey,
              "content-type": "application/json",
            },
          ),
        );

  Future<void> sendEMAIL(Body body) async {
    try {
      await _dio.post('/smtp/email', data: json.encode(body.toJson()));
    } on DioException catch (e) {
      print(e.response);
    }
  }

  Future<UnimplementedError> sendTemplateEMAIL() async {
    return UnimplementedError();
  }
}
