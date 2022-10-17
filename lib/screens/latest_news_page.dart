import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app_6/models/news_model.dart';

import '../models/article_model.dart';

class LatestNewsPage extends StatefulWidget {
  const LatestNewsPage({Key? key}) : super(key: key);

  @override
  State<LatestNewsPage> createState() => _LatestNewsPageState();
}

class _LatestNewsPageState extends State<LatestNewsPage> {
  Future<News>? news;

  Future<News?> getNews() async {
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2022-09-17&sortBy=publishedAt&apiKey=faf63fd10c864261b7eb3e40dbc59ee7";

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
            return const Center(child: CircularProgressIndicator());
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
            ],
          ),
        );
      },
    );
  }
}