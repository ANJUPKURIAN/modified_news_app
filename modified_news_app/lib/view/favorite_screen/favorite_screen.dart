import 'package:modified_news_app/controller/favorite_screen_controller.dart';
import 'package:modified_news_app/view/detail_screen/detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Favorites"),
          backgroundColor:Colors.white,
        ),
        body: Consumer<FavoriteScreenController>(
          builder: (context, favoriteScreenState, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  itemCount: favoriteScreenState.favoriteList.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      article: favoriteScreenState
                                          .favoriteList[index].article),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 2),
                                      blurRadius: 6)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: favoriteScreenState
                                              .favoriteList[index]
                                              .article
                                              .urlToImage ??
                                          "",
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    )),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        favoriteScreenState
                                                .favoriteList[index]
                                                .article
                                                .title ??
                                            "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        favoriteScreenState
                                                .favoriteList[index]
                                                .article
                                                .author ??
                                            "",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<FavoriteScreenController>()
                                              .deleteFromFavorite(index);
                                        },
                                        icon: Icon(Icons.delete)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
            );
          },
        ));
  }
}