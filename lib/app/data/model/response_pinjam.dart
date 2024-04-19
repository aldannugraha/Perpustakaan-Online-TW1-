import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_book.dart';

/// status : 200
/// message : "success"
/// data : [{"id":1,"user_id":2,"book_id":1,"tanggal_pinjam":"2024-01-01 00:00:00","tanggal_kembali":"2024-01-10 00:00:00","status":"DIPINJAM","created_at":"2024-01-09T06:09:06.000000Z","updated_at":"2024-01-09T06:09:06.000000Z","user":{"id":2,"username":"said","nama":"said","telp":"085","alamat":"alamat","role":"PEMINJAM","created_at":"2024-01-09T05:36:44.000000Z","updated_at":"2024-01-09T05:36:44.000000Z"},"book":{"id":1,"kategori_id":1,"judul":"Belajar mengenal angka","penulis":"kusnaidi","penerbit":"PT alangka","tahun_terbit":2024,"created_at":"2024-01-09T05:43:09.000000Z","updated_at":"2024-01-09T05:43:09.000000Z"}}]

class ResponsePinjam {
  ResponsePinjam({
    this.status,
    this.message,
    this.data,});

  ResponsePinjam.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPinjam.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataPinjam>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// user_id : 2
/// book_id : 1
/// tanggal_pinjam : "2024-01-01 00:00:00"
/// tanggal_kembali : "2024-01-10 00:00:00"
/// status : "DIPINJAM"
/// created_at : "2024-01-09T06:09:06.000000Z"
/// updated_at : "2024-01-09T06:09:06.000000Z"
/// user : {"id":2,"username":"said","nama":"said","telp":"085","alamat":"alamat","role":"PEMINJAM","created_at":"2024-01-09T05:36:44.000000Z","updated_at":"2024-01-09T05:36:44.000000Z"}
/// book : {"id":1,"kategori_id":1,"judul":"Belajar mengenal angka","penulis":"kusnaidi","penerbit":"PT alangka","tahun_terbit":2024,"created_at":"2024-01-09T05:43:09.000000Z","updated_at":"2024-01-09T05:43:09.000000Z"}

class DataPinjam {
  DataPinjam({
    this.id,
    this.userId,
    this.bookId,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.book,});

  DataPinjam.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }
  int? id;
  int? userId;
  int? bookId;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  Book? book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (book != null) {
      map['book'] = book?.toJson();
    }
    return map;
  }

}

/// id : 1
/// kategori_id : 1
/// judul : "Belajar mengenal angka"
/// penulis : "kusnaidi"
/// penerbit : "PT alangka"
/// tahun_terbit : 2024
/// created_at : "2024-01-09T05:43:09.000000Z"
/// updated_at : "2024-01-09T05:43:09.000000Z"

class Book {
  Book({
    this.id,
    this.kategoriId,
    this.judul,
    this.penulis,
    this.penerbit,
    this.gambar,
    this.tahunTerbit,
    this.createdAt,
    this.updatedAt,
    this.kategori,
  });

  int? id;
  int? kategoriId; // Ubah tipe data dari String? menjadi int?
  String? judul;
  String? penulis;
  String? penerbit;
  String? gambar;
  int? tahunTerbit; // Ubah tipe data dari String? menjadi int?
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      kategoriId: json['kategori_id'],
      judul: json['judul'],
      penulis: json['penulis'],
      penerbit: json['penerbit'],
      gambar: json['gambar'],
      tahunTerbit: json['tahun_terbit'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      kategori: json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kategori_id'] = this.kategoriId;
    data['judul'] = this.judul;
    data['penulis'] = this.penulis;
    data['penerbit'] = this.penerbit;
    data['gambar'] = this.gambar;
    data['tahun_terbit'] = this.tahunTerbit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.kategori != null) {
      data['kategori'] = this.kategori!.toJson();
    }
    return data;
  }
}


/// id : 2
/// username : "said"
/// nama : "said"
/// telp : "085"
/// alamat : "alamat"
/// role : "PEMINJAM"
/// created_at : "2024-01-09T05:36:44.000000Z"
/// updated_at : "2024-01-09T05:36:44.000000Z"

class User {
  User({
    this.id,
    this.username,
    this.nama,
    this.telp,
    this.alamat,
    this.role,
    this.createdAt,
    this.updatedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    nama = json['nama'];
    telp = json['telp'];
    alamat = json['alamat'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? username;
  String? nama;
  String? telp;
  String? alamat;
  String? role;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['nama'] = nama;
    map['telp'] = telp;
    map['alamat'] = alamat;
    map['role'] = role;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}