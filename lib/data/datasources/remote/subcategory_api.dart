// lib/data/datasources/remote/subcategory_api.dart
import 'package:http/http.dart' as http;
import '../../../core/constants/api_constants.dart';

class SubcategoryApi {
  static Future<http.Response> getSubcategoriesByCategory(int categoryId) {
    return http.get(
      Uri.parse('${ApiConstants.baseUrl}/subcategories/category/$categoryId/public'),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
