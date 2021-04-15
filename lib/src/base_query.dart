import 'base_methods.dart';

abstract class BaseObject {
  ///Required parameters on GraphQL operation.
  Map<String, dynamic>? fields;

  BaseObject(this.fields);
}

class ResultObject extends BaseObject {
  ResultObject(
      {

      ///Required returned result object.
      ///
      ///If value of map is not required (ie. name description, leave value null)
      Map<String, dynamic>? resultObject})
      : super(resultObject);
}

class ParameterObject extends BaseObject {
  ///Required returned result object.
  ParameterObject({Map<String, dynamic>? parameterObject})
      : super(parameterObject);
}

abstract class BaseQuery {
  final String operationName;
  final Map<String, dynamic> parameters;
  final Map<String, dynamic> results;

  BaseQuery(
    this.operationName,
    this.parameters,
    this.results,
  );

  String buildQuery(MethodsBase methods);
}
