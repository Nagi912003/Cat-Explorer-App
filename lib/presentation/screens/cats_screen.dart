import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_app/constants/my_colors.dart';
import '../../data/models/cats.dart';

import 'package:cats_app/business_logic/cubit/cats_state.dart';
import 'package:cats_app/business_logic/cubit/cats_cubit.dart';

import 'package:cats_app/presentation/widgets/cat_item.dart';

class CatsScreen extends StatefulWidget {
  const CatsScreen({Key? key}) : super(key: key);

  @override
  State<CatsScreen> createState() => _CatsScreenState();
}

class _CatsScreenState extends State<CatsScreen> {
  late List<Cat> allCats;
  late List<Cat> searchResultCats;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CatsCubit>(context).getAllCats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      appBar: AppBar(
        //backgroundColor: MyColors.myWhite,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        leading: _isSearching ? const BackButton() : null,
        actions: _buildAppBarActions(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildBlocWidget(),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return const Text('   Cats',style: TextStyle(color: MyColors.myPrimary),);
  }
  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _clearSearchQuery();
            Navigator.pop(context);
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: _startSearch,
        ),
      ];
    }
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search by tag...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: MyColors.myPrimary, fontSize: 16.0),
      onChanged: (query) {
        searchByTag(query);
      },
    );
  }
  void searchByTag(String query){
    searchResultCats = allCats
        .where((cat) => cat.tags!.any(
            (tag) => tag.toLowerCase().contains(query.toLowerCase())))
        .toList();
    setState(() {});
  }
  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }
  void _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearching = false;
    });
  }
  void _clearSearchQuery() {
    setState(() {
      _searchController.clear();
    });
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<CatsCubit, CatsState>(
      builder: (context, state) {
        if (state is CatsLoaded) {
          allCats = state.cats;
          return _buildLoadedListWidgets();
        } else if (state is CatsError) {
          return const Center(
            child: Text("error"),
          );
        } else {
          return _showLoadingIndicator();
        }
      },
    );
  }
  Widget _buildLoadedListWidgets() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CatItem(cat: _searchController.text.isEmpty? allCats[index]: searchResultCats[index]);
      },
      itemCount: _searchController.text.isEmpty? allCats.length: searchResultCats.length,
    );
  }
  Widget _showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
