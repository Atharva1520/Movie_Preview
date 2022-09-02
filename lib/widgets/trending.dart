import 'package:flutter/material.dart';
import 'package:flutter_movie_preview/description.dart';
import 'package:flutter_movie_preview/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedtext(
              text: "Trending Movies", color: Colors.white70, size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 340,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                            name: trending[index]['title'],
                            description: trending[index]['overview'],
                            bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                trending[index]['backdrop_path'],
                            posterurl: 'http://image.tmdb.org/t/p/w500' +
                                trending[index]['poster_path'],
                            vote: trending[index]['vote_average'],
                            launch_date: trending[index]['release_date']),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                            'http://image.tmdb.org/t/p/w500' +
                                trending[index]['poster_path'],
                          ))),
                        ),
                        Container(
                          child: modifiedtext(
                            text: trending[index]['title'] != null
                                ? trending[index]['title']
                                : trending[index]['name'],
                            color: Colors.white60,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
