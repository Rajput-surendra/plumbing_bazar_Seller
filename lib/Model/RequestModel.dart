import 'dart:convert';
RequestModel requestModelFromJson(String str) => RequestModel.fromJson(json.decode(str));
String requestModelToJson(RequestModel data) => json.encode(data.toJson());
class RequestModel {
  RequestModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  RequestModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data>? _data;
RequestModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => RequestModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? userId, 
      String? productVariantId, 
      String? qty, 
      String? finalPrice, 
      String? sellerId, 
      String? reqId, 
      String? date, 
      String? ipAddress, 
      String? username, 
      String? password, 
      String? email, 
      String? mobile, 
      dynamic image, 
      String? gender, 
      String? balance, 
      dynamic activationSelector, 
      dynamic activationCode, 
      dynamic forgottenPasswordSelector, 
      dynamic forgottenPasswordCode, 
      dynamic forgottenPasswordTime, 
      dynamic rememberSelector, 
      dynamic rememberCode, 
      String? createdOn, 
      String? lastLogin, 
      String? active, 
      String? company, 
      dynamic address, 
      dynamic bonus, 
      String? cashReceived, 
      String? dob, 
      String? countryCode, 
      String? city, 
      String? area, 
      dynamic street, 
      String? license, 
      String? vehicle, 
      dynamic pincode, 
      dynamic serviceableZipcodes, 
      dynamic apikey, 
      String? referralCode, 
      dynamic friendsCode, 
      String? fcmId, 
      String? latitude, 
      String? longitude, 
      String? openCloseStatus, 
      String? createdAt, 
      String? gstFile, 
      String? foodLic, 
      String? accountName, 
      String? proPic, 
      String? accountNumber, 
      String? bankCode, 
      String? bankName, 
      String? bankPass, 
      String? firstOrder, 
      String? refferEarnStatus, 
      String? gstNo, 
      String? proprietorName, 
      String? otp,}){
    _id = id;
    _userId = userId;
    _productVariantId = productVariantId;
    _qty = qty;
    _finalPrice = finalPrice;
    _sellerId = sellerId;
    _reqId = reqId;
    _date = date;
    _ipAddress = ipAddress;
    _username = username;
    _password = password;
    _email = email;
    _mobile = mobile;
    _image = image;
    _gender = gender;
    _balance = balance;
    _activationSelector = activationSelector;
    _activationCode = activationCode;
    _forgottenPasswordSelector = forgottenPasswordSelector;
    _forgottenPasswordCode = forgottenPasswordCode;
    _forgottenPasswordTime = forgottenPasswordTime;
    _rememberSelector = rememberSelector;
    _rememberCode = rememberCode;
    _createdOn = createdOn;
    _lastLogin = lastLogin;
    _active = active;
    _company = company;
    _address = address;
    _bonus = bonus;
    _cashReceived = cashReceived;
    _dob = dob;
    _countryCode = countryCode;
    _city = city;
    _area = area;
    _street = street;
    _license = license;
    _vehicle = vehicle;
    _pincode = pincode;
    _serviceableZipcodes = serviceableZipcodes;
    _apikey = apikey;
    _referralCode = referralCode;
    _friendsCode = friendsCode;
    _fcmId = fcmId;
    _latitude = latitude;
    _longitude = longitude;
    _openCloseStatus = openCloseStatus;
    _createdAt = createdAt;
    _gstFile = gstFile;
    _foodLic = foodLic;
    _accountName = accountName;
    _proPic = proPic;
    _accountNumber = accountNumber;
    _bankCode = bankCode;
    _bankName = bankName;
    _bankPass = bankPass;
    _firstOrder = firstOrder;
    _refferEarnStatus = refferEarnStatus;
    _gstNo = gstNo;
    _proprietorName = proprietorName;
    _otp = otp;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productVariantId = json['product_variant_id'];
    _qty = json['qty'];
    _finalPrice = json['final_price'];
    _sellerId = json['seller_id'];
    _reqId = json['req_id'];
    _date = json['date'];
    _ipAddress = json['ip_address'];
    _username = json['username'];
    _password = json['password'];
    _email = json['email'];
    _mobile = json['mobile'];
    _image = json['image'];
    _gender = json['gender'];
    _balance = json['balance'];
    _activationSelector = json['activation_selector'];
    _activationCode = json['activation_code'];
    _forgottenPasswordSelector = json['forgotten_password_selector'];
    _forgottenPasswordCode = json['forgotten_password_code'];
    _forgottenPasswordTime = json['forgotten_password_time'];
    _rememberSelector = json['remember_selector'];
    _rememberCode = json['remember_code'];
    _createdOn = json['created_on'];
    _lastLogin = json['last_login'];
    _active = json['active'];
    _company = json['company'];
    _address = json['address'];
    _bonus = json['bonus'];
    _cashReceived = json['cash_received'];
    _dob = json['dob'];
    _countryCode = json['country_code'];
    _city = json['city'];
    _area = json['area'];
    _street = json['street'];
    _license = json['license'];
    _vehicle = json['vehicle'];
    _pincode = json['pincode'];
    _serviceableZipcodes = json['serviceable_zipcodes'];
    _apikey = json['apikey'];
    _referralCode = json['referral_code'];
    _friendsCode = json['friends_code'];
    _fcmId = json['fcm_id'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _openCloseStatus = json['open_close_status'];
    _createdAt = json['created_at'];
    _gstFile = json['gst_file'];
    _foodLic = json['food_lic'];
    _accountName = json['account_name'];
    _proPic = json['pro_pic'];
    _accountNumber = json['account_number'];
    _bankCode = json['bank_code'];
    _bankName = json['bank_name'];
    _bankPass = json['bank_pass'];
    _firstOrder = json['first_order'];
    _refferEarnStatus = json['reffer_earn_status'];
    _gstNo = json['gst_no'];
    _proprietorName = json['proprietor_name'];
    _otp = json['otp'];
  }
  String? _id;
  String? _userId;
  String? _productVariantId;
  String? _qty;
  String? _finalPrice;
  String? _sellerId;
  String? _reqId;
  String? _date;
  String? _ipAddress;
  String? _username;
  String? _password;
  String? _email;
  String? _mobile;
  dynamic _image;
  String? _gender;
  String? _balance;
  dynamic _activationSelector;
  dynamic _activationCode;
  dynamic _forgottenPasswordSelector;
  dynamic _forgottenPasswordCode;
  dynamic _forgottenPasswordTime;
  dynamic _rememberSelector;
  dynamic _rememberCode;
  String? _createdOn;
  String? _lastLogin;
  String? _active;
  String? _company;
  dynamic _address;
  dynamic _bonus;
  String? _cashReceived;
  String? _dob;
  String? _countryCode;
  String? _city;
  String? _area;
  dynamic _street;
  String? _license;
  String? _vehicle;
  dynamic _pincode;
  dynamic _serviceableZipcodes;
  dynamic _apikey;
  String? _referralCode;
  dynamic _friendsCode;
  String? _fcmId;
  String? _latitude;
  String? _longitude;
  String? _openCloseStatus;
  String? _createdAt;
  String? _gstFile;
  String? _foodLic;
  String? _accountName;
  String? _proPic;
  String? _accountNumber;
  String? _bankCode;
  String? _bankName;
  String? _bankPass;
  String? _firstOrder;
  String? _refferEarnStatus;
  String? _gstNo;
  String? _proprietorName;
  String? _otp;
Data copyWith({  String? id,
  String? userId,
  String? productVariantId,
  String? qty,
  String? finalPrice,
  String? sellerId,
  String? reqId,
  String? date,
  String? ipAddress,
  String? username,
  String? password,
  String? email,
  String? mobile,
  dynamic image,
  String? gender,
  String? balance,
  dynamic activationSelector,
  dynamic activationCode,
  dynamic forgottenPasswordSelector,
  dynamic forgottenPasswordCode,
  dynamic forgottenPasswordTime,
  dynamic rememberSelector,
  dynamic rememberCode,
  String? createdOn,
  String? lastLogin,
  String? active,
  String? company,
  dynamic address,
  dynamic bonus,
  String? cashReceived,
  String? dob,
  String? countryCode,
  String? city,
  String? area,
  dynamic street,
  String? license,
  String? vehicle,
  dynamic pincode,
  dynamic serviceableZipcodes,
  dynamic apikey,
  String? referralCode,
  dynamic friendsCode,
  String? fcmId,
  String? latitude,
  String? longitude,
  String? openCloseStatus,
  String? createdAt,
  String? gstFile,
  String? foodLic,
  String? accountName,
  String? proPic,
  String? accountNumber,
  String? bankCode,
  String? bankName,
  String? bankPass,
  String? firstOrder,
  String? refferEarnStatus,
  String? gstNo,
  String? proprietorName,
  String? otp,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  productVariantId: productVariantId ?? _productVariantId,
  qty: qty ?? _qty,
  finalPrice: finalPrice ?? _finalPrice,
  sellerId: sellerId ?? _sellerId,
  reqId: reqId ?? _reqId,
  date: date ?? _date,
  ipAddress: ipAddress ?? _ipAddress,
  username: username ?? _username,
  password: password ?? _password,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  image: image ?? _image,
  gender: gender ?? _gender,
  balance: balance ?? _balance,
  activationSelector: activationSelector ?? _activationSelector,
  activationCode: activationCode ?? _activationCode,
  forgottenPasswordSelector: forgottenPasswordSelector ?? _forgottenPasswordSelector,
  forgottenPasswordCode: forgottenPasswordCode ?? _forgottenPasswordCode,
  forgottenPasswordTime: forgottenPasswordTime ?? _forgottenPasswordTime,
  rememberSelector: rememberSelector ?? _rememberSelector,
  rememberCode: rememberCode ?? _rememberCode,
  createdOn: createdOn ?? _createdOn,
  lastLogin: lastLogin ?? _lastLogin,
  active: active ?? _active,
  company: company ?? _company,
  address: address ?? _address,
  bonus: bonus ?? _bonus,
  cashReceived: cashReceived ?? _cashReceived,
  dob: dob ?? _dob,
  countryCode: countryCode ?? _countryCode,
  city: city ?? _city,
  area: area ?? _area,
  street: street ?? _street,
  license: license ?? _license,
  vehicle: vehicle ?? _vehicle,
  pincode: pincode ?? _pincode,
  serviceableZipcodes: serviceableZipcodes ?? _serviceableZipcodes,
  apikey: apikey ?? _apikey,
  referralCode: referralCode ?? _referralCode,
  friendsCode: friendsCode ?? _friendsCode,
  fcmId: fcmId ?? _fcmId,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  openCloseStatus: openCloseStatus ?? _openCloseStatus,
  createdAt: createdAt ?? _createdAt,
  gstFile: gstFile ?? _gstFile,
  foodLic: foodLic ?? _foodLic,
  accountName: accountName ?? _accountName,
  proPic: proPic ?? _proPic,
  accountNumber: accountNumber ?? _accountNumber,
  bankCode: bankCode ?? _bankCode,
  bankName: bankName ?? _bankName,
  bankPass: bankPass ?? _bankPass,
  firstOrder: firstOrder ?? _firstOrder,
  refferEarnStatus: refferEarnStatus ?? _refferEarnStatus,
  gstNo: gstNo ?? _gstNo,
  proprietorName: proprietorName ?? _proprietorName,
  otp: otp ?? _otp,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get productVariantId => _productVariantId;
  String? get qty => _qty;
  String? get finalPrice => _finalPrice;
  String? get sellerId => _sellerId;
  String? get reqId => _reqId;
  String? get date => _date;
  String? get ipAddress => _ipAddress;
  String? get username => _username;
  String? get password => _password;
  String? get email => _email;
  String? get mobile => _mobile;
  dynamic get image => _image;
  String? get gender => _gender;
  String? get balance => _balance;
  dynamic get activationSelector => _activationSelector;
  dynamic get activationCode => _activationCode;
  dynamic get forgottenPasswordSelector => _forgottenPasswordSelector;
  dynamic get forgottenPasswordCode => _forgottenPasswordCode;
  dynamic get forgottenPasswordTime => _forgottenPasswordTime;
  dynamic get rememberSelector => _rememberSelector;
  dynamic get rememberCode => _rememberCode;
  String? get createdOn => _createdOn;
  String? get lastLogin => _lastLogin;
  String? get active => _active;
  String? get company => _company;
  dynamic get address => _address;
  dynamic get bonus => _bonus;
  String? get cashReceived => _cashReceived;
  String? get dob => _dob;
  String? get countryCode => _countryCode;
  String? get city => _city;
  String? get area => _area;
  dynamic get street => _street;
  String? get license => _license;
  String? get vehicle => _vehicle;
  dynamic get pincode => _pincode;
  dynamic get serviceableZipcodes => _serviceableZipcodes;
  dynamic get apikey => _apikey;
  String? get referralCode => _referralCode;
  dynamic get friendsCode => _friendsCode;
  String? get fcmId => _fcmId;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get openCloseStatus => _openCloseStatus;
  String? get createdAt => _createdAt;
  String? get gstFile => _gstFile;
  String? get foodLic => _foodLic;
  String? get accountName => _accountName;
  String? get proPic => _proPic;
  String? get accountNumber => _accountNumber;
  String? get bankCode => _bankCode;
  String? get bankName => _bankName;
  String? get bankPass => _bankPass;
  String? get firstOrder => _firstOrder;
  String? get refferEarnStatus => _refferEarnStatus;
  String? get gstNo => _gstNo;
  String? get proprietorName => _proprietorName;
  String? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_variant_id'] = _productVariantId;
    map['qty'] = _qty;
    map['final_price'] = _finalPrice;
    map['seller_id'] = _sellerId;
    map['req_id'] = _reqId;
    map['date'] = _date;
    map['ip_address'] = _ipAddress;
    map['username'] = _username;
    map['password'] = _password;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['image'] = _image;
    map['gender'] = _gender;
    map['balance'] = _balance;
    map['activation_selector'] = _activationSelector;
    map['activation_code'] = _activationCode;
    map['forgotten_password_selector'] = _forgottenPasswordSelector;
    map['forgotten_password_code'] = _forgottenPasswordCode;
    map['forgotten_password_time'] = _forgottenPasswordTime;
    map['remember_selector'] = _rememberSelector;
    map['remember_code'] = _rememberCode;
    map['created_on'] = _createdOn;
    map['last_login'] = _lastLogin;
    map['active'] = _active;
    map['company'] = _company;
    map['address'] = _address;
    map['bonus'] = _bonus;
    map['cash_received'] = _cashReceived;
    map['dob'] = _dob;
    map['country_code'] = _countryCode;
    map['city'] = _city;
    map['area'] = _area;
    map['street'] = _street;
    map['license'] = _license;
    map['vehicle'] = _vehicle;
    map['pincode'] = _pincode;
    map['serviceable_zipcodes'] = _serviceableZipcodes;
    map['apikey'] = _apikey;
    map['referral_code'] = _referralCode;
    map['friends_code'] = _friendsCode;
    map['fcm_id'] = _fcmId;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['open_close_status'] = _openCloseStatus;
    map['created_at'] = _createdAt;
    map['gst_file'] = _gstFile;
    map['food_lic'] = _foodLic;
    map['account_name'] = _accountName;
    map['pro_pic'] = _proPic;
    map['account_number'] = _accountNumber;
    map['bank_code'] = _bankCode;
    map['bank_name'] = _bankName;
    map['bank_pass'] = _bankPass;
    map['first_order'] = _firstOrder;
    map['reffer_earn_status'] = _refferEarnStatus;
    map['gst_no'] = _gstNo;
    map['proprietor_name'] = _proprietorName;
    map['otp'] = _otp;
    return map;
  }

}