typedef FromJson<T> = T Function(Map<String, dynamic> json);

class ResponseMapper {
  final Map<Type, dynamic> _factories = {};

  void register<T>(FromJson<T> factory) {
    _factories[T] = factory;
  }

  T fromJson<T>(Map<String, dynamic> json) {
    final factory = _factories[T] as FromJson<T>?;
    if (factory == null) {
      throw Exception("No factory registered for type $T");
    }
    return factory(json);
  }

  List<T> fromJsonList<T>(List<dynamic> jsonList) {
    return jsonList.map((e) => fromJson<T>(e as Map<String, dynamic>)).toList();
  }
}
