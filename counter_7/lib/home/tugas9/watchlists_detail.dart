import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlists.dart';
import 'package:counter_7/home/tugas9/mywatchlists_page.dart';
import 'package:counter_7/widgets/drawer.dart';

class WatchListDetails extends StatefulWidget {
  WatchListDetails({Key? key}) : super(key: key);

  @override
  State<WatchListDetails> createState() => WatchListStateDetails();
}

class WatchListStateDetails extends State<WatchListDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist Details'),
      ),
      drawer: drawer(context),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Details.fetcher.title,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Release Date : " + Details.fetcher.releaseDate,
                style: const TextStyle(fontSize: 24)),
            Text("Rating : " + Details.fetcher.rating.toString(),
                style: const TextStyle(fontSize: 24)),
            Text("Watched : " + Details.showStatus(),
                style: const TextStyle(fontSize: 24)),
            Text("Review : " + Details.fetcher.review,
                style: const TextStyle(fontSize: 24)),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back", style: const TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
