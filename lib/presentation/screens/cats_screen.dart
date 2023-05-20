import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_app/constants/strings.dart';
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

  Widget buildCatsListWidgets() {
    return ListView.builder(
      itemCount: allCats.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(allCats[index].tags!.isNotEmpty
              ? allCats[index].tags!.first
              : "no tags for this cat"),
          subtitle: Text(allCats[index].owner!.isNotEmpty
              ? allCats[index].owner!
              : "no owner for this cat"),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('$baseUrl/c/${allCats[index].sId}'),
          ),
        );
      },
    );
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
        return GridTile(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 3,
              ),
            ),
            child: Image.network(
               '$baseUrl/c/${allCats[index].sId}',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: allCats.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildBlocWidget(),
      ),
    );
  }
}
