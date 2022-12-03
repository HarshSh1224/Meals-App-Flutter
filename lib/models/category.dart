import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imageURL;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
    this.imageURL = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Espaguetis_carbonara.jpg/390px-Espaguetis_carbonara.jpg',
    // this.imageURL = 'https://images.services.kitchenstories.io/0fzAQ5I5uy2srfx1oi2OUytGYhg=/1200x630/images.kitchenstories.io/recipeImages/RP16_01_171_ClassicHamburger_Final_4x3.jpg'
  });
}
