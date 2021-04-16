import 'base/base_query.dart';
import 'methods.dart';

class QueryBuilder extends BaseQuery {
  ///Builds a query string to return results ie. {"query": {products {id name}}
  QueryBuilder(String operationName, Map<String, dynamic> parameters,
      Map<String, dynamic> results)
      : super(operationName, parameters, results);

  @override
  String buildQuery() {
    final methods = Methods();
    var resultsString = methods.buildResultsString(results);

    var queryString = '{\"query\": {$operationName $resultsString';

    queryString.replaceAll(',}', '}');

    return queryString;
  }
}
