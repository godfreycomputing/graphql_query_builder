abstract class BaseObject {
  ///Required parameters on GraphQL operation.
  Map<String, dynamic>? fields;

  BaseObject(this.fields);
}

abstract class BaseQuery {
  final String operationName;
  final Map<String, dynamic>? parameters;
  final Map<String, dynamic> results;

  BaseQuery(
    this.operationName,
    this.parameters,
    this.results,
  );

  String buildQuery();
}
