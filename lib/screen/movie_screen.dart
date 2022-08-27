import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  final String menuTitle;
  final String title;
  final String description;
  final String posterUrl;
  final String backgroundUrl;
  final String releaseDate;

  const MovieScreen(this.menuTitle, this.title, this.description,
      this.posterUrl, this.backgroundUrl, this.releaseDate,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(menuTitle),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 270,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image: NetworkImage(backgroundUrl),
                                  fit: MediaQuery.of(context).size.width > 500
                                      ? BoxFit.fitWidth
                                      : BoxFit.cover)),
                        ),
                        Container(
                          height: 271,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: const Alignment(0, 1),
                                  end: const Alignment(0, 0.06),
                                  colors: [
                                Colors.white,
                                Colors.white.withOpacity(0)
                              ])),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 200,
                        left: 20,
                        right: 20,
                        child: Row(
                          children: [
                            Container(
                              width: 130,
                              height: 195,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(posterUrl),
                                      fit: BoxFit.cover)),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Text(
                                      releaseDate,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(70)),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Storyline',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      description,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
