import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  void gotoPage(String title, BuildContext ctx){
    if(title == 'Meals'){
      Navigator.of(ctx).pushReplacementNamed('/');
    }else{
      Navigator.of(ctx).pushReplacementNamed(FiltersScreen.routeName);
      
    }
  }

  @override
  Widget build(BuildContext context) {
  Widget buildListTile(String title, Icon icon){
    return ListTile(
          onTap: () => gotoPage(title, context),
          contentPadding: EdgeInsets.only(left: 30),
          leading: icon,
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        );
  }
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: Text('Cooking Up!', style: TextStyle(fontSize: 20),),
        ),
        SizedBox(height: 20,),
        buildListTile('Meals', Icon(Icons.restaurant)),
        SizedBox(height: 10,),
        buildListTile('Filters', Icon(Icons.settings)),
      ]),
    );
  }
}