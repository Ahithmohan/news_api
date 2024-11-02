import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/get_news_response_model.dart';
import 'package:newsapp/widgets/BuildNewsWidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetNewsResponceModel newsResponce = GetNewsResponceModel();
  bool isLoading = true;

  getNews() async {
    final response = await Dio().get(
        "https://gnews.io/api/v4/search?q=example&lang=en&country=us&max=10&apikey=7b928598036d8c831d5a5381b2df5694");
    print(response.data["totalArticles"]);
    newsResponce = GetNewsResponceModel.fromJson(response.data);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    print("loading");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text(
          'Today News',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 4),
        ),
      ),
      body: isLoading == false
          ? PageView.builder(
              itemCount: newsResponce.articles?.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return BuildNewsWidgets(
                    imgUrl: newsResponce.articles?[index].image ?? "",
                    newsHeading: newsResponce.articles?[index].title ?? "",
                    newsDis: newsResponce.articles?[index].description ?? "");
              },
            )
          : const Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            )),
    );
  }
}
