import 'package:modified_news_app/controller/favorite_screen_controller.dart';
import 'package:modified_news_app/controller/home_screen_controller.dart';
import 'package:modified_news_app/model/news_api_res_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, this.index = 0, this.article});
  final int index;
  final Article? article;

  @override
  State<DetailScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProviderObj = context.watch<HomeScreenController>();
    final favoriteScreenState = context.watch<FavoriteScreenController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.article?.source?.name ?? "",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),


        actions: [
          IconButton(
              onPressed: () {
                Share.share(
                    "check latest news from my news app ${widget.article?.url ?? ""}");
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.article?.title ?? "",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.article?.author ?? "Unknown",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<FavoriteScreenController>().addToFavorite(
                        homeProviderObj
                            .newsApiCatResModel!.articles![widget.index!],
                        context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Added to Bookmark")));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  child: Text(
                    "Bookmark",
                    style: TextStyle(color: Colors.white,fontSize: 15),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Text(
              widget.article?.content ?? "",
              
            ),
            SizedBox(height: 15),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 5)),
                height: 200,
                width: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.article?.urlToImage ?? "",
                  
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
            SizedBox(height: 15),
            Center(
                child: ElevatedButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse(widget.article?.url ?? ""
                         
                          ));
                    },
                    child: Text("Read More")))
          ],
        ),
      ),
    );
  }
}