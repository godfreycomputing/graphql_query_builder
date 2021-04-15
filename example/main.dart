import 'package:graphql_query_builder/graphql_query_builder.dart';

void CreateQuery() {
  final parameterObject = ParameterObject(parameterObject: {
    'name': 'name',
    'description': 'description',
  });

  final nestedResultObject =
      ResultObject(resultObject: {'id': null, 'name': null});

  final resultObject = ResultObject(resultObject: {
    'id': null,
    'name': null,
    'category': nestedResultObject,
  });

  final mutationBuilder = MutationBuilder(
    'addToCart',
    {'id': 'id', 'product': parameterObject},
    {'id': null, 'product': resultObject},
  );

  final queryBuilder = QueryBuilder(
    'products',
    {},
    {'id': null, 'product': resultObject},
  );

  var mutation = mutationBuilder.buildQuery();

  var query = queryBuilder.buildQuery();

  print(mutation);
  print('=======================');
  print(query);
}
