import 'package:bloc/bloc.dart';

import '../../data/models/cats.dart';

import 'package:cats_app/data/repositories/cats_repository.dart';

import 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {

  final CatsRepository catsRepository;
  late List<Cat> cats;

  CatsCubit(this.catsRepository) : super(CatsInitial());

  List<Cat>getAllCats() {
    catsRepository.getAllCats().then((cats) => {
      emit(CatsLoaded(cats)),
      this.cats = cats
    });
    return cats;
  }
}