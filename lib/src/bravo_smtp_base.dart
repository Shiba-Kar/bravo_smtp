// TODO: Put public facing types in this file.

import 'package:bravo_smtp/bravo_smtp.dart';
import 'package:bravo_smtp/src/smtp_service.dart';

/// Checks if you are awesome. Spoiler: you are.
///
export 'models/models.dart';

class BravoSMTP {
  BravoSMTP(this.apiKey);
  final String apiKey;
  late SmtpService _smtpService;

  Future<bool> sendEMAIL(Body body) async {
    _smtpService = SmtpService(apiKey);
    try {
      await _smtpService.sendEMAIL(body);
      return true;
    } catch (_) {
      return false;
    }
  }
}
