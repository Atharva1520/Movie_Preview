import 'package:flutter/material.dart';
import 'package:flutter_movie_preview/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, launch_date;
  final double vote;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      child: modifiedtext(
                          text: '⭐ Average Rating : ' + vote.toString(),
                          color: Colors.yellow,
                          size: 18))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: modifiedtext(
                  text: name != null ? name : 'Not Loaded',
                  color: Colors.white,
                  size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modifiedtext(
                  text: 'Relasing on - ' + launch_date.toString(),
                  color: Colors.white,
                  size: 14),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: modifiedtext(
                        text: description, color: Colors.white, size: 18),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
