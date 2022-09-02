import 'package:flutter/material.dart';
import 'package:flutter_movie_preview/utils/text.dart';
import 'package:flutter_movie_preview/widgets/toprated.dart';
import 'package:flutter_movie_preview/widgets/trending.dart';
import 'package:flutter_movie_preview/widgets/tv.dart';
import 'package:flutter_movie_preview/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topratedmovies = [];
  List tv = [];
  List UpcomingM = [];
  final String api_key = 'f6243cb5d63f5dbcc9a3fe57c2284f17';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjI0M2NiNWQ2M2Y1ZGJjYzlhM2ZlNTdjMjI4NGYxNyIsInN1YiI6IjYzMTE5NTZjMGQyOTQ0MDA3OTU5YjA3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.51E48nabM3ykqbBrNQLD-_ltdDzkQ5pxou5Zith4aqo';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbwithcusstomlogs = TMDB(ApiKeys(api_key, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbwithcusstomlogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithcusstomlogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithcusstomlogs.v3.tv.getPopular();
    Map upmovresult = await tmdbwithcusstomlogs.v3.movies.getUpcoming();

    setState(() {
      trendingMovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
      UpcomingM = upmovresult['results'];
    });
    print(trendingMovies);
    print(topratedresult);
    print(tv);
    print(upmovresult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: modifiedtext(text: "Movie App", color: Colors.white, size: 30),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TopRated(toprated: topratedmovies),
          TV(tv: tv),
          TrendingMovies(trending: trendingMovies),
          Upcoming(upcom: UpcomingM)
        ],
      ),
    );
  }
}
