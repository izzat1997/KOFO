import 'package:marvel/app/shop/models/vendor_model.dart';

class ReviewModel {
  bool? success;
  List<Review>? reviews;
  int? count;

  ReviewModel({this.success, this.reviews, this.count});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['items'] != null) {
      reviews = <Review>[];
      json['items'].forEach((v) {
        reviews!.add(new Review.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.reviews != null) {
      data['items'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Review {
  String? id;
  String? account;
  String? vendor;
  String? content;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  Resources? resources;

  Review(
      {this.id,
      this.account,
      this.vendor,
      this.content,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.resources});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    vendor = json['vendor'];
    content = json['content'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    resources = json['resources'] != null ? new Resources.fromJson(json['resources']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account'] = this.account;
    data['vendor'] = this.vendor;
    data['content'] = this.content;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.resources != null) {
      data['resources'] = this.resources!.toJson();
    }
    return data;
  }
}

class Resources {
  Account? account;
  Vendor? vendor;

  Resources({this.account, this.vendor});

  Resources.fromJson(Map<String, dynamic> json) {
    account = json['account'] != null ? new Account.fromJson(json['account']) : null;
    vendor = json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    return data;
  }
}

class Account {
  String? username;

  Account({this.username});

  Account.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}
