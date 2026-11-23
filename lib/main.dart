import 'models/models.dart';

void main() {
  final nasigoreng = ProdukMakanan.restok('MKN001', 'Nasi Goreng', 15000, 10);
  final esTeh = ProdukMinuman.restok('MNM001', 'Es Teh', 5000, 20);

  final List<Produk> katalog = [
    nasigoreng,
    esTeh,
  ];

  katalog.fold(0.0, (s, p) => s + p.hitungPajak());

  final keranjang = Keranjang()
    ..tambah(nasigoreng, jumlah: 2)
    ..tambah(esTeh)
    ..tambah(esTeh);
  final transaksi = Kasir('Kasir 1').layani(keranjang);


  print(transaksi.items.length);
  print(transaksi.totalHarga);
  print(nasigoreng.kategori);
  print(esTeh.kategori);
  print(katalog.length);
}