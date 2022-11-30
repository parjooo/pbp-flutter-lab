import 'package:counter_7/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlists.dart';
import 'package:counter_7/home/tugas9/watchlists_detail.dart';

class Details {
  static late Fields _getFields;
  static Fields get fetcher => _getFields;
  static String status = "✗";

  static String showStatus() {
    if (_getFields.watched) {
      status = "✓";
    }
    return status;
  }
}

class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  Future<List<MyWatchList>> fetchwatchlist() async {
    var url =
        Uri.parse('https://tugas-2-pbp-jay.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // convert the json data into watchlist object
    List<MyWatchList> listwatchlist = [];
    for (var d in data) {
      if (d != null) {
        listwatchlist.add(MyWatchList.fromJson(d));
      }
    }
    return listwatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watchlist'),
        ),
        drawer: drawer(context),
        body: FutureBuilder(
            future: fetchwatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "My Watchlists is empty, sadge D:",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Details._getFields =
                                          snapshot.data![index].fields;
                                      print(Details.fetcher.toString());
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WatchListDetails()),
                                      );
                                    },
                                    child: Text(
                                      "${snapshot.data![index].fields.title}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink,
                                      ),
                                    )),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
