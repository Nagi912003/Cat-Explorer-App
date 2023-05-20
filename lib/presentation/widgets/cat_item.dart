import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import 'package:cats_app/data/models/cats.dart';

class CatItem extends StatelessWidget {
  final Cat cat;
  const CatItem({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
            width: 3,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
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
    );
  }
}
