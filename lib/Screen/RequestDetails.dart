import 'dart:convert';

import 'package:eshopmultivendor/Helper/Constant.dart';
import 'package:eshopmultivendor/Model/ItemModel.dart';
import 'package:eshopmultivendor/Model/RequestModel.dart';
import 'package:eshopmultivendor/Model/SendPriceModel.dart';
import 'package:eshopmultivendor/Model/SendPriceNewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../Helper/Color.dart';
import '../Helper/Session.dart';
import '../Helper/String.dart';

class RequestScreen extends StatefulWidget {
  final RequestModel? model;
  final id;

  RequestScreen({this.model, this.id});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  RequestModel? result;

  // TextEditingController priceController = TextEditingController();
  List<TextEditingController> priceController = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero,(){
      return   showItem();
    });
    // Future.delayed(Duration(seconds: 1),(){
    //   return submitRequest();
    // } );
  }
  ItemModel? itemData;
  showItem() async{
    var headers = {
      'Cookie': 'ci_session=7ebd43a9ba6fc942b59bfbb905db2da56ffc033f'
    };

    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + 'get_seller_requst_item'));
    request.fields.addAll({
      'request_id': widget.id.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("REEEEEEEEEEEEEEEEEEEEEEE${response.toString()}");
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = ItemModel.fromJson(json.decode(finalResult));
      print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${jsonResponse.data}");
      for(var i =0;i<jsonResponse.data!.length;i++){
        print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSsssss ${jsonResponse.data![i].username}");
      }
      setState(() {
        itemData =jsonResponse;
      });
      // Fluttertoast.showToast(msg: jsonResponse.message.toString());
     // Navigator.pop(context);
    }
    else {
      print(response.reasonPhrase);
    }

  }
  List<String> finalPriceList = [];
  List<String> variantIdList = [];
  List<String> qtyList = [];
  List<String> userIdList = [];

  // List<String> finalPriceList = [];
  sendPrice() async{
    CUR_USERID = await getPrefrence(Id);
    String finalPrice = finalPriceList.join(',');
    String varintId = variantIdList.join(',');
    String qty = qtyList.join(',');
    String userId = userIdList.join(',');


    var headers = {
      'Cookie': 'ci_session=06cf27cfb7ba274b0388a03997a492d7f0654b31'
    };
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl+'update_item_status2'));
    request.fields.addAll({
      'vendor_id': CUR_USERID.toString(),
      'final_price': '$finalPrice',
      'product_variant_id': '$varintId',
      'qty': '$qty',
      'user_id': '$userId',
      'edit_id': '${widget.id}'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
          final jsonResponse = SendPriceNewModel.fromJson(json.decode(finalResult));
          Fluttertoast.showToast(msg: jsonResponse.message.toString());
          Navigator.pop(context);
    }
    else {
      print(response.reasonPhrase);
    }

  }

  // sendRequest() async {
  //   var headers = {
  //     'Cookie': 'ci_session=26f29a303cb65f0ca421af8078387be6681c0f50'
  //   };
  //   var request =
  //       http.MultipartRequest('POST', Uri.parse(baseUrl + 'seller_send_price'));
  //   request.fields.addAll({
  //     'product_id': '${widget.model!.id}',
  //     'qty': '${widget.model!.qty}',
  //     'seller_id': '${widget.model!.sellerId}',
  //     'request_id': '${widget.model!.reqId}',
  //     'user_id': '${widget.model!.userId}',
  //     'final_price': '${priceController.text}'
  //   });
  //   request.headers.addAll(headers);
  //   print("checking request params ${request}");
  //   http.StreamedResponse response = await request.send();
  //   print("status code ${response.statusCode}");
  //   if (response.statusCode == 200) {
  //     var finalResult = await response.stream.bytesToString();
  //     final jsonResponse = SendPriceModel.fromJson(json.decode(finalResult));
  //     Fluttertoast.showToast(msg: jsonResponse.message.toString());
  //     Navigator.pop(context);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

   productDetails(int i){
    priceController.add(TextEditingController());
    return Card(
        elevation: 2,
        child: Container(
          height: MediaQuery.of(context).size.height/5.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child:
                        ClipRRect (
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network("https://developmentalphawizz.com/Plumbing_bazzar/${itemData!.data![i].image}",fit: BoxFit.fill,)
                        )
                      // Image.asset("assets/images/imgpsh_fullsize_anim.png")



                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Name : "),
                            Text("${itemData!.data![i].name}")
                          ],
                        ),
                        Row(
                          children: [
                            Text("Qty : "),
                            Text("${itemData!.data![i].qty}")
                          ],
                        ),
                        Row(
                          children: [
                            Text("Total Price : "),
                            Text("${itemData!.data![i].price}")
                          ],
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: TextFormField(
                            maxLines: 1,
                            controller: priceController[i],
                            keyboardType: TextInputType.number,
                            decoration:  InputDecoration(
                              contentPadding: EdgeInsets.only(top: 2,left: 10),
                              border: OutlineInputBorder(),
                              hintText: 'Enter Price',
                            ),
                          ),
                        )




                      ],
                    ),
                  ),



                ],
              )
            ],
          ),
        )

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            sendPrice();
            // productDetails()
          },
          child: Container(
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(10.0)
            ),
            height: 40,
            width: MediaQuery.of(context).size.width/1.0,

            child: Center(child: Text("Submit Quotation",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),)),
          ),
        ),
      ),
        backgroundColor: lightWhite,
        appBar: getAppBar(getTranslated(context, "REQUEST_DETAILS")!, context),
        body:
            itemData != null ?
        ListView.builder(
          shrinkWrap: true,
          itemCount: itemData!.data!.length, //original file ma joe levu
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            finalPriceList.add(itemData!.data![i].finalPrice.toString());
            variantIdList.add(itemData!.data![i].variantId.toString());
            qtyList.add(itemData!.data![i].qty.toString());
            userIdList.add(itemData!.data![i].userId.toString());

            return productDetails(i);
          },
    )
                : Center(
                  child: Container(
              height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: primary,
                  )),
                )
    );


        // SingleChildScrollView(
        //     child: Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //           height: MediaQuery.of(context).size.height / 8.0,
        //           width: MediaQuery.of(context).size.width / 1.0,
        //           decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(10.0)),
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: [Text("ID :"), Text("50")],
        //                     ),
        //                     Text("Request Date :"),
        //                     Text("${requestData!.data![i].id}")
        //                   ],
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [Text("Date :"), Text("Date")],
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [Text("Date :"), Text("Date")],
        //                 ),
        //               ],
        //             ),
        //           )),
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //           height: MediaQuery.of(context).size.height / 5.0,
        //           width: MediaQuery.of(context).size.width / 1.0,
        //           decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(10.0)),
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Container(
        //                   height: 80,
        //                   child: Row(
        //                     children: [
        //                       Image.asset(
        //                           "assets/images/imgpsh_fullsize_anim.png"),
        //                       SizedBox(
        //                         width: 12,
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.all(8.0),
        //                         child: Column(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             Row(
        //                               mainAxisAlignment: MainAxisAlignment.start,
        //                               children: [
        //                                 Row(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.start,
        //                                   children: [
        //                                     Text("Name :"),
        //                                     Text("Surendra")],
        //                                 ),
        //
        //                               ],
        //                             ),
        //                             Row(
        //                               mainAxisAlignment: MainAxisAlignment.start,
        //                               children: [
        //                                 Text("Qty :"),
        //                                 Text("2")],
        //                             ),
        //                             Row(
        //                               mainAxisAlignment: MainAxisAlignment.start,
        //                               children: [
        //                                 Text("Total Price :"),
        //                                 Text("200")
        //                               ],
        //                             ),
        //                           ],
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           )),
        //     )
        //     Image.asset("assets/images/imgpsh_fullsize_anim.png")
        //
        //     Row(
        //       children: [
        //         Column(
        //           children: [
        //             Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Container(
        //                     decoration: BoxDecoration(
        //                         color: white,
        //                         borderRadius: BorderRadius.circular(10.0)),
        //                     height: MediaQuery.of(context).size.height / 9.9,
        //                     width: MediaQuery.of(context).size.width / 1,
        //                     child: Padding(
        //                       padding: const EdgeInsets.all(8.0),
        //                       child: Column(
        //                         children: [
        //                           Row(
        //                             children: [
        //                               Text(
        //                                 'ID :    ',
        //                                 style: TextStyle(
        //                                     fontSize: 15,
        //                                     color: black,
        //                                     fontWeight: FontWeight.bold),
        //                               ),
        //                               Text("",
        //                                 // '${widget.model!.id}',
        //                                 style: TextStyle(fontSize: 15, color: black),
        //                               ),
        //                             ],
        //                           ),
        //                           SizedBox(
        //                             height: 10,
        //                           ),
        //                           Row(
        //                             children: [
        //                               Text(
        //                                 'Request Date : ',
        //                                 style: TextStyle(
        //                                     fontSize: 15,
        //                                     color: black,
        //                                     fontWeight: FontWeight.bold),
        //                               ),
        //                               Text("",
        //                                 // '${widget.model!.date}',
        //                                 style: TextStyle(fontSize: 15, color: black),
        //                               ),
        //                             ],
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   Padding(
        //                     padding: const EdgeInsets.all(4.0),
        //                     child: Container(
        //                       height: MediaQuery.of(context).size.height / 2.1,
        //                       width: MediaQuery.of(context).size.width / 1,
        //                       decoration: BoxDecoration(
        //                           color: white,
        //                           borderRadius: BorderRadius.circular(10.0)),
        //                       child: Padding(
        //                         padding: const EdgeInsets.all(8.0),
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             // Image.network(
        //                             //   "https://developmentalphawizz.com/Plumbing_bazzar/${widget.model!.image}",
        //                             //   height:
        //                             //   MediaQuery.of(context).size.height / 7.0,
        //                             //   width: MediaQuery.of(context).size.width / 1,
        //                             //   fit: BoxFit.fill,
        //                             // ),
        //                             SizedBox(
        //                               height: 10,
        //                             ),
        //
        //                             Row(
        //                               children: [
        //                                 Text(
        //                                   "Name : ",
        //                                   style:
        //                                   TextStyle(fontWeight: FontWeight.bold),
        //                                 ),
        //                                 Text("",
        //                                   // "${widget.model!.name}",
        //                                 )
        //                               ],
        //                             ),
        //                             SizedBox(
        //                               height: 5,
        //                             ),
        //                             Row(
        //                               children: [
        //                                 Text(
        //                                   "Quantity : ",
        //                                   style:
        //                                   TextStyle(fontWeight: FontWeight.bold),
        //                                 ),
        //                                 Text("",
        //                                   // "${widget.model!.quantity}"
        //                                 )
        //                               ],
        //                             ),
        //                             SizedBox(
        //                               height: 5,
        //                             ),
        //                             Row(
        //                               children: [
        //                                 Text(
        //                                   "Total Price  :",
        //                                   style:
        //                                   TextStyle(fontWeight: FontWeight.bold),
        //                                 ),
        //                                 Text(""
        //                                   // "${widget.model!.price}"
        //                                 )
        //                               ],
        //                             ),
        //                             Text(
        //                               "Price :",
        //                               style: TextStyle(fontWeight: FontWeight.bold),
        //                             ),
        //                             SizedBox(
        //                               height: 5,
        //                             ),
        //                             Container(
        //                               padding: EdgeInsets.symmetric(horizontal: 5),
        //                               decoration: BoxDecoration(border: Border.all()),
        //                               child: TextFormField(
        //                                 maxLines: 1,
        //                                 controller: priceController,
        //                                 keyboardType: TextInputType.number,
        //                                 decoration:
        //                                 InputDecoration(border: InputBorder.none,hintText: "Enter Price"),
        //                               ),
        //                             ),
        //                             SizedBox(
        //                               height: 5,
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //
        //                 ]),
        //             Padding(
        //               padding: const EdgeInsets.all(5.0),
        //               child: InkWell(
        //                 onTap: () {
        //                   sendRequest();
        //                 },
        //                 child: Container(
        //                   height: 40,
        //                   decoration: BoxDecoration(
        //                       color: primary,
        //                       borderRadius: BorderRadius.circular(10.0)),
        //                   child: Center(
        //                       child: Text(
        //                         "Submit Quotation",
        //                         style: TextStyle(color: white),
        //                       )),
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ],
        //     )
        //   ],
        // )));
  }
}
