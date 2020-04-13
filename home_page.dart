import 'package:flutter/material.dart';
import 'package:food4me/food_category.dart';
import 'auth.dart';
import 'auth_provider.dart';
import 'home_top_info.dart';
import 'food_category.dart';
import 'search_field.dart';
import 'bought_foods.dart';
import 'food_data.dart';
import 'food_model.dart';

class HomePage extends StatelessWidget {


  
   HomePage({this.onSignedOut});
  final VoidCallback onSignedOut;
 
  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }
    List<Food> _foods = foods;
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        actions: <Widget>[
          FlatButton(
            child: Text('Logout', style: TextStyle(fontSize: 17.0, color: Colors.white)),
            onPressed: () => _signOut(context),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top:20.0, left: 20.0, right:20.0),
        children: <Widget>[
        HomeTopInfo(),
        FoodCategory(),
        SizedBox(height: 20.0 ,),
        SearchField(),
        SizedBox(height: 20.0 ,),
        Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Cele mai accesate magazine",
            style: TextStyle(
              fontSize:18.0,
              fontWeight: FontWeight.bold,



            )
            
            ),
            
            GestureDetector(
              onTap: () {},
                          child: Text("View All",
              style:TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent



              ),
              
              
              ),
            ),



          ],
           


        ),
        
        SizedBox(height: 20.0 ,),
        Column(
          children: _foods.map(_buildFoodItems).toList()
          
          ),

        ],
        ),
        
        );
      
  }
  Widget _buildFoodItems(Food food){
    return Container(
      
      margin:EdgeInsets.only(bottom: 20.0),
child: BoughtFoods(
  id: food.id,
  name: food.name,
  imagePath: food.imagePath,
  category: food.category,
  discount: food.discount,
  price: food.price,
  ratings: food.ratings,
),
      

    );
  
  }
}
