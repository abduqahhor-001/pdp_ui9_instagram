import 'package:flutter/material.dart';

import 'package:pdp_ui9_instagram/model/post_model.dart';
import 'package:pdp_ui9_instagram/model/story_model.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  List<Post> _posts = [
    Post("Brianne", "assets/images/user_1.jpeg", "assets/images/feed_1.jpeg", "Consequatur nihil aliquid omnis consequatur."),
    Post("Henri", "assets/images/user_2.jpeg", "assets/images/feed_2.jpeg", "Consequatur nihil aliquid omnis consequatur."),
    Post("Mariano", "assets/images/user_3.jpeg", "assets/images/feed_3.jpeg", "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            // Stories
            Container(

              margin: EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Stories",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70
                    ),
                  ),
                ],
              ),
            ),

            // Story list
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story) {
                  return _itemOfStory(story);
                }).toList(),
              ),
            ),

            // Post list
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (ctx, i) {
                  return _itemOfPost(_posts[i]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(story.name,style: TextStyle(color: Colors.white70),),
      ],
    );
  }

  Widget _itemOfPost(Post post ) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.username),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(post.userImage,style: TextStyle(color: Colors.white70),),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.white70,),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          FadeInImage(
            image: AssetImage(post.postImage),
            placeholder: AssetImage("assets/images/placeholder.png"),
            width: MediaQuery.of(context).size.width,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border , color: Colors.white70,),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mode_comment, color: Colors.white70,),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send, color: Colors.white70,),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_border, color: Colors.white70,),
              ),
            ],
          ),

          // Tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Sigmund, ",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: "Yessenia, ",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: "Dayana, ",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "1263 others",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // Caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.username,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: " ${post.caption}",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          // Post date
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text(
              "Febuary 2020",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
