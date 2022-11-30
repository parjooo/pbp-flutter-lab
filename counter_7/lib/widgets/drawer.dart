import 'package:flutter/material.dart';
import 'package:counter_7/home/tugas7/tugas7.dart';
import 'package:counter_7/home/tugas8/data_budget.dart';
import 'package:counter_7/home/tugas8/tambah_budget.dart';
import 'package:counter_7/home/tugas9/mywatchlists_page.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        // Menambahkan clickable menu
        ListTile(
          title: const Text('counter_7'),
          onTap: () {
            // Route menu ke halaman utama
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Counter()),
            );
          },
        ),
        ListTile(
          title: const Text('Tambah Budget'),
          onTap: () {
            // Route menu ke halaman form
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BudgetForm()),
            );
          },
        ),
        ListTile(
          title: const Text('Data Budget'),
          onTap: () {
            // Route menu ke halaman form
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ShowBudget()),
            );
          },
        ),
        ListTile(
          title: const Text('My WatchList'),
          onTap: () {
            // Route menu ke halaman form
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WatchList()),
            );
          },
        ),
      ],
    ),
  );
}
