import 'package:flutter/material.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _filterOutMeals;
  List<Meal> _favourites;

  void _setFilters(Map<String, bool> filterdata) {
    setState(() {
      print(filterdata);
      _filters = filterdata;
      _filterOutMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    print(mealId);
    int existingIndex = _favourites.indexWhere((meal) => meal.id == mealId);

      if (existingIndex >= 0){
        setState(() {
        _favourites.removeAt(existingIndex);
        });
      } else {
        setState(() {
        _favourites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        });
      }
      // print(_favourites[0].id);
  }

  bool _isFavourite(String mealId){
    return _favourites.any((meal) => meal.id == mealId);
  }

  @override
  initState() {
    _filterOutMeals = DUMMY_MEALS;
    _favourites = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 11,
              ),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  color: Colors.black,
                  fontSize: 20),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favourites),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_filterOutMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_isFavourite,_toggleFavourite),
      },
      // onGenerateRoute: ((settings) {
      //   print(settings.arguments);
      // }),
      onUnknownRoute: (((settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      })),
    );
  }
}
