import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> staffLogin(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://cms.sucsa.org:8005/api/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> studentLogin(String studentId, String password) async {
    final response = await http.post(
      Uri.parse('https://sucsa.org:8004/api/app/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'studentId': studentId,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }


}
