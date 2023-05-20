import 'package:cats_app/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:cats_app/data/models/cats.dart';

import '../../constants/strings.dart';

class CatsDetailsScreen extends StatelessWidget {
  final Cat cat;
  const CatsDetailsScreen({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildSliverList(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      backgroundColor: MyColors.myWhite,
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: cat.sId!,
            style: const TextStyle(
              color: MyColors.myBlack,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        background: Hero(
          tag: cat.sId!,
          transitionOnUserGestures: true,
          child: ClipRRect(
            child: cat.isNull
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading-animation.gif',
                    image: '$baseUrl/c',
                    fit: BoxFit.cover,
                  )
                : FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading-animation.gif',
                    image: '$baseUrl/c/${cat.sId}',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
  Widget _buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text:TextSpan(children: [
                    const TextSpan(
                      text: 'Tags :',
                      style: TextStyle(
                        color: MyColors.myBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' ${cat.tags!.join(" / ")}',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(
                  height: 30,
                  endIndent: 325,
                  color: MyColors.myPrimary,
                  thickness: 2,
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  String nothing() {
    return '''.
    .
    ''';
  }
}
