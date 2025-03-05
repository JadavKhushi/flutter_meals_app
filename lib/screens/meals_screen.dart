import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/mealdetails_screen.dart';
import 'package:mealsapp/widgets/mealitem_widget.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    // Navigator.of(context).pop(); //for going back manually
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealDetailsScreen(meal: meal),
      ),
    );
  }

  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,});

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Uh oh...nothing here!"),
          const SizedBox(height: 16),
          Text(
            "Try selecting a different category!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItemWidget(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }
    //it does here bcz in TabsScreen also Appbar so if title has there then
    //return title and if not then return content without appbar
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!), //title is not null
      ),
      body: content,
      // ListView.builder(
      //   itemBuilder: (context, index) => Text(
      //     meals[index].title,
      //   ),
      // ),
    );
  }
}
