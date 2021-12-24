import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';
class categoriesscreen extends StatelessWidget{
Widget build (BuildContext context){
  return Scaffold(
  body: GridView(
  padding: EdgeInsets.all(25),
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 200,
  childAspectRatio: 3/2,
  crossAxisSpacing: 20,
  mainAxisSpacing: 20,
  ),
  children:DUMMY_CATEGORIES.map((cat)=>
     CategoryItem(cat.id,cat.title,cat.color)
    
).toList(),
  ));
}
}