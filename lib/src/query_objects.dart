import 'base/base_query.dart';

class ResultObject extends BaseObject {
  ///This is used if you have a nested object in your results ie. product {id name}.
  ///You can create multiple levels of nesting by including objects within objects.
  ///
  ///If value of map is not required (ie. name description), leave value null
  ResultObject({Map<String, dynamic>? resultObject}) : super(resultObject);
}

class ParameterObject extends BaseObject {
  ///This is used if you have a nested object in your parameters ie. product: {id: "id", name: "name"}.
  ///You can create multiple levels of nesting by including objects within objects.
  ParameterObject({Map<String, dynamic>? parameterObject})
      : super(parameterObject);
}
