import 'dart:convert';

void main() {
  // JSON transkrip mahasiswa
  String transkripJson = '''
  {
  "nama": "Fachturozi",
  "NIM": "22082010021",
  "jurusan": "Sistem Informasi",
  "mata_kuliah": [
    {
      "kode": "SI101",
      "nama": "Pemrograman Dasar",
      "sks": 3,
      "nilai": "B+"
    },
    {
      "kode": "SI102",
      "nama": "Logika Algoritma",
      "sks": 3,
      "nilai": "A"
    },
    {
      "kode": "SI103",
      "nama": "Sistem Basis Data",
      "sks": 3,
      "nilai": "A-"
    },
    {
      "kode": "SI104",
      "nama": "Pemrograman Web",
      "sks": 3,
      "nilai": "B+"
    }
  ]
}
''';
 // Parsing JSON
  Map<String, dynamic> transkrip = jsonDecode(transkripJson);

  // Menghitung total SKS dan total nilai
  int totalSks = 0;
  double totalNilai = 0.0;

  for (var matkul in transkrip['mata_kuliah']) {
    totalSks += int.parse(matkul['sks'].toString());

    switch (matkul['nilai']) {
      case 'A':
        totalNilai += 4.0 * matkul['sks'];
        break;
      case 'A-':
        totalNilai += 3.7 * matkul['sks'];
        break;
      case 'B+':
        totalNilai += 3.3 * matkul['sks'];
        break;
      // tambahkan case lain sesuai kebutuhan
    }
  }

  // Menghitung IPK
  double ipk = totalNilai / totalSks;

  print('Nama: ${transkrip['nama']}');
  print('NIM: ${transkrip['NIM']}');
  print('Jurusan: ${transkrip['jurusan']}');
  print('Total SKS: $totalSks');
  print('IPK: ${ipk.toStringAsFixed(2)}');
}