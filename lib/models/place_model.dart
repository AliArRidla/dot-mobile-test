class PlaceModel {
  //  {
  //     "id": 1,
  //     "title": "Title Image 1",
  //     "content": "Lorem Ipsum Dolor Amit",
  //     "type": "image",
  //     "image": "https://i.imgur.com/BnW0w2T.jpg",
  //     "media": []
  // },
  // {
  //     "id": 2,
  //     "title": "Title Multiple Image 1",
  //     "content": "Lorem Ipsum Dolor Amit",
  //     "type": "multiple",
  //     "image": null,
  //     "media": [
  //         "https://i.imgur.com/xulMos6.jpg",
  //         "https://i.imgur.com/ZEP2qhd.jpg",
  //         "https://i.imgur.com/XmTOqh6.jpg"
  //     ]
  // },
  int id;
  String title;
  String content;
  String type;
  String image;
  List<String> media;

  PlaceModel({
    this.id,
    this.title,
    this.content,
    this.type,
    this.image,
    this.media,
  });

  PlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    type = json['type'];
    image = json['image'];
    media = json['media'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'type': type,
      'image': image,
      'media': media,
    };
  }

}
