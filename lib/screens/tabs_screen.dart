import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/favourits_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
class tabscreen extends StatefulWidget {
  List favouritemeals;
 tabscreen(this.favouritemeals);
  @override
  _tabscreenState createState() => _tabscreenState();
}

class _tabscreenState extends State<tabscreen> {
   late List _pages ;
  void initState(){
    _pages=[
    {
      'page': categoriesscreen(),
       'title':'Categories',
    },
    {
      'page': favouritescreen(widget.favouritemeals),
      'title': 'Your Favourites',
    }
  ];
  super.initState();
  }
  int _selectedpageindex=0;
  void _selectpage(int value){
    setState(() {
      _selectedpageindex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedpageindex]['title']),),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedpageindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category")),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourites")),

        ],
        ),
        drawer: MainDrawer(),
      
    );
  }
}