import 'base_query.dart';

abstract class MethodsBase {
  String buildParametersString(Map<String, dynamic> parameters);

  String buildResultsString(Map<String, dynamic> results);

  String addToQueryString(String key, dynamic value);

  String addAllNestedQueries({
    Map<String, dynamic>? queries,
    bool isParameters = false,
  });

  String addNestedObjects({BaseObject? baseObject, bool? isParameterObject});
}

class Methods extends MethodsBase {
  @override
  String buildParametersString(Map<String, dynamic> parameters) {
    var listOfParameters = '(';

    listOfParameters +=
        addAllNestedQueries(queries: parameters, isParameters: true);

    listOfParameters += ')';

    listOfParameters = listOfParameters.replaceAll(',}', '}');
    listOfParameters = listOfParameters.replaceAll(',)', ')');

    print(listOfParameters);

    return listOfParameters;
  }

  @override
  String buildResultsString(Map<String, dynamic> results) {
    var listOfResults = '{';

    listOfResults += addAllNestedQueries(queries: results);

    listOfResults += '}';

    listOfResults = listOfResults.replaceAll(',}', '}');

    print(listOfResults);

    return listOfResults;
  }

  @override
  String addAllNestedQueries(
      {Map<String, dynamic>? queries, bool isParameters = false}) {
    var listOfParameters = '';
    queries!.forEach((key, value) {
      if (value is BaseObject) {
        listOfParameters += isParameters ? '{$key:' : '{$key';
        listOfParameters += addNestedObjects(
          baseObject: value,
          isParameterObject: isParameters,
        );
      } else {
        listOfParameters += addToQueryString(key, value);
      }
    });
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

extension TypeName on Type {
  /// Returns the name of the [Type]
  String get name => runtimeType.toString();
}
