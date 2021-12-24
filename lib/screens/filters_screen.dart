import 'package:flutter/material.dart';
class FilterScreen extends StatefulWidget {
  static const routeName ='filter';
  final  savefilters;
  final Map currentfilters;
    FilterScreen(this.currentfilters,this.savefilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree=false;
  bool _lactoseFree=false;
  bool _vegan=false;
  bool _vegetarian=false;
  
  @override
  initState(){
    _glutenFree=widget.currentfilters['gluten'];
   _lactoseFree=widget.currentfilters['lactose'];
   _vegan=widget.currentfilters['vegan'];
   _vegetarian=widget.currentfilters['vegatarian'];
    super.initState();
  }


  Widget buildswitchlisttitle(String title,String discription,bool currentvalue,var updatevalue){
    return SwitchListTile(
      value: currentvalue,
     onChanged:(val) =>updatevalue(val),
     title: Text(title),
     subtitle: Text(discription),
    );
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters"),actions: [
        IconButton(
          onPressed:(){
            final selectedfilters={
           'gluten': _glutenFree,
            'lactose': _lactoseFree,
              'vegan': _vegan,
               'vegetarian':_vegetarian,
            };

            widget.savefilters();
            },
          icon: Icon(Icons.save))
      ], ),
      
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text("Adgust Your Meal Selection",
          style: TextStyle(
       color: Colors.black87,
       fontSize: 24,
       fontWeight: FontWeight.bold
     ),),
        ),
        Expanded(child: ListView(
          children: [
            buildswitchlisttitle(
              'Lactose-Free',
               'Only include Lactose-Free meals', 
            _lactoseFree,
            (newvalue){
            setState(() {
              _lactoseFree=newvalue;
            });
            }),
             buildswitchlisttitle(
              'Gluten-Free',
               'Only include Gluten-Free meals', 
            _glutenFree,
            (newvalue){
            setState(() {
              _glutenFree=newvalue;
            });
            }),
             buildswitchlisttitle(
              'Vegetarian',
               'Only include Vegetarian meals', 
            _vegan,
            (newvalue){
            setState(() {
              _vegetarian=newvalue;
            });
            }),
             buildswitchlisttitle(
              'Vegan',
               'Only include Vegan meals', 
            _glutenFree,
            (newvalue){
            setState(() {
              _vegan=newvalue;
            });
            })
          ],
        ))
      ],),

    );
  }
}