import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Avatar Page'),
        actions: <Widget>
        [
          Container
          (
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar
            (
              backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/892018248757239808/byFBZNEN_400x400.jpg'),
              radius: 23.0,
            ),
          ),

          Container
          (
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar
            (
              child: Text('EJSP'),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: Center
      (
        child: FadeInImage
        (
          image: NetworkImage('https://pbs.twimg.com/profile_images/378800000061284068/f4680d46b1493b5820aaec1ae9a94707_400x400.jpeg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),      
    );
  }
}