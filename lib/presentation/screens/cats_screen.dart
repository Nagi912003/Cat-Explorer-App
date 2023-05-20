import 'package:cats_app/presentation/widgets/cat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/cats.dart';

import 'package:cats_app/business_logic/cubit/cats_state.dart';
import 'package:cats_app/business_logic/cubit/cats_cubit.dart';


class CatsScreen extends StatefulWidget {
  const CatsScreen({Key? key}) : super(key: key);

  @override
  State<CatsScreen> createState() => _CatsScreenState();
}

class _CatsScreenState extends State<CatsScreen> {
  late List<Cat> allCats;

  @override
  void initState() {
    super.initState();
    allCats = BlocProvider.of<CatsCubit>(context).getAllCats();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CatsCubit, CatsState>(
      builder: (context, state) {
        if (state is CatsLoaded) {
          allCats = state.cats;
          return buildLoadedListWidgets();
        } else if (state is CatsError) {
          return const Center(
            child: Text("error"),
          );
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListWidgets() {
    return buildCatsGrid();
  }

  Widget buildCatsGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CatItem(cat:allCats[index]);
      },
      itemCount: allCats.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
        actions: [
          Image.asset(
            'assets/images/loading-animation.gif',
            width: 50,
            height: 50,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildBlocWidget(),
      ),
    );
  }
}
