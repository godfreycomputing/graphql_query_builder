import 'base_methods.dart';
import 'base_query.dart';

class QueryBuilder extends BaseQuery {
  QueryBuilder(String operationName, Map<String, dynamic> parameters,
      Map<String, dynamic> results)
      : super(operationName, parameters, results);

  @override
  String buildQuery(MethodsBase methods) {
    var resultsString = methods.buildResultsString(results);

    var queryString = '{\"query\": {$operationName $resultsString';

    queryString.replaceAll(',}', '}');

    return queryString;
  }
}
