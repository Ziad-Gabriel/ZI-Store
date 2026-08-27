import 'package:http/http.dart' as http;

class ProductService {
  Future<http.Response> getProduct() async {
    final url = Uri.parse('https://dummyjson.com/products');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
        'Failed to load products. Status Code : ${response.statusCode}',
      );
    }
  }
}
