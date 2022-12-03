import '../data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      GridView(
        padding: EdgeInsets.all(20),
        children:
            DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id,catData.title, catData.color, catData.imageURL)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20),
      );
  }
}
