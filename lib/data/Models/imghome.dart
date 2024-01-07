class Imghomemodel {
  String? imgname;
  int? id;

  Imghomemodel({this.imgname, this.id});

  Imghomemodel.fromJson(Map<String, dynamic> json) {
    imgname = json['imgname'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgname'] = this.imgname;
    data['id'] = this.id;
    return data;
  }
}