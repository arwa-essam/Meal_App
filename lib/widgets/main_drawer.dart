import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title , IconData icon, var tabHandler){
    return ListTile(
      leading: Icon(icon,size: 26,color: Colors.deepPurple,),
      title: Text(title,
     style: TextStyle(
       color: Colors.black87,
       fontSize: 24,
       fontWeight: FontWeight.bold
     ),
      ),
    onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text("Cooking Up!",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
          ),
     SizedBox(height: 20),
     buildListTitle("Meal", Icons.restaurant, (){Navigator.of(context).pushReplacementNamed('/');}),
     buildListTitle("Filters", Icons.settings, (){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}),
        ],
      ),
    );
  }
}