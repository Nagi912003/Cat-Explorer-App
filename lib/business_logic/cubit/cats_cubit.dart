import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit() : super(CatsInitial());
}