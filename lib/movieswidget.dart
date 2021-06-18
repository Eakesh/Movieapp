import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MovieDetail extends StatelessWidget {
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieDetail(this.movie);
  Color mainColor = const Color(0xff3C3261);

  Widget _nullMovie() {
    return new Stack(
      fit: StackFit.expand,
      children: [
        new Image.network(
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-movies-1614634680.jpg?crop=1.00xw:1.00xh;0,0&resize=768:*',
          fit: BoxFit.cover,
        ),
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        new SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 400.0,
                    height: 400.0,
                  ),
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      image: new DecorationImage(
                          image: new NetworkImage(
                              'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-movies-1614634680.jpg?crop=1.00xw:1.00xh;0,0&resize=768:*'),
                          fit: BoxFit.cover),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            offset: new Offset(0.0, 10.0))
                      ]),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                        'Sorry this Movie is yet to come!',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'Arvo'),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: movie['poster_path'] == null
          ? _nullMovie()
          : new Stack(fit: StackFit.expand, children: [
              new Image.network(
                image_url + movie['poster_path'],
                fit: BoxFit.cover,
              ),
              new BackdropFilter(
                filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: new Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              new SingleChildScrollView(
                child: new Container(
                  margin: const EdgeInsets.all(20.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        alignment: Alignment.center,
                        child: new Container(
                          width: 400.0,
                          height: 400.0,
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            image: new DecorationImage(
                                image: new NetworkImage(
                                    image_url + movie['poster_path']),
                                fit: BoxFit.cover),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                  offset: new Offset(0.0, 10.0))
                            ]),
                      ),
                      new Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 0.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                                child: new Text(
                              movie['title'],
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontFamily: 'Arvo'),
                            )),
                            new Text(
                              '${movie['vote_average']}/10',
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Arvo'),
                            )
                          ],
                        ),
                      ),
                      new Text(movie['overview'],
                          style: new TextStyle(
                              color: Colors.white, fontFamily: 'Arvo')),
                      new Padding(padding: const EdgeInsets.all(10.0)),
                      new Row(
                        children: <Widget>[
                          new Expanded(
                              child: new Container(
                            width: 150.0,
                            height: 60.0,
                            alignment: Alignment.center,
                            child: new Text(
                              'Rate Movie',
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Arvo',
                                  fontSize: 20.0),
                            ),
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(10.0),
                                color: const Color(0xaa3C3261)),
                          )),
                          new Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: new Container(
                              padding: const EdgeInsets.all(16.0),
                              alignment: Alignment.center,
                              child: new Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  color: const Color(0xaa3C3261)),
                            ),
                          ),
                          new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Container(
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: new Icon(
                                  Icons.bookmark,
                                  color: Colors.white,
                                ),
                                decoration: new BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    color: const Color(0xaa3C3261)),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
    );
  }
}
//this is the page where see the details of a individual movie such as rating and over view and 
//image of the movie 
