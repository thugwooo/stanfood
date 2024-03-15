import 'package:flutter/material.dart';

extension ListDivideExt<T extends Widget> on Iterable<T> {
  Iterable<MapEntry<int, Widget>> get enumerate => toList().asMap().entries;

  List<Widget> divide(Widget t) => isEmpty ? [] : (enumerate.map((e) => [e.value, t]).expand((i) => i).toList()..removeLast());

  List<T> around(T t) => toList()
    ..insert(0, t)
    ..add(t);
  List<Widget> addToStart(Widget t) => enumerate.map((e) => e.value).toList()..insert(0, t);

  List<Widget> addToEnd(Widget t) => enumerate.map((e) => e.value).toList()..add(t);
}

extension IterableExt<T> on Iterable<T> {
  List<S> mapIndexed<S>(S Function(int, T) func) => toList().asMap().map((index, value) => MapEntry(index, func(index, value))).values.toList();
}
