import 'src/base_methods.dart';
import 'src/base_query.dart';
import 'src/mutation_builder.dart';
import 'src/query_builder.dart';

void main() {
  final BaseObject parameterObject = ParameterObject(parameterObject: {
    'name': 'name',
    'description': 'description',
  });

  final BaseObject nestedResultObject =
      ResultObject(resultObject: {'id': null, 'name': null});

  final BaseObject resultObject = ResultObject(resultObject: {
    'id': null,
    'name': null,
    'category': nestedResultObject,
  });

  final BaseQuery mutationBuilder = MutationBuilder(
    'addToCart',
    {'id': 'id', 'product': parameterObject},
    {'id': null, 'product': resultObject},
  );

  final BaseQuery queryBuilder = QueryBuilder(
    'products',
    {},
    {'id': null, 'product': resultObject},
  );

  MethodsBase methods = Methods();

  var mutation = mutationBuilder.buildQuery(methods);

  var query = queryBuilder.buildQuery(methods);

  print(mutation);
  print('=======================');
  print(query);
}
