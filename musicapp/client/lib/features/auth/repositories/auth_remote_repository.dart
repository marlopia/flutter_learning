import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<void> singup({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(
        'http://10.0.2.2:8000/auth/signup',
      ), //10.0.2.2 es el localhost del host del emulador android
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );
    print(response.body);
    print(response.statusCode);
  }

  Future<void> login() async {}
}
