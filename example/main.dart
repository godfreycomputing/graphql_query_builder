import 'package:graphql_query_builder/graphql_query_builder.dart';

String buildSearchQuery(
  String searchField,
  String searchTerm,
) {
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

  return QueryBuilder(
    operationName,
    parameters,
    results,
  ).buildQuery();
}
