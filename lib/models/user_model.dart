class User {
  int id;
  String name;
  String email;
  String mobile;
  Null emailVerifiedAt;
  Null twoFactorSecret;
  Null twoFactorRecoveryCodes;
  String buyerName;
  int isGreyManager;
  int isAdmin;
  int isAuctionManager;
  int isBuyer;
  int isSeller;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.emailVerifiedAt,
      this.twoFactorSecret,
      this.twoFactorRecoveryCodes,
      this.buyerName,
      this.isGreyManager,
      this.isAdmin,
      this.isAuctionManager,
      this.isBuyer,
      this.isSeller,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorSecret = json['two_factor_secret'];
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    buyerName = json['buyer_name'];
    isGreyManager = json['isGreyManager'];
    isAdmin = json['isAdmin'];
    isAuctionManager = json['isAuctionManager'];
    isBuyer = json['isBuyer'];
    isSeller = json['isSeller'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_secret'] = this.twoFactorSecret;
    data['two_factor_recovery_codes'] = this.twoFactorRecoveryCodes;
    data['buyer_name'] = this.buyerName;
    data['isGreyManager'] = this.isGreyManager;
    data['isAdmin'] = this.isAdmin;
    data['isAuctionManager'] = this.isAuctionManager;
    data['isBuyer'] = this.isBuyer;
    data['isSeller'] = this.isSeller;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}