import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/widgets/filter_widget.dart';
import 'package:mealsapp/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          FiltersWidget(
            title: 'Gluteen-Free',
            subtitle: 'Only Gluteen-Free meal',
            initialState: activeFilters[Filter.gluteenFree]!,
            valueOnChange: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.gluteenFree, isChecked);
            },
          ),
          FiltersWidget(
            title: 'Lactose-Free',
            subtitle: 'Only Lactose-Free meal',
            initialState: activeFilters[Filter.lactoseFree]!,
            valueOnChange: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
          ),
          FiltersWidget(
            title: 'Vegetarian',
            subtitle: 'Only Vegetarian',
            initialState: activeFilters[Filter.vegetarian]!,
            valueOnChange: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
          ),
          FiltersWidget(
            title: 'Vegan',
            subtitle: 'Only Vegan meals',
            initialState: activeFilters[Filter.vegan]!,
            valueOnChange: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:mealsapp/widgets/filter_widget.dart';
// // import 'package:mealsapp/screens/tabs_screen.dart';
// // import 'package:mealsapp/widgets/main_drawer_widget.dart';
// import 'package:mealsapp/providers/filters_provider.dart';

// class FiltersScreen extends ConsumerWidget {
//   // final Map<Filter, bool> currentFilters;

//   const FiltersScreen({super.key}); //, required this.currentFilters

// //   @override
// //   ConsumerState<FiltersScreen> createState() {
// //     return _FiltersScreenState();
// //   }
// // }

// // class _FiltersScreenState extends ConsumerState<FiltersScreen> {
// //   var _gluteenFreeFilterSet = false;
// //   var _lactoseFreeFilterSet = false;
// //   var _vegetarianFilterSet = false;
// //   var _veganFilterSet = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     final activeFilters = ref.read(
// //         filtersProvider); //read instead of watch bcz initState execute only once
// //     _gluteenFreeFilterSet = activeFilters[Filter.gluteenFree]!;
// //     _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
// //     _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
// //     _veganFilterSet = activeFilters[Filter.vegan]!;
// //   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final activeFilters = ref.watch(filtersProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your filters'),
//       ),
//       //It is optionally for Drawer or Back button
//       //If this code executes it replace back btn by drawer

//       // drawer: MainDrawerWidget(
//       //   onSelectScreen: ((identifier) {
//       //     Navigator.of(context).pop();
//       //     if (identifier == 'meals') {
//       //       Navigator.of(context).pushReplacement(
//       //         MaterialPageRoute(
//       //           builder: (ctx) => const TabsScreen(),
//       //         ),
//       //       );
//       //     }
//       //   }),
//       // ),

//       // body: PopScope(
//       //   //here when user press back btn i want set all filters
//       //   canPop: true,
//       //   onPopInvoked: (didPop) async {
//       //     // ------- return false
//       //     // if (didPop) return;
//       //     ref.read(filtersProvider.notifier).allFilters({
//       //       Filter.gluteenFree: _gluteenFreeFilterSet,
//       //       Filter.lactoseFree: _lactoseFreeFilterSet,
//       //       Filter.vegetarian: _vegetarianFilterSet,
//       //       Filter.vegan: _veganFilterSet,
//       //     });
//       //we dont need to pop manually bcz we use provider approach
//       // Navigator.of(context).pop({
//       // for(Filter index in Filter.values) {
//       //   index: _filterSet,
//       // };
//       // });
//       // false;
//       //   true;
//       // },
//       body: Column(
//         children: [
//           FiltersWidget(
//             title: 'Gluteen-Free',
//             subtitle: 'Only Gluteen-Free meal',
//             initialState: _gluteenFreeFilterSet,
//             valueOnChange: (isChecked) { 
//               ref.read(filtersProvider.notifier).setFilter(Filter.gluteenFree, isChecked)
//             },
//           ),
//           FiltersWidget(
//             title: 'Lactose-Free',
//             subtitle: 'Only Lactose-Free meal',
//             initialState: _lactoseFreeFilterSet,
//             valueOnChange: (newValue) {
//               _lactoseFreeFilterSet = newValue;
//             },
//           ),
//           FiltersWidget(
//             title: 'Vegetarian',
//             subtitle: 'Only Vegetarian',
//             initialState: _vegetarianFilterSet,
//             valueOnChange: (newValue) {
//               _vegetarianFilterSet = newValue;
//             },
//           ),
//           FiltersWidget(
//             title: 'Vegan',
//             subtitle: 'Only Vegan meals',
//             initialState: _veganFilterSet,
//             valueOnChange: (newValue) {
//               _veganFilterSet = newValue;
//             },
//           ),
//         ],
//       ),
//     );
//     // );
//   }
// }
