import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';
import '../screens/meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.avialabaleMeals,
  });

  final List<Meal> avialabaleMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = avialabaleMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
