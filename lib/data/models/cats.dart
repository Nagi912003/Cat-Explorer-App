class Cat{
  String? sId;
  List<String>? tags;
  String? owner;
  String? createdAt;
  String? updatedAt;

  Cat({this.sId, this.tags, this.owner, this.createdAt, this.updatedAt});

  Cat.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tags = json['tags'].cast<String>();
    owner = json['owner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['tags'] = tags;
    data['owner'] = owner;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}