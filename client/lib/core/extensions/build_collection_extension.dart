import 'package:built_collection/built_collection.dart';

extension ReduceEmpty<T> on BuiltList<T> {
  T reduceEmpty(T ifEmpty, T combine(T value, T element)) =>
      this.isEmpty ? ifEmpty : this.reduce(combine);
}
