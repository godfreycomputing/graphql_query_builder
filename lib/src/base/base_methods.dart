import 'base_query.dart';

abstract class MethodsBase {
  String buildParametersString(Map<String, dynamic> parameters);

  String buildResultsString(Map<String, dynamic> results);

  String addToQueryString(String key, dynamic value);

  String addAllNestedQueries({
    Map<String, dynamic>? queries,
    bool isParameters = false,
  });

  String addNestedObjects({BaseObject? baseObject, bool isParameterObject});
}
