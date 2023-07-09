import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WalletService {
  Future<void> updatePin(String oldPin, String newPin) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.put(Uri.parse('$baseUrl/wallets'), headers: {
        'Authorization': token,
      }, body: {
        'previous_pin': oldPin,
        'new_pin': newPin,
      });
      print(token);
      print(res);

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}