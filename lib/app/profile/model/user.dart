class User {
  String? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  int? eWalletBalance;
  String? status;
  List<String>? ownedbys;
  List<String>? roles;
  List<String>? allowPermissionSet;
  List<String>? denyPermissionSet;
  List<String>? allowPermission;
  List<String>? denyPermission;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.eWalletBalance,
      this.status,
      this.ownedbys,
      this.roles,
      this.allowPermissionSet,
      this.denyPermissionSet,
      this.allowPermission,
      this.denyPermission,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    eWalletBalance = json['eWalletBalance'];
    status = json['status'];
    ownedbys = json['ownedbys'].cast<String>();
    roles = json['roles'].cast<String>();
    allowPermissionSet = json['allowPermissionSet'].cast<String>();
    denyPermissionSet = json['denyPermissionSet'].cast<String>();
    allowPermission = json['allowPermission'].cast<String>();
    denyPermission = json['denyPermission'].cast<String>();
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['eWalletBalance'] = this.eWalletBalance;
    data['status'] = this.status;
    data['ownedbys'] = this.ownedbys;
    data['roles'] = this.roles;
    data['allowPermissionSet'] = this.allowPermissionSet;
    data['denyPermissionSet'] = this.denyPermissionSet;
    data['allowPermission'] = this.allowPermission;
    data['denyPermission'] = this.denyPermission;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
