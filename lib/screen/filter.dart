import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/filter_provider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("filter build");
    final activeFilter = context.watch<FilterProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filter')),
      body: Column(children: [
        SwitchListTile(
          value: activeFilter.filterMeal[Filter.glutenFree]!,
          onChanged: (ischeck) {
            activeFilter.setFilter(Filter.glutenFree, ischeck);
          },
          title: Text(
            'Gluten Free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          subtitle: Text('only include Gluten-free Food',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary)),
        ),
        SwitchListTile(
          value: activeFilter.filterMeal[Filter.lactoseFree]!,
          onChanged: (ischeck) {
            activeFilter.setFilter(Filter.lactoseFree, ischeck);
          },
          title: Text(
            'Lactose Free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          subtitle: Text('only include Lactose-free Food',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary)),
        ),
        SwitchListTile(
          value: activeFilter.filterMeal[Filter.vegetrainFree]!,
          onChanged: (ischeck) {
            activeFilter.setFilter(Filter.vegetrainFree, ischeck);
          },
          title: Text(
            'Vegetrain Free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          subtitle: Text('only include Vegetrain-free Food',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary)),
        ),
        SwitchListTile(
          value: activeFilter.filterMeal[Filter.veganFree]!,
          onChanged: (ischeck) {
            activeFilter.setFilter(Filter.veganFree, ischeck);
          },
          title: Text(
            'vegan Free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          subtitle: Text('only include vegan-free Food',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary)),
        )
      ]),
    );
  }
}
