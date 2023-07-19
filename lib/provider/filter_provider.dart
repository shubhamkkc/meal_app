import 'dart:core';

import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetrainFree,
  veganFree,
}

class FilterProvider with ChangeNotifier {
  Map<Filter, bool> _filterMeal = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.veganFree: false,
    Filter.vegetrainFree: false,
  };

  Map<Filter, bool> get filterMeal => _filterMeal;

  void setFilters(Map<Filter, bool> chosenFilter) {
    _filterMeal = chosenFilter;
    notifyListeners();
  }

  void setFilter(Filter filter, bool isActive) {
    _filterMeal = {..._filterMeal, filter: isActive};
    notifyListeners();
  }
}
