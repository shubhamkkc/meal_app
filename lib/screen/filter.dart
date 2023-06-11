import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetrainFree,
  veganFree,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFreeSet = false;
  var lactoseFreeSet = false;
  var vegetrainFreeSet = false;
  var veganFreeSet = false;

  @override
  void initState() {
    glutenFreeSet = widget.currentFilter[Filter.glutenFree]!;
    lactoseFreeSet = widget.currentFilter[Filter.lactoseFree]!;
    vegetrainFreeSet = widget.currentFilter[Filter.vegetrainFree]!;
    veganFreeSet = widget.currentFilter[Filter.veganFree]!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          Filter.glutenFree: glutenFreeSet,
          Filter.lactoseFree: lactoseFreeSet,
          Filter.vegetrainFree: vegetrainFreeSet,
          Filter.veganFree: veganFreeSet
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Your Filter')),
        body: Column(children: [
          SwitchListTile(
            value: glutenFreeSet,
            onChanged: (ischeck) {
              setState(() {
                glutenFreeSet = ischeck;
              });
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
            value: lactoseFreeSet,
            onChanged: (ischeck) {
              setState(() {
                lactoseFreeSet = ischeck;
              });
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
            value: vegetrainFreeSet,
            onChanged: (ischeck) {
              setState(() {
                vegetrainFreeSet = ischeck;
              });
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
            value: veganFreeSet,
            onChanged: (ischeck) {
              setState(() {
                veganFreeSet = ischeck;
              });
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
      ),
    );
  }
}
