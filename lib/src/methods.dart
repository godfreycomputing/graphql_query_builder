import 'base/base_methods.dart';
import 'base/base_query.dart';

class Methods extends MethodsBase {
  @override
  String buildParametersString(Map<String, dynamic> parameters) {
    var listOfParameters = '(';

    listOfParameters +=
        addAllNestedQueries(queries: parameters, isParameters: true);

    listOfParameters += ')';

    listOfParameters = listOfParameters.replaceAll(',}', '}');
    listOfParameters = listOfParameters.replaceAll(',)', ')');

    return listOfParameters;
  }

  @override
  String buildResultsString(Map<String, dynamic> results) {
    var listOfResults = '{';

    listOfResults += addAllNestedQueries(queries: results);

    listOfResults += '}';

    listOfResults = listOfResults.replaceAll(',}', '}');

    return listOfResults;
  }

  @override
  String addAllNestedQueries(
      {Map<String, dynamic>? queries, bool isParameters = false}) {
    var listOfParameters = '';
    queries!.forEach((key, value) {
      if (value is BaseObject) {
        listOfParameters += isParameters ? '$key:' : '$key';
        listOfParameters += addNestedObjects(
          baseObject: value,
          isParameterObject: isParameters,
        );
      } else {
        listOfParameters += addToQueryString(key, value);
      }
    });
    listOfParameters += '}';
    return listOfParameters;
  }

  @override
  String addToQueryString(String key, value) {
    if (value == null) return '$key ';
    if (value.runtimeType != String) return '$key: $value,';
    return '$key: \"$value\",';
  }

  @override
  String addNestedObjects({BaseObject? baseObject, bool? isParameterObject}) {
    var listOfFields = '{';
    baseObject!.fields!.forEach((key, value) {
      if (value is BaseObject) {
        listOfFields += isParameterObject! ? '$key:' : '$key';
        listOfFields += addNestedObjects(baseObject: value);
        listOfFields += '}';
      } else {
        listOfFields += addToQueryString(key, value);
      }
    });
    return listOfFields;
  }
}
