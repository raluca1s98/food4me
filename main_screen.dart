import 'package:flutter/material.dart';
import 'home_page.dart';
import 'auth.dart';
import 'auth_provider.dart';

class MainScreen extends StatefulWidget{
MainScreen({this.onSignedOut});
  final VoidCallback onSignedOut;
 

@override
_MainScreenState createState() => _MainScreenState();

}


class _MainScreenState extends State<MainScreen>{
   Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

int currentTabIndex = 0;

List<Widget> pages;
Widget currentPage;
HomePage homePage;


@override 

void initState(){

  super.initState();
  homePage = HomePage(onSignedOut: widget.onSignedOut);

  pages = [homePage];

  currentPage = homePage;
}


Widget build (BuildContext context){
  return Container(
    child: Scaffold(
      
      
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
setState(() {
    currentTabIndex = index;
    currentPage = pages[index];

});
        },
currentIndex: currentTabIndex,
type: BottomNavigationBarType.fixed,

        items: <BottomNavigationBarItem>[
BottomNavigationBarItem(
icon:Icon(Icons.home),
title: Text("Home")


),
BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    title: Text("Cumparaturi")
    ),
BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    title: Text("Favorite")
),

BottomNavigationBarItem(
    icon: Icon(Icons.person),
    title: Text("Profile")
    ),
        ]
        
        
        ),
body: currentPage,

    ),
  );
}

}