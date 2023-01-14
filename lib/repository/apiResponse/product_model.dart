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
    detail = json['price'];
    image = json['image'];
    dateAdded = json['released_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.detail;
    data['image'] = this.image;
    data['released_date'] = this.dateAdded;
    return data;
  }
}
