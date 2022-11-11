import 'dart:convert';
/// error : false
/// message : "Data retrieved successfully"
/// data : [{"estimate_id":"45","estimate_v":"uploads/user_image/sample.pdf","createdate":"2022-11-05 19:10:10","id":"156","username":"devesh","mobile":"8349922853","estimate":"uploads/user_image/sample.pdf","create_date":"2022-11-05 19:10:10","user_id":"1","est_id":"45","seller_id":"598","seller_estimate":"uploads/media/2022/PVC-Pipes.jpg","vendor_amount":"100"},{"estimate_id":"46","estimate_v":"uploads/user_image/IMG-20221104-WA0000.jpg","createdate":"2022-11-05 19:38:13","id":"158","username":"Karan","mobile":"8770496665","estimate":"uploads/user_image/IMG-20221104-WA0000.jpg","create_date":"2022-11-05 19:38:13","user_id":"581","est_id":"46","seller_id":"598","seller_estimate":"","vendor_amount":"200"}]

UploadEstimateModel uploadEstimateModelFromJson(String str) => UploadEstimateModel.fromJson(json.decode(str));
String uploadEstimateModelToJson(UploadEstimateModel data) => json.encode(data.toJson());
class UploadEstimateModel {
  UploadEstimateModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  UploadEstimateModel.fromJson(dynamic json) {
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
UploadEstimateModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => UploadEstimateModel(  error: error ?? _error,
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

/// estimate_id : "45"
/// estimate_v : "uploads/user_image/sample.pdf"
/// createdate : "2022-11-05 19:10:10"
/// id : "156"
/// username : "devesh"
/// mobile : "8349922853"
/// estimate : "uploads/user_image/sample.pdf"
/// create_date : "2022-11-05 19:10:10"
/// user_id : "1"
/// est_id : "45"
/// seller_id : "598"
/// seller_estimate : "uploads/media/2022/PVC-Pipes.jpg"
/// vendor_amount : "100"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? estimateId, 
      String? estimateV, 
      String? createdate, 
      String? id, 
      String? username, 
      String? mobile, 
      String? estimate, 
      String? createDate, 
      String? userId, 
      String? estId, 
      String? sellerId, 
      String? sellerEstimate, 
      String? vendorAmount,}){
    _estimateId = estimateId;
    _estimateV = estimateV;
    _createdate = createdate;
    _id = id;
    _username = username;
    _mobile = mobile;
    _estimate = estimate;
    _createDate = createDate;
    _userId = userId;
    _estId = estId;
    _sellerId = sellerId;
    _sellerEstimate = sellerEstimate;
    _vendorAmount = vendorAmount;
}

  Data.fromJson(dynamic json) {
    _estimateId = json['estimate_id'];
    _estimateV = json['estimate_v'];
    _createdate = json['createdate'];
    _id = json['id'];
    _username = json['username'];
    _mobile = json['mobile'];
    _estimate = json['estimate'];
    _createDate = json['create_date'];
    _userId = json['user_id'];
    _estId = json['est_id'];
    _sellerId = json['seller_id'];
    _sellerEstimate = json['seller_estimate'];
    _vendorAmount = json['vendor_amount'];
  }
  String? _estimateId;
  String? _estimateV;
  String? _createdate;
  String? _id;
  String? _username;
  String? _mobile;
  String? _estimate;
  String? _createDate;
  String? _userId;
  String? _estId;
  String? _sellerId;
  String? _sellerEstimate;
  String? _vendorAmount;
Data copyWith({  String? estimateId,
  String? estimateV,
  String? createdate,
  String? id,
  String? username,
  String? mobile,
  String? estimate,
  String? createDate,
  String? userId,
  String? estId,
  String? sellerId,
  String? sellerEstimate,
  String? vendorAmount,
}) => Data(  estimateId: estimateId ?? _estimateId,
  estimateV: estimateV ?? _estimateV,
  createdate: createdate ?? _createdate,
  id: id ?? _id,
  username: username ?? _username,
  mobile: mobile ?? _mobile,
  estimate: estimate ?? _estimate,
  createDate: createDate ?? _createDate,
  userId: userId ?? _userId,
  estId: estId ?? _estId,
  sellerId: sellerId ?? _sellerId,
  sellerEstimate: sellerEstimate ?? _sellerEstimate,
  vendorAmount: vendorAmount ?? _vendorAmount,
);
  String? get estimateId => _estimateId;
  String? get estimateV => _estimateV;
  String? get createdate => _createdate;
  String? get id => _id;
  String? get username => _username;
  String? get mobile => _mobile;
  String? get estimate => _estimate;
  String? get createDate => _createDate;
  String? get userId => _userId;
  String? get estId => _estId;
  String? get sellerId => _sellerId;
  String? get sellerEstimate => _sellerEstimate;
  String? get vendorAmount => _vendorAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['estimate_id'] = _estimateId;
    map['estimate_v'] = _estimateV;
    map['createdate'] = _createdate;
    map['id'] = _id;
    map['username'] = _username;
    map['mobile'] = _mobile;
    map['estimate'] = _estimate;
    map['create_date'] = _createDate;
    map['user_id'] = _userId;
    map['est_id'] = _estId;
    map['seller_id'] = _sellerId;
    map['seller_estimate'] = _sellerEstimate;
    map['vendor_amount'] = _vendorAmount;
    return map;
  }

}