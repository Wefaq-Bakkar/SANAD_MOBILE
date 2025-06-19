// lib/data/datasources/remote/product_card_api.dart
import 'package:http/http.dart' as http;
import '../../../core/constants/api_constants.dart';

class ProductCardApi {
  static Future<http.Response> getProductCards({
    int? brandId,
    int? categoryId,
    int? subcategoryId,
    int? page,
    int? limit,
  }) {
    final queryParameters = <String, String>{};
    if (brandId != null) queryParameters['brandId'] = brandId.toString();
    if (categoryId != null) queryParameters['categoryId'] = categoryId.toString();
    if (subcategoryId != null) queryParameters['subcategoryId'] = subcategoryId.toString();
    if (page != null) queryParameters['page'] = page.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    final uri = Uri.parse('${ApiConstants.baseUrl}/card-products/public').replace(queryParameters: queryParameters);
    print('[PRODUCT CARD API] GET: ' + uri.toString());
    return http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
