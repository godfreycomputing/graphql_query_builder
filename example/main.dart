import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:graphql_query_builder/graphql_query_builder.dart';

Future<List<Category>> searchCategories(
  String searchField,
  String searchTerm,
) async {
  final operationName = 'searchCategories';
  final parameters = {'searchField': searchField, 'searchTerm': searchTerm};
  final categoryResultObject = ResultObject({
    'id': null,
    'name': null,
    'description': null,
    'imageUrl': null,
  }).fields;
  final results = {
    'categories': categoryResultObject,
    'success': null,
    'message': null
  };

  final queryString = QueryBuilder(
    operationName,
    parameters,
    results,
  ).buildQuery();

  final response = await http.post(
    Uri(path: 'graphqlUrl'),
    headers: {'Contexnt-Type': 'application/graphql'},
    body: queryString,
  );

  final data = jsonDecode(response.body)['data'][operationName];

  return (data['categories'] as List)
      .map((categoryData) => Category.fromMap(categoryData))
      .toList();
}

class Category {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;

  Category({this.id, this.name, this.description, this.imageUrl});

  factory Category.fromMap(Map data) {
    return Category(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      imageUrl: data['imageUrl'],
    );
  }
}
