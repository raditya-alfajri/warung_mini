import 'produk.dart';

class ProdukBiasa extends Produk {
  ProdukBiasa(super.kode, super.nama, super.kategori, super.harga, super.stok);
  ProdukBiasa.baru(super.kode, super.nama, super.kategori, super.harga)
    : super.baru();
  ProdukBiasa.restok(super.kode, super.nama, super.kategori, super.harga, super.stokAwal)
    : super.restok();


  @override
  double hitungPajak() => harga * 0.01;


}

