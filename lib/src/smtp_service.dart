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

  Future<bool> sendEMAIL(Body body) async {
    try {
      _dio.post('/smtp/email', data: body.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
/* curl --request POST \
  --url https://api.brevo.com/v3/smtp/email \
  --header 'accept: application/json' \
  --header 'api-key:YOUR_API_KEY' \
  --header 'content-type: application/json' \
  --data '{  
   "sender":{  
      "name":"Sender Alex",
      "email":"senderalex@example.com"
   },
   "to":[  
      {  
         "email":"testmail@example.com",
         "name":"John Doe"
      }
   ],
   "subject":"Hello world",
   "htmlContent":"<html><head></head><body><p>Hello,</p>This is my first transactional email sent from Brevo.</p></body></html>"
}' */