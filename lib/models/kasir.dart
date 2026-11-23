import 'keranjang.dart';

import 'transaksi.dart';

class Kasir {
  final String nama;
    Kasir(this.nama);

    Transaksi layani(Keranjang keranjang) => keranjang.checkout();
}