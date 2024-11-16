enum StatusAnggotaTim { aktif, cuti, keluar }

mixin KehadiranKerja {
  void hadir() => print("Anggota tim hadir di kantor.");
}

abstract class PenggunaPerusahaan {
  void tampilkanIdentitas();
}

class AnggotaTim extends PenggunaPerusahaan with KehadiranKerja {
  String nama;
  String idPegawai;
  String divisi;
  StatusAnggotaTim status;

  AnggotaTim(this.nama, this.idPegawai,
      {required this.divisi, this.status = StatusAnggotaTim.aktif});

  void bekerja() => print("$nama sedang bekerja.");

  @override
  void tampilkanIdentitas() {
    print("Nama: $nama, ID Pegawai: $idPegawai, Divisi: $divisi");
  }

  // Getter dan Setter untuk ID Pegawai
  String get getIdPegawai => idPegawai;
  set setIdPegawai(String idPegawaiBaru) {
    idPegawai = idPegawaiBaru;
  }
}

class ManajerProyek extends AnggotaTim {
  String proyek;

  ManajerProyek(String nama, String idPegawai, this.proyek,
      {required String divisi})
      : super(nama, idPegawai, divisi: divisi);

  void kelolaProyek() => print("$nama mengelola proyek $proyek.");
}

void main() {
  AnggotaTim anggotaTim = AnggotaTim("puput purnamasari", "AT1001",
      divisi: "Teknologi Informasi");
  anggotaTim.tampilkanIdentitas();
  anggotaTim.bekerja();
  anggotaTim.hadir();

  ManajerProyek manajerProyek = ManajerProyek(
      "destitha bachmid", "AT1002", "Pengembangan Aplikasi",
      divisi: "Teknologi Informasi");
  manajerProyek.tampilkanIdentitas();
  manajerProyek.kelolaProyek();
}