import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  Map<String,bool> _initialFilters;
  Function(Map<String, bool>) _setFilters;
  FiltersScreen(this._initialFilters, this._setFilters);

  // var _glutenFree = _initialFilters['gluten'];
  // var _lactoseFree = false;
  // var _vegetarian = false;
  // var _vegan = false;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    _glutenFree = widget._initialFilters['gluten'];
    _lactoseFree = widget._initialFilters['lactose'];
    _vegetarian = widget._initialFilters['vegetarian'];
    _vegan = widget._initialFilters['vegan'];
    super.initState();
  }

  Widget buildSwitchTile(String title, String description, bool filterName,
      Function changeFunction) {
    print(_glutenFree);
    return SwitchListTile(
      value: filterName,
      onChanged: changeFunction,
      title: Text(title),
      subtitle: Text(description),
      secondary: Icon(Icons.settings_suggest),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  widget._setFilters({
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                  });
                },
                icon: Icon(Icons.check)),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              buildSwitchTile(
                'Gluten-Free',
                'Only Include gluten free meals',
                _glutenFree,
                (value) {
                  setState(() {
                    _glutenFree = value;
                    //print(
                    //'${_glutenFree} ${_lactoseFree} ${_vegetarian} ${_vegan} ');
                  });
                },
              ),
              buildSwitchTile(
                'Lactose-Free',
                'Only Include lactose free meals',
                _lactoseFree,
                (value) {
                  setState(() {
                    _lactoseFree = value;
                    //print(
                    //'${_glutenFree} ${_lactoseFree} ${_vegetarian} ${_vegan} ');
                  });
                },
              ),
              buildSwitchTile(
                'Vegetarian',
                'Only Include vegetarian meals',
                _vegetarian,
                (value) {
                  setState(() {
                    _vegetarian = value;
                    //print(
                    //'${_glutenFree} ${_lactoseFree} ${_vegetarian} ${_vegan} ');
                  });
                },
              ),
              buildSwitchTile(
                'Vegan',
                'Only Include vegan meals',
                _vegan,
                (value) {
                  setState(() {
                    _vegan = value;
                    //print(
                    //'${_glutenFree} ${_lactoseFree} ${_vegetarian} ${_vegan} ');
                  });
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
