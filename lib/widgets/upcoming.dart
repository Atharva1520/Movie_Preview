import 'package:flutter/material.dart';
import 'package:flutter_movie_preview/utils/text.dart';

import '../description.dart';

class Upcoming extends StatelessWidget {
  final List upcom;

  const Upcoming({super.key, required this.upcom});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedtext(
              text: "UpComing Movies", color: Colors.white70, size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 380,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: upcom.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                            name: upcom[index]['title'],
                            description: upcom[index]['overview'],
                            bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                upcom[index]['backdrop_path'],
                            posterurl: 'http://image.tmdb.org/t/p/w500' +
                                upcom[index]['poster_path'],
                            vote: upcom[index]['vote_average'],
                            launch_date: upcom[index]['release_date']),
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
                                upcom[index]['poster_path'],
                          ))),
                        ),
                        Container(
                          child: modifiedtext(
                            text: upcom[index]['title'] != null
                                ? upcom[index]['title']
                                : upcom[index]['name'],
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
