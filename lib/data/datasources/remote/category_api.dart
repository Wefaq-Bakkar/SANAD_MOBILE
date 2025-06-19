// lib/data/datasources/remote/category_api.dart
import 'package:http/http.dart' as http;
import '../../../core/constants/api_constants.dart';

class CategoryApi {
  static Future<http.Response> getCategories() {
    return http.get(
      Uri.parse('${ApiConstants.baseUrl}/categories/public'),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
