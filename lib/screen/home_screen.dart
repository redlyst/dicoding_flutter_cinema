import 'package:dicoding_cinema/screen/movie_screen.dart';
import 'package:flutter/material.dart';
import '../model/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool ticketStatus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicoding Cinema'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        child: Text(
                          'Hello Buddy!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text("Let's explore your favorite movies",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.indigo, width: 1)),
                    child: Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/avatar.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Divider(
                color: Colors.indigo,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                'Special For You',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: InkWell(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Redeem Ticket?'),
                        content: const Text(
                            'Show this confirmation redeem ticket to the ticket officer and click redeem.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                ticketStatus = true;
                                Navigator.pop(context, 'REDEEM');
                              });
                            },
                            child: const Text(
                              'REDEEM',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                ticketStatus = false;
                                Navigator.pop(context, 'CANCEL');
                              });
                            },
                            child: const Text('CANCEL'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'GRAND OPENING',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Free snack and lemon drink!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: ticketStatus == false,
                              child: const Text(
                                'OFF ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Text(
                              ticketStatus ? 'EXPIRED' : '40%',
                              style: TextStyle(
                                  color: ticketStatus
                                      ? Colors.red
                                      : Colors.yellowAccent,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                'In Theater Now',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    final Movie movies = movieList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieScreen(
                                    'In Theater Now',
                                    movies.title,
                                    movies.description,
                                    movies.posterUrl,
                                    movies.backgroundUrl,
                                    movies.releaseDate)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? 10 : 0,
                            right: (index == movieList.length - 1) ? 10 : 16),
                        child: Container(
                          height: 180,
                          width: 320,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(movies.backgroundUrl),
                                  fit: BoxFit.cover)),
                          child: Container(
                            height: 180,
                            width: 320,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.61),
                                      Colors.black.withOpacity(0)
                                    ])),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movies.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  movies.releaseDate,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Genres',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10)),
                          height: 40,
                          margin: const EdgeInsets.all(5),
                          child: const Center(
                            child: Text(
                              'Action',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10)),
                          height: 40,
                          margin: const EdgeInsets.all(5),
                          child: const Center(
                            child: Text(
                              'Crime',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10)),
                          height: 40,
                          margin: const EdgeInsets.all(5),
                          child: const Center(
                            child: Text(
                              'Drama',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10)),
                          height: 40,
                          margin: const EdgeInsets.all(5),
                          child: const Center(
                            child: Text(
                              'War',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          )),
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                'Upcoming Movies',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    final Movie movies = movieList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieScreen(
                                    'Upcoming Movies',
                                    movies.title,
                                    movies.description,
                                    movies.posterUrl,
                                    movies.backgroundUrl,
                                    movies.releaseDate)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? 10 : 0,
                            right: (index == movieList.length - 1) ? 10 : 16),
                        child: Container(
                          height: 200,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(movies.posterUrl),
                                  fit: BoxFit.cover)),
                          child: Container(
                            height: 200,
                            width: 130,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.61),
                                      Colors.black.withOpacity(0)
                                    ])),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const Padding(padding: EdgeInsets.all(20)),
          ],
        ),
      ),
    );
  }
}
