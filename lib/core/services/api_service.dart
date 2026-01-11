import 'dart:convert';
import 'package:http/http.dart' as http;
import 'storage_service.dart';

class ApiService {
  static const int timeoutSeconds = 30;
  
  static Map<String, String> _getHeaders({bool auth = false}) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    
    if (auth) {
      final token = StorageService.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    
    return headers;
  }
  
  static Future<http.Response> post(
    String url,
    Map<String, dynamic> data, {
    bool auth = false,
  }) async {
    try {
      print('POST: $url');
      print('Data: $data');
      
      final response = await http.post(
        Uri.parse(url),
        headers: _getHeaders(auth: auth),
        body: jsonEncode(data),
      ).timeout(Duration(seconds: timeoutSeconds));
      
      print('Status: ${response.statusCode}');
      print('Response: ${response.body}');
      
      return response;
    } catch (e) {
      print('POST Error: $e');
      rethrow;
    }
  }
  
  static Future<http.Response> get(
    String url, {
    bool auth = false,
    Map<String, String>? queryParams,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      if (queryParams != null) {
        uri = uri.replace(queryParameters: queryParams);
      }
      
      print('GET: $uri');
      final response = await http.get(
        uri,
        headers: _getHeaders(auth: auth),
      ).timeout(Duration(seconds: timeoutSeconds));
      
      print('Status: ${response.statusCode}');
      
      return response;
    } catch (e) {
      print('GET Error: $e');
      rethrow;
    }
  }
  
  static Future<http.Response> put(
    String url,
    Map<String, dynamic> data, {
    bool auth = false,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: _getHeaders(auth: auth),
        body: jsonEncode(data),
      ).timeout(Duration(seconds: timeoutSeconds));
      
      return response;
    } catch (e) {
      print('PUT Error: $e');
      rethrow;
    }
  }
  
  static Future<http.Response> delete(
    String url, {
    bool auth = false,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: _getHeaders(auth: auth),
      ).timeout(Duration(seconds: timeoutSeconds));
      
      return response;
    } catch (e) {
      print('DELETE Error: $e');
      rethrow;
    }
  }
}