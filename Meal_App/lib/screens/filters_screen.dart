import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/fiters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;
  FiltersScreen(this.currentFilter, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilter['gluten'];
    _isVegan = widget.currentFilter['vegan'];
    _isVegetarian = widget.currentFilter['vegetarian'];
    _isLactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile('Gluten-Free',
                  'Only include gluten-free meals.', _isGlutenFree, (newValue) {
                setState(
                  () {
                    _isGlutenFree = newValue;
                  },
                );
              }),
              _buildSwitchListTile(
                  'Vegan', 'Only include Vegan meals.', _isVegan, (newValue) {
                setState(
                  () {
                    _isVegan = newValue;
                  },
                );
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include Vegetarian meals.', _isVegetarian,
                  (newValue) {
                setState(
                  () {
                    _isVegetarian = newValue;
                  },
                );
              }),
              _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals.',
                  _isLactoseFree, (newValue) {
                setState(
                  () {
                    _isLactoseFree = newValue;
                  },
                );
              }),
            ],
          ))
        ],
      ),
    );
  }
}
