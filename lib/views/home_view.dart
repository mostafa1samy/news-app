import 'package:flutter/material.dart';
import 'package:flutternews/model/article_model.dart';
import 'package:flutternews/viewmodel/list_of_articles_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int tabBarIndex = 0;
  int bottomBarIndex = 0;
  List<Article> a = [];
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
     Provider.of<ArticlesListViewModel>(context, listen: false)
        .fetchArticles();
    a =  Provider.of<ArticlesListViewModel>(context, listen: false)
        .articlesList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(
                indicatorColor: Colors.blueAccent,
                onTap: (value) {
                  setState(() {
                    tabBarIndex = value;
                  });
                },
                tabs: [
                  Text(
                    "all",
                    style: TextStyle(
                        color:
                            tabBarIndex == 0 ? Colors.black : Colors.lightBlue,
                        fontSize: tabBarIndex == 0 ? 16 : null),
                  ),
                  Text("sports",
                      style: TextStyle(
                          color: tabBarIndex == 1
                              ? Colors.black
                              : Colors.lightBlue,
                          fontSize: tabBarIndex == 1 ? 16 : null)),
                  Text("health",
                      style: TextStyle(
                          color: tabBarIndex == 2
                              ? Colors.black
                              : Colors.lightBlue,
                          fontSize: tabBarIndex == 2 ? 16 : null)),
                  Text("poltical",
                      style: TextStyle(
                          color: tabBarIndex == 3
                              ? Colors.black
                              : Colors.lightBlue,
                          fontSize: tabBarIndex == 3 ? 16 : null)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: ListView.builder(itemBuilder: (context, index) =>Column(
                    children: [
                      
                      Text(a[index].description)
                      
                    ],
                  ),
                  itemCount: a.length,),
                ),
                Text("data"),
                Text("data"),
                Text("data")
              ],
            ),
          ),
        ),
      ],
    );
  }

  all() async {
    await Provider.of<ArticlesListViewModel>(context, listen: false)
        .fetchArticles();
    var a = await Provider.of<ArticlesListViewModel>(context, listen: false)
        .articlesList;
    return a;
  }

  Widget productView() {
    var a = all();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .8,
      ),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image(
                image: NetworkImage(a[index].imageUrl),
                fit: BoxFit.fill,
              )),
              Positioned(
                bottom: 0,
                child: Opacity(
                  opacity: .6,
                  child: Container(
                    color: Colors.white,
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            a[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(a[index].description)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      itemCount: a.length,
    );
  }
}
