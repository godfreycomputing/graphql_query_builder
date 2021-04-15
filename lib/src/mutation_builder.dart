import 'base/base_methods.dart';
import 'base/base_query.dart';
import 'methods.dart';

class MutationBuilder extends BaseQuery {
  ///Builds a muation query string ie. {"query":{mutation {addProduct (id: "id", name: "name") {results}}}}
  MutationBuilder(
    String operationName,
    Map<String, dynamic> parameters,
    Map<String, dynamic> results,
  ) : super(
          operationName,
          parameters,
          results,
        );

  @override

  ///Method to build the json string.
  String buildQuery() {
    final methods = Methods();
    var parametersString = methods.buildParametersString(parameters);

    var resultsString = methods.buildResultsString(results);

    var queryString =
        '{\"query\": {mutation {$operationName $parametersString $resultsString}';

    queryString.replaceAll(',}', '}');

    return queryString;
  }
}
