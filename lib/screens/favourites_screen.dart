import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> _favourites;
  FavouritesScreen(this._favourites);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _favourites.isEmpty? Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Center(child: Text('No items found!', style: TextStyle(fontSize: 15) , textAlign: TextAlign.center)),
        ],
      ) : ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            // title: categoryMeals[index].title,
            // imageUrl: categoryMeals[index].imageUrl,
            // duration: categoryMeals[index].duration,
            // complexity: categoryMeals[index].complexity,
            // affordability: categoryMeals[index].affordability,
            _favourites[index],
          );
        },
        itemCount: _favourites.length,
      )
    );
  }
}