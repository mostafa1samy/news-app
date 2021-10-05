import 'package:flutter/material.dart';
import 'package:flutternews/viewmodel/list_of_articles_view_model.dart';
import 'package:flutternews/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticlesListViewModel>(
      create: (context)=>ArticlesListViewModel(),

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeView(),

      ),
    );
  }
}




