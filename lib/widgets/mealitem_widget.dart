import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:mealsapp/widgets/mealitemtrait_widget.dart';

class MealItemWidget extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

//for return text string with uppercase letter first
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1); //'Hello' + 'World
  }

  String get affordabiliityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1); //'Hello' + 'World
  }

  const MealItemWidget(
      {super.key, required this.meal, required this.onSelectMeal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow
                          .ellipsis, //cuttoff the text by adding ...
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MealitemTraitWidget(
                            icon: Icons.schedule,
                            label: '${meal.duration} mins',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: MealitemTraitWidget(
                            icon: Icons.work,
                            label: complexityText,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: MealitemTraitWidget(
                            icon: Icons.attach_money,
                            label: affordabiliityText,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
