class Budget {
  late String judul ;
  late int nominal ;
  late String jenis;
  late DateTime tanggal;

  Budget(this.judul, this.nominal, this.jenis, this.tanggal);
}

class BudgetList {
  static List<Budget> list = [];
}