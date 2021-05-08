import 'base/base_query.dart';
import 'methods.dart';

class QueryBuilder extends BaseQuery {
  ///Builds a query string to return results ie. {"query": {products {id name}}
  QueryBuilder(String operationName, Map<String, dynamic>? parameters,
      Map<String, dynamic> results)
      : super(operationName, parameters, results);

  @override
  Map<String, dynamic> buildQuery() {
    final methods = Methods();
    var resultsString = methods.buildResultsString(results);
    var parametersString = methods.buildParametersString(parameters);
    var queryString;

    if (parameters == null) {
      queryString = {'query': '{$operationName $resultsString}'};

      return queryString;
    }

    queryString = {
      'query': '{$operationName $parametersString $resultsString}'
    };

    return queryString;
  }
}
