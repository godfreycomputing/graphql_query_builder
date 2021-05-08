import 'dart:convert';

import 'package:graphql_query_builder/graphql_query_builder.dart';

void main() {
  final operationName = 'categories';
  final parameters = null;
  final standard = ResultObject({'success': null, 'message': null});
  final categoryResultObject = ResultObject({
    'id': null,
    'name': null,
    'description': null,
    'imageUrl': null,
  });
  final results = {'categories': categoryResultObject, 'standard': standard};

  final queryString = QueryBuilder(
    operationName,
    parameters,
    results,
  ).buildQuery();

  print(jsonEncode(queryString));
}
