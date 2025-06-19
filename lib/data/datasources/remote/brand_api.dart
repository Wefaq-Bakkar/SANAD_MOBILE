// lib/data/datasources/remote/brand_api.dart
import 'package:http/http.dart' as http;
import '../../../core/constants/api_constants.dart';

class BrandApi {
  /// Get brands by category (all brands under a category, regardless of subcategory)
  static Future<http.Response> getBrandsByCategory(int categoryId) {
    return http.get(
      Uri.parse('${ApiConstants.baseUrl}/brands/category/$categoryId/public'),
      headers: {'Content-Type': 'application/json'},
    );
  }

  /// Get brands by subcategory (brands under a specific subcategory)
  static Future<http.Response> getBrandsBySubcategory(int subcategoryId) {
    return http.get(
      Uri.parse('${ApiConstants.baseUrl}/brands/subcategory/$subcategoryId/public'),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
