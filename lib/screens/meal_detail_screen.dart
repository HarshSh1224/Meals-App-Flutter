import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meals-detail-screen';
  Function(String) _toggleFavourite;
  Function(String) _isFavourite;
  MealDetailScreen( this._isFavourite,this._toggleFavourite);

  @override
  Widget build(BuildContext context) {
    final Map<String, Meal> meal_map =
        ModalRoute.of(context).settings.arguments;
    final meal = meal_map['meal'];

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ingrediants',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              elevation: 6,
              child: Container(
                height: 180,
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (meal.ingredients).map((ig) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).accentColor,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 5),
                          child: Text(
                            ig,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        // color: Colors.amber,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Steps',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              elevation: 6,
              child: Container(
                height: 180,
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text('#${index + 1}'),
                                    ),
                                    title: Text(
                                      meal.steps[index],
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          },
                          itemCount: meal.steps.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavourite(meal.id)? Icons.star : 
          Icons.star_border,
        ),
        onPressed: () {
          print('Meal id : ${meal.id}');
          _toggleFavourite(meal.id);
        },
      ),
    );
  }
}
