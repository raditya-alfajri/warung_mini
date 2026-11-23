abstract class Produk {
  final String kode;
  String nama;
  String kategori;
  double _harga;
  int _stok;
  bool tersedia;
  double hitungPajak();

  // Constructor utama. "tersedia" dihitung otomatis dari stok
  // lewat initializer list (bagian setelah tanda ':'), bukan didalam body.
  Produk(this.kode, this.nama, this.kategori, this._harga, this._stok)
      : tersedia = _stok > 0;

  // bool get stokMenipis => stok > 0 && stok < 5;

  // Named constructor 1: untuk produk baru yang stoknya belum diisi (stok = 0).
  Produk.baru(String kode,
      String nama,
      String kategori,
      double harga) : this(kode, nama, kategori, harga, 0);

  double get harga => _harga;

  set harga(double nilai) {
    if (nilai < 0) throw ArgumentError("Harga tidak boleh nergatif");
    _harga = nilai;
  }

  int get stok => _stok;


  // Named constructor 2: untuk produk yang langsung didaftarkan dengan stok awal.
  Produk.restok(String kode,
      String nama,
      String kategori,
      double harga,
      int stokAwal,) : this(kode, nama, kategori, harga, stokAwal);

  // Named constructor 3: untuk produk yang sudah habis
  Produk.habis(String kode, String nama, String kategori, double harga)
      : this(kode, nama, kategori, harga, 0);

  String tampilkaninfo(String prefix) {
    return '$prefix$nama - Rp${harga.toStringAsFixed(0)}';
  }

  void tambahstok(int jumlah, [String? catatan]) {
  _stok += jumlah;
  tersedia = _stok > 0;
  if (catatan != null) {
    // ignore: avoid_print
    print('catatan Restok: $catatan');
  }
  }

  void aturDiskon({required double persen, String? alasan}) {
    final potongan = harga * persen / 100;
    harga -= potongan;
    // ignore: avoid_print
    print('Diskon $persen% diterapkan${alasan != null?'($alasan)':''}');
  }

  String cetakStruk({bool includeDiskon = false}) {
      final buffer = StringBuffer()
      ..writeln('$nama ($kategori)')
      ..writeln('Harga: Rp${harga.toStringAsFixed(0)}')
      ..writeln('Stok tersisa: $stok');
      return buffer.toString();
    }
}

