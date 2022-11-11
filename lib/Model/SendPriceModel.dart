import 'dart:convert';
SendPriceModel sendPriceModelFromJson(String str) => SendPriceModel.fromJson(json.decode(str));
String sendPriceModelToJson(SendPriceModel data) => json.encode(data.toJson());
class SendPriceModel {
  SendPriceModel({
      bool? error, 
      String? message, 
      List<Data1>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  SendPriceModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data1.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data1>? _data;
SendPriceModel copyWith({  bool? error,
  String? message,
  List<Data1>? data,
}) => SendPriceModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<Data1>? get data => _data;

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

Data1 dataFromJson(String str) => Data1.fromJson(json.decode(str));
String dataToJson(Data1 data) => json.encode(data.toJson());
class Data1 {
  Data1({
      String? id, 
      String? productVariantId, 
      String? qty, 
      String? price, 
      String? vendorId, 
      String? requestId, 
      String? userId, 
      String? finalPrice,}){
    _id = id;
    _productVariantId = productVariantId;
    _qty = qty;
    _price = price;
    _vendorId = vendorId;
    _requestId = requestId;
    _userId = userId;
    _finalPrice = finalPrice;
}

  Data1.fromJson(dynamic json) {
    _id = json['id'];
    _productVariantId = json['product_variant_id'];
    _qty = json['qty'];
    _price = json['price'];
    _vendorId = json['vendor_id'];
    _requestId = json['request_id'];
    _userId = json['user_id'];
    _finalPrice = json['final_price'];
  }
  String? _id;
  String? _productVariantId;
  String? _qty;
  String? _price;
  String? _vendorId;
  String? _requestId;
  String? _userId;
  String? _finalPrice;
Data1 copyWith({  String? id,
  String? productVariantId,
  String? qty,
  String? price,
  String? vendorId,
  String? requestId,
  String? userId,
  String? finalPrice,
}) => Data1(  id: id ?? _id,
  productVariantId: productVariantId ?? _productVariantId,
  qty: qty ?? _qty,
  price: price ?? _price,
  vendorId: vendorId ?? _vendorId,
  requestId: requestId ?? _requestId,
  userId: userId ?? _userId,
  finalPrice: finalPrice ?? _finalPrice,
);
  String? get id => _id;
  String? get productVariantId => _productVariantId;
  String? get qty => _qty;
  String? get price => _price;
  String? get vendorId => _vendorId;
  String? get requestId => _requestId;
  String? get userId => _userId;
  String? get finalPrice => _finalPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_variant_id'] = _productVariantId;
    map['qty'] = _qty;
    map['price'] = _price;
    map['vendor_id'] = _vendorId;
    map['request_id'] = _requestId;
    map['user_id'] = _userId;
    map['final_price'] = _finalPrice;
    return map;
  }

}