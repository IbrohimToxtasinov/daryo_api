import 'package:flutter/material.dart';
import 'package:my_app_6/screens/darwer_page.dart';
import 'package:my_app_6/screens/latest_news_page.dart';
import 'package:my_app_6/screens/major_news_page.dart';
import 'package:my_app_6/screens/most_search_news_page.dart';


class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
        title: const Text("Daryo"),
        actions: [Icon(Icons.search,color: Colors.white,size: 30,),SizedBox(width: 10,)],
        bottom: const TabBar(
          isScrollable: true,
          tabs: [
            Tab(child: Text("SO'NGI YANGILIKLAR")),
            Tab(child: Text("ASOSIY YANGILIKLAR")),
            Tab(child: Text("ENG KO'P QIDIRILGAN HABARLAR")),
          ]), 
        ),      
        body: const TabBarView(
          children: [
            LatestNewsPage(),
            MajorNewsPage(),
            MostSearchedNews(),
          ]
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}