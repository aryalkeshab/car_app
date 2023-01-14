class ProductListModel {
  String? name;
  String? detail;
  String? image;
  String? dateAdded;
  bool? isFavorited = false;

  ProductListModel(
      {this.name, this.detail, this.image, this.dateAdded, this.isFavorited});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    detail = json['detail'];
    image = json['image'];
    dateAdded = json['date-added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['detail'] = this.detail;
    data['image'] = this.image;
    data['date-added'] = this.dateAdded;
    return data;
  }
}
