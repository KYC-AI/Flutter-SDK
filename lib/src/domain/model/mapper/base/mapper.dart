import 'dart:core';

import 'package:meta/meta.dart';

@internal
abstract class Mapper2<T1, T2> {
  T2 map({required T1 value});

  List<T2> mapList({required List<T1> values}) {
    final List<T2> returnValues = [];

    for (final T1 value in values) {
      returnValues.add(map(value: value));
    }

    return returnValues;
  }
}

@internal
abstract class Mapper3<T1, T2, T3> {
  T2 map({required T1 value, required T3 type});

  List<T2> mapList({required List<T1> values, required T3 type}) {
    final List<T2> returnValues = [];

    for (final T1 value in values) {
      returnValues.add(map(value: value, type: type));
    }

    return returnValues;
  }
}
