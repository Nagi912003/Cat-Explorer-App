import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';
import 'data/models/cats.dart';

import 'package:cats_app/data/repositories/cats_repository.dart';
import 'package:cats_app/data/web_services/cats_web_services.dart';

import 'package:cats_app/business_logic/cubit/cats_cubit.dart';

import 'presentation/screens/cats_details_screen.dart';
import 'presentation/screens/cats_screen.dart';

class AppRouter {
  late CatsRepository catsRepository;
  late CatsCubit catsCubit;

  AppRouter() {
    catsRepository = CatsRepository(CatsWebService());
    catsCubit = CatsCubit(catsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => catsCubit,
                  child: const CatsScreen(),
                ));

      case catsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => catsCubit,
              child: const CatsScreen(),
            ));

      case catsDetailsScreen:
        final cat = settings.arguments as Cat;
        return MaterialPageRoute(builder: (_) => CatsDetailsScreen(cat: cat,));
      // default:
      //   return MaterialPageRoute(builder: (_) => const PageNotFound());
    }
    return MaterialPageRoute(builder: (_) => const ErrorPage());
  }
}


class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('error page');
  }
}

