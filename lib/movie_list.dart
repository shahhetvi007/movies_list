import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Color mainColor = const Color(0xff3C3261);
  var movies;

  Future<Map> getJson() async {
    Response response = await get(Uri.parse(
        'http://api.themoviedb.org/3/discover/movie?api_key=2b78225377903daf3ed9cd540114d65c'));
    return jsonDecode(response.body);
  }

  void getData() async {
    var data = await getJson();
    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: mainColor,
        ),
        title: Text(
          'Movies',
          style: TextStyle(
              color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Icon(
            Icons.menu,
            color: mainColor,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieTitle(
              mainColor: mainColor,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: movies == null ? 0 : movies.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Text(
                            movies[i]['title'],
                            style: TextStyle(
                                backgroundColor: Colors.white,
                                fontWeight: FontWeight.bold,
                                color: mainColor),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class MovieTitle extends StatelessWidget {
  final Color mainColor;
  const MovieTitle({Key? key, required this.mainColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Text(
        'Top Rated',
        style: TextStyle(
            fontSize: 40.0,
            color: mainColor,
            fontFamily: 'Arvo',
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }
}
