import 'package:flutter/material.dart';
import 'package:flutter_movie_preview/utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedtext(
              text: "Top Rated Movies", color: Colors.white70, size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 380,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                            name: toprated[index]['title'],
                            description: toprated[index]['overview'],
                            bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                toprated[index]['backdrop_path'],
                            posterurl: 'http://image.tmdb.org/t/p/w500' +
                                toprated[index]['poster_path'],
                            vote: toprated[index]['vote_average'],
                            launch_date: toprated[index]['release_date']),
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
                                toprated[index]['poster_path'],
                          ))),
                        ),
                        Container(
                          child: modifiedtext(
                            text: toprated[index]['title'] != null
                                ? toprated[index]['title']
                                : toprated[index]['name'],
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
