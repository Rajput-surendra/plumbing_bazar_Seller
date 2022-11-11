import 'dart:convert';
ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));
String itemModelToJson(ItemModel data) => json.encode(data.toJson());
class ItemModel {
  ItemModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  ItemModel.fromJson(dynamic json) {
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
ItemModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => ItemModel(  error: error ?? _error,
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
      dynamic id, 
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
      String? reqId, 
      String? userId, 
      String? productVariantId, 
      String? qty, 
      String? finalPrice, 
      dynamic sellerId, 
      String? date, 
      dynamic pPrice, 
      dynamic productIdentity, 
      dynamic categoryId, 
      dynamic tax, 
      dynamic rowOrder, 
      dynamic type, 
      dynamic stockType, 
      dynamic name, 
      dynamic shortDescription, 
      dynamic slug, 
      dynamic indicator, 
      dynamic codAllowed, 
      dynamic minimumOrderQuantity, 
      dynamic quantityStepSize, 
      dynamic totalAllowedQuantity, 
      dynamic isPricesInclusiveTax, 
      dynamic isReturnable, 
      dynamic isCancelable, 
      dynamic cancelableTill, 
      dynamic otherImages, 
      dynamic videoType, 
      dynamic video, 
      dynamic tags, 
      dynamic warrantyPeriod, 
      dynamic guaranteePeriod, 
      dynamic madeIn, 
      dynamic sku, 
      dynamic stock, 
      dynamic availability, 
      dynamic rating, 
      dynamic noOfRatings, 
      dynamic description, 
      dynamic deliverableType, 
      dynamic deliverableZipcodes, 
      dynamic status, 
      dynamic dateAdded, 
      dynamic productId, 
      dynamic attributeValueIds, 
      dynamic attributeSet, 
      dynamic price, 
      dynamic specialPrice, 
      dynamic images, 
      dynamic minDiscount, 
      dynamic maxDiscount, 
      dynamic minPrice, 
      dynamic maxPrice, 
      dynamic quantity, 
      dynamic variantId, 
      dynamic pImage, 
      dynamic pId, 
      dynamic pSpecialPrice,}){
    _id = id;
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
    _reqId = reqId;
    _userId = userId;
    _productVariantId = productVariantId;
    _qty = qty;
    _finalPrice = finalPrice;
    _sellerId = sellerId;
    _date = date;
    _pPrice = pPrice;
    _productIdentity = productIdentity;
    _categoryId = categoryId;
    _tax = tax;
    _rowOrder = rowOrder;
    _type = type;
    _stockType = stockType;
    _name = name;
    _shortDescription = shortDescription;
    _slug = slug;
    _indicator = indicator;
    _codAllowed = codAllowed;
    _minimumOrderQuantity = minimumOrderQuantity;
    _quantityStepSize = quantityStepSize;
    _totalAllowedQuantity = totalAllowedQuantity;
    _isPricesInclusiveTax = isPricesInclusiveTax;
    _isReturnable = isReturnable;
    _isCancelable = isCancelable;
    _cancelableTill = cancelableTill;
    _otherImages = otherImages;
    _videoType = videoType;
    _video = video;
    _tags = tags;
    _warrantyPeriod = warrantyPeriod;
    _guaranteePeriod = guaranteePeriod;
    _madeIn = madeIn;
    _sku = sku;
    _stock = stock;
    _availability = availability;
    _rating = rating;
    _noOfRatings = noOfRatings;
    _description = description;
    _deliverableType = deliverableType;
    _deliverableZipcodes = deliverableZipcodes;
    _status = status;
    _dateAdded = dateAdded;
    _productId = productId;
    _attributeValueIds = attributeValueIds;
    _attributeSet = attributeSet;
    _price = price;
    _specialPrice = specialPrice;
    _images = images;
    _minDiscount = minDiscount;
    _maxDiscount = maxDiscount;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _quantity = quantity;
    _variantId = variantId;
    _pImage = pImage;
    _pId = pId;
    _pSpecialPrice = pSpecialPrice;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
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
    _reqId = json['req_id'];
    _userId = json['user_id'];
    _productVariantId = json['product_variant_id'];
    _qty = json['qty'];
    _finalPrice = json['final_price'];
    _sellerId = json['seller_id'];
    _date = json['date'];
    _pPrice = json['p_price'];
    _productIdentity = json['product_identity'];
    _categoryId = json['category_id'];
    _tax = json['tax'];
    _rowOrder = json['row_order'];
    _type = json['type'];
    _stockType = json['stock_type'];
    _name = json['name'];
    _shortDescription = json['short_description'];
    _slug = json['slug'];
    _indicator = json['indicator'];
    _codAllowed = json['cod_allowed'];
    _minimumOrderQuantity = json['minimum_order_quantity'];
    _quantityStepSize = json['quantity_step_size'];
    _totalAllowedQuantity = json['total_allowed_quantity'];
    _isPricesInclusiveTax = json['is_prices_inclusive_tax'];
    _isReturnable = json['is_returnable'];
    _isCancelable = json['is_cancelable'];
    _cancelableTill = json['cancelable_till'];
    _otherImages = json['other_images'];
    _videoType = json['video_type'];
    _video = json['video'];
    _tags = json['tags'];
    _warrantyPeriod = json['warranty_period'];
    _guaranteePeriod = json['guarantee_period'];
    _madeIn = json['made_in'];
    _sku = json['sku'];
    _stock = json['stock'];
    _availability = json['availability'];
    _rating = json['rating'];
    _noOfRatings = json['no_of_ratings'];
    _description = json['description'];
    _deliverableType = json['deliverable_type'];
    _deliverableZipcodes = json['deliverable_zipcodes'];
    _status = json['status'];
    _dateAdded = json['date_added'];
    _productId = json['product_id'];
    _attributeValueIds = json['attribute_value_ids'];
    _attributeSet = json['attribute_set'];
    _price = json['price'];
    _specialPrice = json['special_price'];
    _images = json['images'];
    _minDiscount = json['min_discount'];
    _maxDiscount = json['max_discount'];
    _minPrice = json['min_price'];
    _maxPrice = json['max_price'];
    _quantity = json['quantity'];
    _variantId = json['variant_id'];
    _pImage = json['p_image'];
    _pId = json['p_id'];
    _pSpecialPrice = json['p_special_price'];
  }
  dynamic _id;
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
  String? _reqId;
  String? _userId;
  String? _productVariantId;
  String? _qty;
  String? _finalPrice;
  dynamic _sellerId;
  String? _date;
  dynamic _pPrice;
  dynamic _productIdentity;
  dynamic _categoryId;
  dynamic _tax;
  dynamic _rowOrder;
  dynamic _type;
  dynamic _stockType;
  dynamic _name;
  dynamic _shortDescription;
  dynamic _slug;
  dynamic _indicator;
  dynamic _codAllowed;
  dynamic _minimumOrderQuantity;
  dynamic _quantityStepSize;
  dynamic _totalAllowedQuantity;
  dynamic _isPricesInclusiveTax;
  dynamic _isReturnable;
  dynamic _isCancelable;
  dynamic _cancelableTill;
  dynamic _otherImages;
  dynamic _videoType;
  dynamic _video;
  dynamic _tags;
  dynamic _warrantyPeriod;
  dynamic _guaranteePeriod;
  dynamic _madeIn;
  dynamic _sku;
  dynamic _stock;
  dynamic _availability;
  dynamic _rating;
  dynamic _noOfRatings;
  dynamic _description;
  dynamic _deliverableType;
  dynamic _deliverableZipcodes;
  dynamic _status;
  dynamic _dateAdded;
  dynamic _productId;
  dynamic _attributeValueIds;
  dynamic _attributeSet;
  dynamic _price;
  dynamic _specialPrice;
  dynamic _images;
  dynamic _minDiscount;
  dynamic _maxDiscount;
  dynamic _minPrice;
  dynamic _maxPrice;
  dynamic _quantity;
  dynamic _variantId;
  dynamic _pImage;
  dynamic _pId;
  dynamic _pSpecialPrice;
Data copyWith({  dynamic id,
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
  String? reqId,
  String? userId,
  String? productVariantId,
  String? qty,
  String? finalPrice,
  dynamic sellerId,
  String? date,
  dynamic pPrice,
  dynamic productIdentity,
  dynamic categoryId,
  dynamic tax,
  dynamic rowOrder,
  dynamic type,
  dynamic stockType,
  dynamic name,
  dynamic shortDescription,
  dynamic slug,
  dynamic indicator,
  dynamic codAllowed,
  dynamic minimumOrderQuantity,
  dynamic quantityStepSize,
  dynamic totalAllowedQuantity,
  dynamic isPricesInclusiveTax,
  dynamic isReturnable,
  dynamic isCancelable,
  dynamic cancelableTill,
  dynamic otherImages,
  dynamic videoType,
  dynamic video,
  dynamic tags,
  dynamic warrantyPeriod,
  dynamic guaranteePeriod,
  dynamic madeIn,
  dynamic sku,
  dynamic stock,
  dynamic availability,
  dynamic rating,
  dynamic noOfRatings,
  dynamic description,
  dynamic deliverableType,
  dynamic deliverableZipcodes,
  dynamic status,
  dynamic dateAdded,
  dynamic productId,
  dynamic attributeValueIds,
  dynamic attributeSet,
  dynamic price,
  dynamic specialPrice,
  dynamic images,
  dynamic minDiscount,
  dynamic maxDiscount,
  dynamic minPrice,
  dynamic maxPrice,
  dynamic quantity,
  dynamic variantId,
  dynamic pImage,
  dynamic pId,
  dynamic pSpecialPrice,
}) => Data(  id: id ?? _id,
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
  reqId: reqId ?? _reqId,
  userId: userId ?? _userId,
  productVariantId: productVariantId ?? _productVariantId,
  qty: qty ?? _qty,
  finalPrice: finalPrice ?? _finalPrice,
  sellerId: sellerId ?? _sellerId,
  date: date ?? _date,
  pPrice: pPrice ?? _pPrice,
  productIdentity: productIdentity ?? _productIdentity,
  categoryId: categoryId ?? _categoryId,
  tax: tax ?? _tax,
  rowOrder: rowOrder ?? _rowOrder,
  type: type ?? _type,
  stockType: stockType ?? _stockType,
  name: name ?? _name,
  shortDescription: shortDescription ?? _shortDescription,
  slug: slug ?? _slug,
  indicator: indicator ?? _indicator,
  codAllowed: codAllowed ?? _codAllowed,
  minimumOrderQuantity: minimumOrderQuantity ?? _minimumOrderQuantity,
  quantityStepSize: quantityStepSize ?? _quantityStepSize,
  totalAllowedQuantity: totalAllowedQuantity ?? _totalAllowedQuantity,
  isPricesInclusiveTax: isPricesInclusiveTax ?? _isPricesInclusiveTax,
  isReturnable: isReturnable ?? _isReturnable,
  isCancelable: isCancelable ?? _isCancelable,
  cancelableTill: cancelableTill ?? _cancelableTill,
  otherImages: otherImages ?? _otherImages,
  videoType: videoType ?? _videoType,
  video: video ?? _video,
  tags: tags ?? _tags,
  warrantyPeriod: warrantyPeriod ?? _warrantyPeriod,
  guaranteePeriod: guaranteePeriod ?? _guaranteePeriod,
  madeIn: madeIn ?? _madeIn,
  sku: sku ?? _sku,
  stock: stock ?? _stock,
  availability: availability ?? _availability,
  rating: rating ?? _rating,
  noOfRatings: noOfRatings ?? _noOfRatings,
  description: description ?? _description,
  deliverableType: deliverableType ?? _deliverableType,
  deliverableZipcodes: deliverableZipcodes ?? _deliverableZipcodes,
  status: status ?? _status,
  dateAdded: dateAdded ?? _dateAdded,
  productId: productId ?? _productId,
  attributeValueIds: attributeValueIds ?? _attributeValueIds,
  attributeSet: attributeSet ?? _attributeSet,
  price: price ?? _price,
  specialPrice: specialPrice ?? _specialPrice,
  images: images ?? _images,
  minDiscount: minDiscount ?? _minDiscount,
  maxDiscount: maxDiscount ?? _maxDiscount,
  minPrice: minPrice ?? _minPrice,
  maxPrice: maxPrice ?? _maxPrice,
  quantity: quantity ?? _quantity,
  variantId: variantId ?? _variantId,
  pImage: pImage ?? _pImage,
  pId: pId ?? _pId,
  pSpecialPrice: pSpecialPrice ?? _pSpecialPrice,
);
  dynamic get id => _id;
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
  String? get reqId => _reqId;
  String? get userId => _userId;
  String? get productVariantId => _productVariantId;
  String? get qty => _qty;
  String? get finalPrice => _finalPrice;
  dynamic get sellerId => _sellerId;
  String? get date => _date;
  dynamic get pPrice => _pPrice;
  dynamic get productIdentity => _productIdentity;
  dynamic get categoryId => _categoryId;
  dynamic get tax => _tax;
  dynamic get rowOrder => _rowOrder;
  dynamic get type => _type;
  dynamic get stockType => _stockType;
  dynamic get name => _name;
  dynamic get shortDescription => _shortDescription;
  dynamic get slug => _slug;
  dynamic get indicator => _indicator;
  dynamic get codAllowed => _codAllowed;
  dynamic get minimumOrderQuantity => _minimumOrderQuantity;
  dynamic get quantityStepSize => _quantityStepSize;
  dynamic get totalAllowedQuantity => _totalAllowedQuantity;
  dynamic get isPricesInclusiveTax => _isPricesInclusiveTax;
  dynamic get isReturnable => _isReturnable;
  dynamic get isCancelable => _isCancelable;
  dynamic get cancelableTill => _cancelableTill;
  dynamic get otherImages => _otherImages;
  dynamic get videoType => _videoType;
  dynamic get video => _video;
  dynamic get tags => _tags;
  dynamic get warrantyPeriod => _warrantyPeriod;
  dynamic get guaranteePeriod => _guaranteePeriod;
  dynamic get madeIn => _madeIn;
  dynamic get sku => _sku;
  dynamic get stock => _stock;
  dynamic get availability => _availability;
  dynamic get rating => _rating;
  dynamic get noOfRatings => _noOfRatings;
  dynamic get description => _description;
  dynamic get deliverableType => _deliverableType;
  dynamic get deliverableZipcodes => _deliverableZipcodes;
  dynamic get status => _status;
  dynamic get dateAdded => _dateAdded;
  dynamic get productId => _productId;
  dynamic get attributeValueIds => _attributeValueIds;
  dynamic get attributeSet => _attributeSet;
  dynamic get price => _price;
  dynamic get specialPrice => _specialPrice;
  dynamic get images => _images;
  dynamic get minDiscount => _minDiscount;
  dynamic get maxDiscount => _maxDiscount;
  dynamic get minPrice => _minPrice;
  dynamic get maxPrice => _maxPrice;
  dynamic get quantity => _quantity;
  dynamic get variantId => _variantId;
  dynamic get pImage => _pImage;
  dynamic get pId => _pId;
  dynamic get pSpecialPrice => _pSpecialPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
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
    map['req_id'] = _reqId;
    map['user_id'] = _userId;
    map['product_variant_id'] = _productVariantId;
    map['qty'] = _qty;
    map['final_price'] = _finalPrice;
    map['seller_id'] = _sellerId;
    map['date'] = _date;
    map['p_price'] = _pPrice;
    map['product_identity'] = _productIdentity;
    map['category_id'] = _categoryId;
    map['tax'] = _tax;
    map['row_order'] = _rowOrder;
    map['type'] = _type;
    map['stock_type'] = _stockType;
    map['name'] = _name;
    map['short_description'] = _shortDescription;
    map['slug'] = _slug;
    map['indicator'] = _indicator;
    map['cod_allowed'] = _codAllowed;
    map['minimum_order_quantity'] = _minimumOrderQuantity;
    map['quantity_step_size'] = _quantityStepSize;
    map['total_allowed_quantity'] = _totalAllowedQuantity;
    map['is_prices_inclusive_tax'] = _isPricesInclusiveTax;
    map['is_returnable'] = _isReturnable;
    map['is_cancelable'] = _isCancelable;
    map['cancelable_till'] = _cancelableTill;
    map['other_images'] = _otherImages;
    map['video_type'] = _videoType;
    map['video'] = _video;
    map['tags'] = _tags;
    map['warranty_period'] = _warrantyPeriod;
    map['guarantee_period'] = _guaranteePeriod;
    map['made_in'] = _madeIn;
    map['sku'] = _sku;
    map['stock'] = _stock;
    map['availability'] = _availability;
    map['rating'] = _rating;
    map['no_of_ratings'] = _noOfRatings;
    map['description'] = _description;
    map['deliverable_type'] = _deliverableType;
    map['deliverable_zipcodes'] = _deliverableZipcodes;
    map['status'] = _status;
    map['date_added'] = _dateAdded;
    map['product_id'] = _productId;
    map['attribute_value_ids'] = _attributeValueIds;
    map['attribute_set'] = _attributeSet;
    map['price'] = _price;
    map['special_price'] = _specialPrice;
    map['images'] = _images;
    map['min_discount'] = _minDiscount;
    map['max_discount'] = _maxDiscount;
    map['min_price'] = _minPrice;
    map['max_price'] = _maxPrice;
    map['quantity'] = _quantity;
    map['variant_id'] = _variantId;
    map['p_image'] = _pImage;
    map['p_id'] = _pId;
    map['p_special_price'] = _pSpecialPrice;
    return map;
  }

}