// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';//import 'package:untitled/modules/web_view/webview_sc.dart';
import 'news_app/web_view/webview_sc.dart';
Widget bulidArticalItem(artical,context) =>  InkWell(
  onTap: (){
    nevgitto(context,webview_screen(artical['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage("${artical["urlToImage"]}"),
                  fit: BoxFit.cover
              )
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text("${artical["title"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text("${artical["publishedAt"]}",
                  style: TextStyle(
                      color:Colors.grey
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget articalBludier(List News,{isSearch=false}) => ConditionalBuilder(
  condition:News.length>0,
  builder:(context) =>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context,index) => bulidArticalItem(News[index],context),
    separatorBuilder:(context,index) =>Container(
      height: 1,
      color: Colors.grey[300],
    ) ,
    itemCount: 20,
  ),
  fallback:(context) => isSearch?Container():Center(child: CircularProgressIndicator()),
);

void nevgitto(context,Widget) => Navigator.push(context,
    MaterialPageRoute(builder: (context) => Widget
    )
);


Widget meSlider( ) => Padding(
  padding: const EdgeInsets.all(15.0),
  child:   Container(
    color: Colors.grey,
    height: 1,
  ),
);
