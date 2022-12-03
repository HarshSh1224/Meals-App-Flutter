import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // CategoryMealsScreen(this.categoryID, this.categoryItem);
  List<Meal> _filteredMeal;

  CategoryMealsScreen(this._filteredMeal);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryID = routeArgs['id'];
    final categoryItem = routeArgs['title'];

    if(_filteredMeal == null){
      return Text('Error Filtered List is NULL');
    }
    final categoryMeals = _filteredMeal.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryItem),
      ),
      body: categoryMeals.isEmpty? Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Center(child: Text('No items found!\nTry removing some filters', style: TextStyle(fontSize: 15) , textAlign: TextAlign.center)),
        ],
      ) : ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            // title: categoryMeals[index].title,
            // imageUrl: categoryMeals[index].imageUrl,
            // duration: categoryMeals[index].duration,
            // complexity: categoryMeals[index].complexity,
            // affordability: categoryMeals[index].affordability,
            categoryMeals[index],
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
