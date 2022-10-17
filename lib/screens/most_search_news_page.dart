import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app_6/models/news_model.dart';

import '../models/article_model.dart';

class MostSearchedNews extends StatefulWidget {
  const MostSearchedNews({Key? key}) : super(key: key);

  @override
  State<MostSearchedNews> createState() => _MostSearchedNewsState();
}

class _MostSearchedNewsState extends State<MostSearchedNews> {
  Future<News>? news;

  Future<News?> getNews() async {
    String url = "https://newsapi.org/v2/everything?q=apple&from=2022-10-16&to=2022-10-16&sortBy=popularity&apiKey=faf63fd10c864261b7eb3e40dbc59ee7";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as Map<String, dynamic>;
      return News.fromJson(json);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<News?>(
        future: getNews(),
        builder: (BuildContext context, AsyncSnapshot<News?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              News? news = snapshot.data;
              return newsListWidget(news?.articles);
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
          }
          return const Center(
            child: Text(
              "Nimdir xatolik bor",
              style: TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
  }

  Widget newsListWidget(List<Article>? articles) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: articles?.length ?? 0,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.4),
                  blurRadius: 4,
                )
              ]),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Image.network(articles?[index].urlToImage ?? ""),
              Text(articles?[index].content ?? "No data"),
              const SizedBox(height: 10,),
              Text("More 👇👇👇"),
              const SizedBox(height: 10,),
              Text(articles?[index].url ?? "No data", style: TextStyle(color: Colors.blueAccent),),
            ],
          ),
        );
      },
    );
  }
}