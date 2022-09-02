import 'package:flutter/material.dart';
import 'package:flutter_movie_preview/utils/text.dart';

import '../description.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedtext(
              text: "Popular TV Shows", color: Colors.white70, size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                            name: tv[index]['name'],
                            description: tv[index]['overview'],
                            bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                tv[index]['backdrop_path'],
                            posterurl: 'http://image.tmdb.org/t/p/w500' +
                                tv[index]['poster_path'],
                            vote: tv[index]['vote_average'],
                            launch_date: tv[index]['first_air_date']),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500' +
                                        tv[index]['backdrop_path'],
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: modifiedtext(
                            text: tv[index]['name'] != null
                                ? tv[index]['name']
                                : 'Loading',
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
