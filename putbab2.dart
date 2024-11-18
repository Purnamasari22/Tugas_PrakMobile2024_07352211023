// Kelas ProdukDigital
class ProdukDigital {
  String namaItem;
  double biaya;
  String jenis;

  ProdukDigital(this.namaItem, this.biaya, this.jenis);

  void terapkanDiskon(double persentaseDiskon) {
    if (jenis == 'NetworkAutomation') {
      biaya -= biaya * (persentaseDiskon / 100);
    }
  }
}

// Kelas Abstrak Karyawan
abstract class Karyawan {
  String namaPegawai;
  int usia;

  Karyawan(this.namaPegawai, this.usia);

  void lakukanPekerjaan(); // Metode abstrak
}

// Subclass KaryawanTetap
class KaryawanTetap extends Karyawan {
  KaryawanTetap(String namaPegawai, int usia) : super(namaPegawai, usia);

  @override
  void lakukanPekerjaan() {
    print('$namaPegawai (Pegawai Tetap) sedang menjalankan tugasnya.');
  }
}

// Subclass KaryawanKontrak
class KaryawanKontrak extends Karyawan {
  KaryawanKontrak(String namaPegawai, int usia) : super(namaPegawai, usia);

  @override
  void lakukanPekerjaan() {
    print('$namaPegawai (Pegawai Kontrak) sedang menjalankan tugasnya.');
  }
}

// Mixin Kinerja untuk Produktivitas
mixin Kinerja {
  int tingkatProduktivitas = 0;

  void naikkanProduktivitas() {
    tingkatProduktivitas += 10;
  }

  bool apakahProduktif() {
    return tingkatProduktivitas > 85;
  }
}

// Menggunakan mixin pada kelas Manager
class Manager extends Karyawan with Kinerja {
  Manager(String namaPegawai, int usia) : super(namaPegawai, usia);

  @override
  void lakukanPekerjaan() {
    print(
        '$namaPegawai (Manager) sedang bekerja dengan tingkat produktivitas $tingkatProduktivitas.');
  }
}

// Enum FaseProyek untuk Konsistensi Proyek
enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

class Proyek {
  FaseProyek faseSekarang = FaseProyek.Perencanaan;

  void pindahKeFase(FaseProyek faseBaru) {
    if (faseBaru.index == faseSekarang.index + 1) {
      faseSekarang = faseBaru;
      print('Berhasil beralih ke fase $faseBaru.');
    } else {
      print('Transisi ke fase ini tidak diperbolehkan.');
    }
  }
}

// Kelas Perusahaan untuk Pembatasan Jumlah Karyawan Aktif
class Perusahaan {
  List<Karyawan> pegawaiAktif = [];
  List<Karyawan> pegawaiNonAktif = [];
  final int kapasitasMaksimal = 20;

  void rekrutPegawai(Karyawan pegawai) {
    if (pegawaiAktif.length < kapasitasMaksimal) {
      pegawaiAktif.add(pegawai);
      print('Pegawai ${pegawai.namaPegawai} berhasil direkrut.');
    } else {
      print('Kapasitas maksimal pegawai aktif telah terpenuhi.');
    }
  }

  void keluarkanPegawai(Karyawan pegawai) {
    pegawaiAktif.remove(pegawai);
    pegawaiNonAktif.add(pegawai);
    print(
        'Pegawai ${pegawai.namaPegawai} telah keluar dan dipindahkan ke daftar pegawai non-aktif.');
  }
}

// Contoh penggunaan
void main() {
  // ProdukDigital
  var produk = ProdukDigital('Automasi Jaringan', 5000000, 'NetworkAutomation');
  produk.terapkanDiskon(10);
  print('Biaya setelah diskon: ${produk.biaya}');

  // Karyawan dan Manager
  var karyawanTetap = KaryawanTetap('Puput', 30);
  karyawanTetap.lakukanPekerjaan();

  var karyawanKontrak = KaryawanKontrak('Haydar', 25);
  karyawanKontrak.lakukanPekerjaan();

  var manager = Manager('Luki', 40);
  manager.lakukanPekerjaan();
  manager.naikkanProduktivitas();
  print('Tingkat produktivitas Manager: ${manager.tingkatProduktivitas}');

  // FaseProyek
  var proyek = Proyek();
  proyek.pindahKeFase(FaseProyek.Pengembangan);
  proyek.pindahKeFase(FaseProyek.Evaluasi);

  // Perusahaan
  var perusahaan = Perusahaan();
  perusahaan.rekrutPegawai(karyawanTetap);
  perusahaan.rekrutPegawai(karyawanKontrak);
  perusahaan.rekrutPegawai(manager);
  perusahaan.keluarkanPegawai(karyawanTetap);
}
