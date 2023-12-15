import 'dart:convert';

import 'package:http/http.dart' as http;

class PaymentService {
  static Future<Map<String, dynamic>> createTestPaymentSheet(
      final double doubleAmount) async {
    final int amount = (doubleAmount * 100).toInt();
    final url = Uri.parse('http://10.0.2.2:1111/api/stripe/create');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'amount': amount,
      }),
    );
    final body = json.decode(response.body);
    if (body['error'] != null) {
      throw Exception(body['error']);
    }
    return body;
  }

  static Future<void> reportErrorToBackend(Exception e) async {
    final url = Uri.parse('http://10.0.2.2:1111/api/stripe/error');
    await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'error': e.toString(),
      }),
    );
  }

  static Future<bool> confirmPaymentIntent(final String paymentIntent) async {
    final url = Uri.parse('http://10.0.2.2:1111/api/stripe/confirm');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'paymentIntent': paymentIntent,
      }),
    );
    final body = json.decode(response.body);
    return body["success"];
  }
}
