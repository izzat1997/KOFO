class ProductModel {
  bool? success;
  List<Product>? products;
  int? count;

  ProductModel({this.success, this.products, this.count});

  ProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['items'] != null) {
      products = <Product>[];
      json['items'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.products != null) {
      data['items'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? vendor;
  String? price;
  String? slug;
  List<String>? images;
  String? description;
  String? commission;
  String? remainingQuantity;
  String? status;
  String? language;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.name,
      this.vendor,
      this.price,
      this.slug,
      this.images,
      this.description,
      this.commission,
      this.remainingQuantity,
      this.status,
      this.language,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vendor = json['vendor'];
    price = json['price'];
    slug = json['slug'];
    images = json['images'] == null ? [] : json['images'].cast<String>();
    description = json['description'];
    commission = json['commission'];
    remainingQuantity = json['remainingQuantity'];
    status = json['status'];
    language = json['language'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['vendor'] = this.vendor;
    data['price'] = this.price;
    data['slug'] = this.slug;
    data['images'] = this.images;
    data['description'] = this.description;
    data['commission'] = this.commission;
    data['remainingQuantity'] = this.remainingQuantity;
    data['status'] = this.status;
    data['language'] = this.language;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
