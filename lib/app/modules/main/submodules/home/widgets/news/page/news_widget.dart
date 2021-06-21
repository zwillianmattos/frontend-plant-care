import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:relative_scale/relative_scale.dart';
import '../models/news.dart';
import './news_store.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends ModularState<NewsWidget, NewsStore> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SizedBox(
        height: width > 500 ? sy(120) : 200,
        child: Observer(builder: (context) {
          if (controller.newsList.length <= 0)
            return Center(
              child: CircularProgressIndicator(),
            );

          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.newsList.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                NewsModel item = controller.newsList[index];

                return Container(
                  margin:
                      EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: white,
                    image: DecorationImage(
                      image: NetworkImage(item.urlToImage.toString()),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  width: width > 500 ? sx(100) : sx(width),
                  child: InkWell(
                    onTap: () {
                      Modular.to.pushNamed("/home/news",
                          arguments: item, forRoot: true);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [
                              0.1,
                              0.7
                            ],
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent
                            ]),
                      ),
                      child: Align(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            item.title.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                );
              });
        }),
      );
    });
  }
}