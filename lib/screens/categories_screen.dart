//Explicit Animation in this 
//Implicit in MealsDetails screen

import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meals_screen.dart';
import 'package:mealsapp/widgets/categorygriditem_widget.dart';

class CategoriesScreen extends StatefulWidget {
  // void _selectCategory(BuildContext context) {
  //   Navigator.push(context, route)
  // }
  final List<Meal> availableMeals;
  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0, //starting point
      upperBound: 1, //ending point  //but 0 1 is default
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //it comes from tabs_screen.dart
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
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
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //it is no. of column
            childAspectRatio: 3 / 2, //means image size
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            //avialableCategoyWidget.map((category) => CategorygridWidget(category: category))

            for (final category in availableCategories)
              CategorygridWidget(
                category: category,
                onSelectedCategory: () {
                  _selectCategory(context, category);
                },
              )
          ]),
      builder: (context, child) => SlideTransition(   //for homepage in which all cards slids up when starting
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
        // position: _animationController.drive(
        //   Tween(
        //     begin: const Offset(0, 0.3),
        //     end: const Offset(0, 0),
        //   ).animate(parent),
        // ),
      ),
    );
  }
}

//for line 80 
// Padding(
//           padding: EdgeInsets.only(
//             top: 100 - _animationController.value * 100,
//           ),
//           child: child),