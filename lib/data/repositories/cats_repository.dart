import 'package:cats_app/data/models/cats.dart';

import 'package:cats_app/data/web_services/cats_web_services.dart';

class CatsRepository {
  final CatsWebService _catsWebService;
  CatsRepository(this._catsWebService);

  Future<List<Cat>> getAllCats() async{
    final cats = await _catsWebService.getAllCats();
    return cats.map((cat) => Cat.fromJson(cat)).toList();
  }
}