import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageurl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(this.id,this.title,
  this.imageurl,
  this.duration,
  this.complexity,
  this.affordability,);

  void selectmeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
    arguments:id 
    ).then((result){
      // if(result !=null){
      //   removeItem(result);
      // }
    });

  }
  String get Complexitytext{
    switch(complexity){
      case Complexity.Simple :return 'Simple' ; break;
      case Complexity.Challenging :return 'Challanging' ; break;
      case Complexity.Hard :return 'Hard' ; break;
      default : return 'UnKnown';  break;
    

    }

  }
  String get affordabilitytext{
    switch(affordability){
      case Affordability.Affordable :return 'Affordable' ; break;
      case Affordability.Pricey :return 'Pricy' ; break;
      case Affordability.Luxurious :return 'Luxurious' ; break;
      default : return 'UnKnown';  break;
    

    }

  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(25)),
          elevation: 6,
          margin:EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(15) ,
                      topRight: Radius.circular(15),
                    ),
                  child: Image.network(imageurl,height: 200,width: double.infinity,
                  fit:  BoxFit.cover,),

                  ),
                  Positioned(
                    bottom: 20,
                    left: 10,
  
                    child:Container(
                      width: 300,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(title,
                       style: TextStyle(fontSize: 26,color: Colors.white),
                       softWrap: true,
                       overflow: TextOverflow.fade,),

                    ) ),
                ],
              ),
              Padding(padding: EdgeInsets.all(20),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                
                  Row(
                    children: [
                      Icon(Icons.schedule),
                       SizedBox(width: 6,),
                      Text("$duration min"),
                    ],

                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text("$Complexitytext"),
                    ],

                  ),
                  Row(
                    children: [
                       Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text("$affordabilitytext"),
                    ],
                  )
                ],
              )
              )
            ],
          ),

      ),
    );
  }
}
