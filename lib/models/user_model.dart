class UserModel {
  // menconvert data hr_employee
  int id;
  String nama;
  String jabatan;
  String gambar;
  String token;

  UserModel({
    this.id,
    this.nama,
    this.jabatan,
    this.gambar,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['name'];
    jabatan = json['job_title'];
    gambar = json['image'];
    token = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': nama,
      'job_title':jabatan,
      'image':gambar,
      'refresh_token': token,
    };
  }
}
