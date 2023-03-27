class VendorModel {
  bool? success;
  List<Vendor>? vendors;
  int? count;

  VendorModel({this.success, this.vendors, this.count});

  VendorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['items'] != null) {
      vendors = <Vendor>[];
      json['items'].forEach((v) {
        vendors!.add(new Vendor.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.vendors != null) {
      data['items'] = this.vendors!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Vendor {
  String? id;
  String? account;
  String? slug;
  String? name;
  List<String>? images;
  String? description;
  String? phone;
  String? address;
  int? likeCount;
  bool? liked = false;
  String? language;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  Resources? resources;

  Vendor(
      {this.id,
      this.account,
      this.slug,
      this.name,
      this.images,
      this.liked,
      this.description,
      this.phone,
      this.address,
      this.likeCount,
      this.language,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.resources});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    slug = json['slug'];
    name = json['name'];
    images = json['images'] == null ? [] : json['images'].cast<String>();
    description = json['description'];
    phone = json['phone'];
    address = json['address'];
    likeCount = json['likeCount'];
    language = json['language'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    resources = json['resources'] != null ? new Resources.fromJson(json['resources']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account'] = this.account;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['images'] = this.images;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['likeCount'] = this.likeCount;
    data['language'] = this.language;
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
  CommentCount? commentCount;

  Resources({this.commentCount});

  Resources.fromJson(Map<String, dynamic> json) {
    commentCount = json['commentCount'] != null ? new CommentCount.fromJson(json['commentCount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commentCount != null) {
      data['commentCount'] = this.commentCount!.toJson();
    }
    return data;
  }
}

class CommentCount {
  int? totalCount;

  CommentCount({this.totalCount});

  CommentCount.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    return data;
  }
}
