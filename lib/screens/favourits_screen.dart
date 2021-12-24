import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
class favouritescreen  extends StatelessWidget {
   List favouritemeals;
 favouritescreen(this.favouritemeals);

  @override
  Widget build(BuildContext context) {
    if(favouritemeals.isEmpty){
    return Center(
      child: Text("You have no favorites yet - start adding some!"),
    );
    }
    else{
      return ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
        favouritemeals[index].id,
        favouritemeals[index].title,
        favouritemeals[index].imageurl,
        favouritemeals[index].duration,
        favouritemeals[index].complexity,
        favouritemeals[index].affordability,
        );
      },
      itemCount: favouritemeals.length,
      );

    }
  }
}