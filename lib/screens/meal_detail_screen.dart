import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
class MealDetailScreen extends StatelessWidget {
  final togglefavourites;
  final isMealFavourite;
  MealDetailScreen(this.togglefavourites,this.isMealFavourite);
 static const routeName = 'meal_detail';
 Widget buildtitle (String text){
   return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black
      ),));
 }
 Widget buildcontainer(Widget child){
  return   Container(
        decoration:  BoxDecoration(color: Colors.white,
        border: Border.all(color:Colors.grey),
        borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding:  EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,

    );
 }


  Widget build(BuildContext context) {
    final mealid =ModalRoute.of(context)!.settings.arguments as String;
    final selectedmeal=DUMMY_MEALS.firstWhere((e)=>e.id==mealid);

    return Scaffold(
appBar: AppBar(title:Text(selectedmeal.title,),),
body: SingleChildScrollView(
  child:
 Column(
  children: [
    Container(
      height: 300,
      width: double.infinity,
      child: Image.network(selectedmeal.imageurl,fit: BoxFit.cover,),
    ),
    buildtitle("Ingredients"),
    buildcontainer(
         ListView.builder(
          itemBuilder:(ctx,index)=>Card(
            color:Colors.deepPurple,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Text(selectedmeal.ingredients[index]),
            ),
          ),
          itemCount: selectedmeal.ingredients.length),

    ),
    buildtitle("Steps"),
    buildcontainer(  ListView.builder(
          itemBuilder:(ctx,index)=>Column(
     children: [
       ListTile(
         leading: CircleAvatar(child: Text("# ${index+1}"),),
         title: Text(selectedmeal.steps[index]),
       ),
       Divider(),//spletting between widgets
     ],
          ),

          itemCount: selectedmeal.steps.length),)

  ],
),),
floatingActionButton:FloatingActionButton(
onPressed:()=> togglefavourites(mealid),
child: Icon(
  isMealFavourite(mealid) ? Icons.star : Icons.star_border,)
)
  );
  }
}