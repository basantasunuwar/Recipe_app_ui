import 'package:flutter/material.dart';
import 'package:recipe_app/Ui/RecipeHome.dart';

void main(List<String> args) {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      home: RecipeHome(),
    );
  }
}
