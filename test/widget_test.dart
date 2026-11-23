import 'package:flutter_test/flutter_test.dart';
import 'package:warung/models/produk_makanan.dart';
import 'package:warung/models/produk_minuman.dart';
import 'package:warung/models/keranjang.dart';
import 'package:warung/models/kasir.dart';

void main() {
  test('Warung transaction test', () {
    final nasiGoreng = ProdukMakanan.restok('MKN001', 'Nasi Goreng', 15000, 10);
    final esTeh = ProdukMinuman.restok('MNM001', 'Es Teh', 5000, 20);

    final keranjang = Keranjang()
      ..tambah(nasiGoreng, jumlah: 2)
      ..tambah(esTeh);

    final transaksi = Kasir('Kasir 1').layani(keranjang);

    expect(transaksi.items.length, 2);
    expect(transaksi.totalHarga, 35000);
  });
}
