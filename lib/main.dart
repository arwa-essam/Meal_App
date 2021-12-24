import 'package:flutter/material.dart';
//import 'dart.Ui';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/meal_screen.dart';
import './screens/meal_detail_screen.dart';

void main()=>runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Map _filters ={
'gluten': false,
'lactose':false,
'vegan':false,
'vegetarian':false,
};
List _availablemeals=DUMMY_MEALS;
List _favouritemeals=[];
void _setfilters(Map _filterdata){
setState(() {
  _filters=_filterdata;
  _availablemeals=DUMMY_MEALS.where((meal) {
    if(_filters['gluten']&& !meal.isGlutenFree){
      return false;
    };
    if(_filters['lactose']&& !meal.isLactoseFree){
      return false;
    }
    if(_filters['vegan']&& !meal.isVegan){
      return false;
    }
    if(_filters['vegetarian']&& !meal.isVegetarian){
      return false;
    }
    return true;

  }).toList();
});
}
 void _togglefavourites(String mealid){
  final existingindex= _favouritemeals.indexWhere((meal) => meal.id==mealid);
  if (existingindex>=0){
    setState(() {
       _favouritemeals.removeAt(existingindex);
    });
   
  }
  else {
    setState(() {
      _favouritemeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealid));
    });
  }
 }
 bool isMealFavourite(String id){
   return _favouritemeals.any((meal)=> meal.id==id);
 }




@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
     // home:categoriesscreen(),
     routes: {
       '/':(context)=>tabscreen(_favouritemeals),
       CategoryMealScreen.routeName:(context)=>CategoryMealScreen(_availablemeals),
       MealDetailScreen.routeName:(context)=>MealDetailScreen(_togglefavourites,isMealFavourite),
       FilterScreen.routeName:(context) => FilterScreen(_filters,_setfilters),
     },
    );
  }
}


  
  

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text("Meals App"),
      ),
      body: null,   
    );
  }
}
