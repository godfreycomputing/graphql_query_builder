import 'base_methods.dart';
import 'base_query.dart';

class MutationBuilder extends BaseQuery {
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
  String buildQuery(MethodsBase methods) {
    var parametersString = methods.buildParametersString(parameters);

    var resultsString = methods.buildResultsString(results);

    var queryString =
        '{\"query\": {mutation {$operationName $parametersString $resultsString}';

    queryString.replaceAll(',}', '}');

    return queryString;
  }
}
