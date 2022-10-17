import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app_6/models/news_model.dart';

import '../models/article_model.dart';

class MajorNewsPage extends StatefulWidget {
  const MajorNewsPage({Key? key}) : super(key: key);

  @override
  State<MajorNewsPage> createState() => _MajorNewsPageState();
}

class _MajorNewsPageState extends State<MajorNewsPage> {
  Future<News>? news;

  Future<News?> getNews() async {
    String apiKey = "";
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=faf63fd10c864261b7eb3e40dbc59ee7";

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
        builder: (BuildContext context, AsyncSnapshot<News?> birnima) {
          if (birnima.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (birnima.connectionState == ConnectionState.done) {
            if (birnima.hasData) {
              News? news = birnima.data;
              return newsListWidget(news?.articles);
            }
            if (birnima.hasError) {
              return Center(child: Text(birnima.error.toString()));
            }
          }
          return Container(
            child: Center(
              child: Text(
                "Nimdir xatolik bor",
                style: TextStyle(fontSize: 24),
              ),
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
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.4),
                  blurRadius: 4,
                )
              ]),
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Image.network(articles?[index].urlToImage ?? ""),
              Text(articles?[index].content ?? "No data"),
            ],
          ),
        );
      },
    );
  }
}