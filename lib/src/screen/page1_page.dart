import 'package:animaciones_app/src/screen/navigation_page.dart';
import 'package:animaciones_app/src/screen/twitter_paga.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Animation'),
        actions: <Widget>[
          IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TwitterPage()));
              }),
          SlideInLeft(
            from: 100,
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) => PageOne()));
              },
            ),
          )
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NavigationPage()));
          },
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElasticIn(
            delay: Duration(milliseconds: 1100),
            child: Icon(
              Icons.new_releases,
              color: Colors.blue,
              size: 40.0,
            ),
          ),
          FadeInDown(
            delay: Duration(milliseconds: 200),
            child: Text(
              'Title',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w200),
            ),
          ),
          FadeInDown(
            delay: Duration(milliseconds: 1800),
            child: Text(
              'I am a small text',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
          ),
          FadeInLeft(
            delay: Duration(milliseconds: 1100),
            child: Container(
              width: 220,
              height: 2,
              color: Colors.blue,
            ),
          )
        ],
      )),
    );
  }
}
