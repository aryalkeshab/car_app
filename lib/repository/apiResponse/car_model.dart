class Categories {
  String? title;
  String? subtitle;
  List<Products>? products;

  Categories({this.title, this.subtitle, this.products});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? name;
  String? detail;
  String? image;
  String? dateAdded;
  String? price;
  bool? isFavorited = false;

  Products(
      {this.name,
      this.detail,
      this.image,
      this.dateAdded,
      this.isFavorited,
      this.price});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    detail = json['description'];
    price = json['price'];
    image = json['image'];
    dateAdded = json['released_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.detail;
    data['image'] = this.image;
    data['released_date'] = this.dateAdded;
    return data;
  }
}
