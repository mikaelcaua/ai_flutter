import 'package:flutter/material.dart';
import '../../app/vielmodel/home_screen_vielmodel.dart';
import '../components/post_component.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenVielmodel homeScreenVielmodel = HomeScreenVielmodel(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: homeScreenVielmodel.addNewAiPost()
      , builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return CircularProgressIndicator();
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.builder(itemCount: homeScreenVielmodel.posts.length,itemBuilder: (context, index) {
                return PostComponent(userSurname: homeScreenVielmodel.posts[index].userSurname, message: homeScreenVielmodel.posts[index].message);
              },);
            }
            else{
              return Text('Error');
            }
        }
      },),
    );
  }
}