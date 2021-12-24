import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';
class CategoryMealScreen extends StatefulWidget {
  static const routeName ='category_meals';
  final List availablemeals;
  CategoryMealScreen(this.availablemeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List categoryMeals;
  @override
  void didChangeDependencies(){
    final routArg =ModalRoute.of(context)!.settings.arguments as Map;
    final categoryid =routArg['id'];
     categoryTitle =routArg['title'];
     categoryMeals =widget.availablemeals.where((meal){
      return meal.categories.contains(categoryid);

    }).toList();
    super.didChangeDependencies();
  }
  void _removeMeal (String mealid){
    setState(() {
      categoryMeals.removeWhere((meal) =>meal.id==mealid );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(categoryTitle) ,),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
        categoryMeals[index].id,
        categoryMeals[index].title,
        categoryMeals[index].imageurl,
        categoryMeals[index].duration,
        categoryMeals[index].complexity,
        categoryMeals[index].affordability,
  );
      },
      itemCount: categoryMeals.length,
      )
      
    );
  }
}