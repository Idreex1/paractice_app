
import 'package:flutter/material.dart';
import 'package:paractice_app1/helper/Widgets/widgets_screen.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: DefaultTabController(length: 3, child: 
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Tab Bar',style: TextStyle(color: Colors.white),),
          leading: DialogShowWidget(context),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.settings,color: Colors.white,),),
            Tab(icon: Icon(Icons.person,color: Colors.white,),),
            Tab(icon: Icon(Icons.favorite,color: Colors.white,),)
          ]),
        ),
        body: TabBarView(children: [
        Tab(child: Column(
          children: [
            Text('Settings',style: TextStyle(color: Colors.white),),
            Icon(Icons.settings),
          ],
        ),),
            Tab(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text('Favorite',style: TextStyle(color: Colors.white),)
                  
                ],
              ),
            ),),
            Tab(icon: Icon(Icons.favorite),)
          
        ]),
       backgroundColor: Colors.black,
      ),
      ),
    );
  }
}