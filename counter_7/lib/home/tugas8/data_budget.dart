import 'package:counter_7/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/model/budget.dart';

class ShowBudget extends StatefulWidget {
  const ShowBudget({Key? key}) : super(key: key);

  @override
  State<ShowBudget> createState() => _ShowBudgetState();
}

class _ShowBudgetState extends State<ShowBudget> {
  var data = BudgetList.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Budget")),
      drawer: drawer(context),
      body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: data.length,
          itemBuilder: ((ctx, index) {
            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                shadowColor: Colors.black,
                elevation: 20,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].judul,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data[index].nominal.toString(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                                "${data[index].tanggal.day}/${data[index].tanggal.month}/${data[index].tanggal.year}"),
                            Text(data[index].jenis),
                          ],
                        )
                      ]),
                ));
          })),
    );
  }
}