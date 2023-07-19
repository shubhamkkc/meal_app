import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../data/dummy_data.dart';

class MealProvider with ChangeNotifier {
  final List<Meal> _availabeMeal = dummyMeals;
  List<Meal> get availabeMeal => _availabeMeal;
}
