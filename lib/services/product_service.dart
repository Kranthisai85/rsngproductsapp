import 'package:dio/dio.dart';

import '../models/product.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts() async {
    const String url = 'https://fakestoreapi.com/products';

    try {
      final response = await _dio.get(url);
      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } catch (error) {
      throw Exception('Failed to load products');
    }
  }
}
