class CarModel {
  List<Categories>? categories;

  CarModel({this.categories});

  CarModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
  bool? isFavorited = false;

  Products(
      {this.name, this.detail, this.image, this.dateAdded, this.isFavorited});

  Products.fromJson(Map<String, dynamic> json) {
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
