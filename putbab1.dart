class User {
  String namaPengguna;
  int usia;
  late List<Product> daftarProduk;
  Role? peran;

  User(this.namaPengguna, this.usia, this.peran) {
    daftarProduk = [];
  }
}

class Product {
  String namaBarang;
  double hargaBarang;
  bool tersedia;

  Product(this.namaBarang, this.hargaBarang, this.tersedia);
}

enum Role { Admin, Pelanggan }

class AdminUser extends User {
  AdminUser(String namaPengguna, int usia) : super(namaPengguna, usia, Role.Admin);

  void tambahBarang(Product barang) {
    if (barang.tersedia) {
      daftarProduk.add(barang);
      print("\n===== LAPORAN PENAMBAHAN BARANG =====");
      print('${barang.namaBarang} berhasil dimasukkan ke dalam daftar.');
    } else {
      print(
          '${barang.namaBarang} sedang tidak tersedia di stok dan tidak dapat ditambahkan.');
    }
  }

  void hapusBarang(Product barang) {
    daftarProduk.remove(barang);
    print("\n===== LAPORAN PENGHAPUSAN BARANG =====");
    print('${barang.namaBarang} berhasil dihapus dari daftar.');
  }
}

class CustomerUser extends User {
  CustomerUser(String namaPengguna, int usia) : super(namaPengguna, usia, Role.Pelanggan);

  void lihatBarang() {
    print('\nDaftar Barang yang Tersedia:');
    for (var barang in daftarProduk) {
      print('${barang.namaBarang} - Rp${barang.hargaBarang} - ${barang.tersedia ? "Tersedia" : "Kosong"}');
    }
  }
}

Future<void> ambilDetailBarang() async {
  print('Mengambil informasi barang...');
  await Future.delayed(Duration(seconds: 2));
  print('Informasi barang berhasil diperoleh.');
}

void main() {
  AdminUser admin = AdminUser('Siti', 30);
  CustomerUser pelanggan = CustomerUser('Budi', 25);

  Product barang1 = Product('Oppo A31', 2999000.0, true);
  Product barang2 = Product('Lenovo 7i', 12500000.0, false);
  Product barang3 = Product('Asus Vivobook', 8500000.0, true);

  try {
    admin.tambahBarang(barang1);
    admin.hapusBarang(barang2);
    admin.tambahBarang(barang3);
  } on Exception catch (e) {
    print('Terjadi kesalahan: $e');
  }

  pelanggan.lihatBarang();
  
  ambilDetailBarang();

  Map<String, Product> petaBarang = {
    barang1.namaBarang: barang1,
    barang2.namaBarang: barang2,
    barang3.namaBarang: barang3,
  };

  petaBarang.forEach((key, value) {
    print('${key} - Harga: Rp${value.hargaBarang} - Stok: ${value.tersedia ? "Tersedia" : "Kosong"}');
  });

  Set<Product> kumpulanBarang = {barang1, barang2, barang3};
  print('\nDaftar Barang dari Set:');
  kumpulanBarang.forEach((barang) {
    print('${barang.namaBarang} - Harga: Rp${barang.hargaBarang} - Stok: ${barang.tersedia ? "Tersedia" : "Kosong"}');
  });
}
