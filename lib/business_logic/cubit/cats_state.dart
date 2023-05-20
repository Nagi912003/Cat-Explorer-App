import 'package:flutter/foundation.dart';

import '../../data/models/cats.dart';

@immutable
abstract class CatsState {}

class CatsInitial extends CatsState {}

class CatsLoading extends CatsState {}

class CatsError extends CatsState {
  final String message;

  CatsError(this.message);
}

class CatsLoaded extends CatsState {
  final List<Cat> cats;

  CatsLoaded(this.cats);
}