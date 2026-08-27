import 'package:http/http.dart' as http;

class CategoriesService {
  Future<http.Response> getCategories() async {
    final url = Uri.parse('https://dummyjson.com/products/category-list');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
        'Failed to load categories. Status Code : ${response.statusCode}',
      );
    }
  }
}