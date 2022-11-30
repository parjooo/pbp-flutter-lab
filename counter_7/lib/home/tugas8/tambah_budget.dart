import 'package:flutter/material.dart';
import 'package:counter_7/widgets/drawer.dart';
import 'package:counter_7/model/budget.dart';

class BudgetForm extends StatefulWidget {
  const BudgetForm({Key? key}) : super(key: key);

  @override
  State<BudgetForm> createState() => _BudgetFormState();
}

class _BudgetFormState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  String? _judul;
  int? _nominal;
  String? _jenis;
  DateTime tanggal = DateTime.now();

  List<String> jenisBudget = ['Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Budget"),
      ),
      drawer: drawer(context),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Beli Steam Wallet",
                          labelText: "Judul",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "50000",
                          labelText: "Nominal",
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            if (value != '') {
                              _nominal = int.tryParse(value!);
                            }
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            if (value != '') {
                              _nominal = int.parse(value!);
                            }
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          } else if (_nominal == null) {
                            return 'Nominal harus angka!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 150,
                            child: DropdownButtonFormField(
                                isExpanded: false,
                                hint: const Text("Pilih Jenis"),
                                value: _jenis,
                                items: jenisBudget.map((String jenis) {
                                  return DropdownMenuItem(
                                    value: jenis,
                                    child: Text(jenis),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _jenis = newValue!;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return "Pilih Jenis";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  "${tanggal.day}/${tanggal.month}/${tanggal.year}"),
                              IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2075),
                                  ).then((date) {
                                    //tambahkan setState dan panggil variabel _dateTime.
                                    setState(() {
                                      tanggal = date!;
                                    });
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var hasil = Budget(_judul!, _nominal!, _jenis!, tanggal);
                      BudgetList.list.add(hasil);
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 100,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Data Berhasil Dibuat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blue),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const BudgetForm()),
                                        );
                                      },
                                      child: const Text("OKE",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }));
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}