import 'package:built_collection/built_collection.dart';

extension ReduceEmpty<T> on BuiltList<T> {
  T reduceEmpty(T ifEmpty, T Function(T value, T element) combine) =>
      isEmpty ? ifEmpty : reduce(combine);
}
