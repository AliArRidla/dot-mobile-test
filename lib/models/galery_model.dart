class GaleryModel {
  // "caption": "Zona Infinite World di Jatim Park 3",
  //           "thumbnail": "https://images2.imgbox.com/52/1b/PMfvPUxo_o.jpg",
  //           "image": "https://images2.imgbox.com/0a/e7/G421oy0Q_o.jpg"

  String caption;
  String thumbnail;
  String image;

  GaleryModel({
    this.caption,
    this.thumbnail,
    this.image,
  });

  GaleryModel.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    thumbnail = json['thumbnail'];
    image = json['image'];
  }

  Map<String,dynamic> toJson(){
    return {
      'caption': caption,
      'thumbnail': thumbnail,
      'image': image,
    };
  }
}
