import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './movieswidget.dart';

class MovieList extends StatefulWidget {
  @override
  MovieListState createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  var search;
  var movies;
  Color mainColor = const Color(0xff3C3261);
  final TextEditingController _controller = new TextEditingController();

  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            mTile(),
            new Expanded(
              child: new ListView.builder(
                  itemCount: movies == null ? 0 : movies.length,
                  itemBuilder: (context, i) {
                    return new FlatButton(
                      child: new MovieCell(movies, i),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) {
                          return new MovieDetail(movies[i]);
                        }));
                      },
                      color: Colors.white,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget mTile() {
    return Column(children: [
      new Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 16.0, 0.0, 16.0), //4,16,0,16
        child: Align(
          alignment: Alignment.topLeft,
          child: new Text(
            'Home',
            style: new TextStyle(
                fontSize: 20.0,
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arvo'),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: new BorderSide(width: 2, color: Colors.black)),
              hintText: 'Enter movie name',
              labelText: 'search',
              suffixIcon: Icon(Icons.search)),
          controller: _controller,
          onChanged: (value) {
            search = value;
          },
        ),
      ),
    ]);
  }

  Future<Map> getJson() async {
    var url = geturl();
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Please turn the internet on");
    }
  }

  String geturl() {
    if (search == null || search == "") {
      return 'http://api.themoviedb.org/3/discover/movie?api_key=9a7668da54655c7286427d6726504357';
    } else {
      return 'https://api.themoviedb.org/3/search/movie?api_key=9a7668da54655c7286427d6726504357&language=en-US&query=${search}&include_adult=false';
    }
  }
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = const Color(0xff3C3261);
  String image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCell(this.movies, this.i);

  Widget po() {
    return Row(
      children: [
        new Padding(
          padding: const EdgeInsets.all(0.0),
          child: new Container(
            margin: const EdgeInsets.all(16.0),
            child: Container(
              width: 140.0,
              height: 180.0,
            ),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Colors.grey,
              image: new DecorationImage(
                  image: NetworkImage(
                      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-movies-1614634680.jpg?crop=1.00xw:1.00xh;0,0&resize=768:*'),
                  fit: BoxFit.cover),
              boxShadow: [
                new BoxShadow(
                    color: mainColor,
                    blurRadius: 5.0,
                    offset: new Offset(2.0, 5.0))
              ],
            ),
          ),
        ),
        new Expanded(
          child: new Container(
            margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: new Column(
              children: [
                new Text(
                  "Stay tuned for more",
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Arvo',
                      fontWeight: FontWeight.bold,
                      color: mainColor),
                ),
                new Padding(padding: const EdgeInsets.all(2.0)),
                new Text(
                  "Sorry this not yet upload as these movies are uploaded you will be intimated",
                  maxLines: 3,
                  style: new TextStyle(
                      color: const Color(0xff8785A4), fontFamily: 'Arvo'),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        movies[i]['poster_path'] == null
            ? po()
            : Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Container(
                      margin: const EdgeInsets.all(16.0),
                      child: new Container(
                        width: 140.0,
                        height: 180.0,
                      ),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        color: Colors.grey,
                        image: new DecorationImage(
                            image: new NetworkImage(
                                image_url + movies[i]['poster_path']),
                            fit: BoxFit.cover),
                        boxShadow: [
                          new BoxShadow(
                              color: mainColor,
                              blurRadius: 5.0,
                              offset: new Offset(2.0, 5.0))
                        ],
                      ),
                    ),
                  ),
                  new Expanded(
                      child: new Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                    child: new Column(
                      children: [
                        new Text(
                          movies[i]['title'],
                          style: new TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Arvo',
                              fontWeight: FontWeight.bold,
                              color: mainColor),
                        ),
                        new Padding(padding: const EdgeInsets.all(2.0)),
                        new Text(
                          movies[i]['overview'],
                          maxLines: 3,
                          style: new TextStyle(
                              color: const Color(0xff8785A4),
                              fontFamily: 'Arvo'),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  )),
                ],
              ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
//this is the page where we see the  list of movies as we also call it as front page 

