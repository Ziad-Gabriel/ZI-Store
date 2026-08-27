import 'dart:convert';

import 'package:zi_store/core/services/categories_service.dart';

class CategoriesRepository {
  Future<List<String>> getCategories() async {
    final response = await CategoriesService().getCategories();
    final getData = jsonDecode(response.body);
    return List<String>.from(getData);
  }
}
