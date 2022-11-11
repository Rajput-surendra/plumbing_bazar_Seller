import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:eshopmultivendor/Model/UploadEstimateModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Helper/Color.dart';
import '../Helper/Constant.dart';
import '../Helper/Session.dart';
import '../Helper/String.dart';

class EstimateDetail extends StatefulWidget {
  Data? data;
  EstimateDetail({this.data});

  @override
  State<EstimateDetail> createState() => _EstimateDetailState();
}

class _EstimateDetailState extends State<EstimateDetail> {


  Future _launchURL(String pdfValue) async{
    var url = '${imageUrl}${pdfValue}';
    print("url value ${url}");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  File? imagePath;
  TextEditingController priceController = TextEditingController();
  
  Future<void> getFromGallery() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.any
    );
    if (result != null) {
      print("check file here ${result.files.single.path}");
      setState(() {
        imagePath = File(result.files.single.path.toString());
      });
      print("image path here ${imagePath}");
      // if (mounted) {
      //   await setProfilePic(image);
      // }
    } else {
      // User canceled the picker
    }
  }

  submitDetail()async{
    print("estid here ${widget.data!.estId}");
    CUR_USERID = await getPrefrence(Id);
    print("user ${CUR_USERID}");
    var headers = {
      'Cookie': 'ci_session=9f3ba13e96b54475b4fd1964d555b61102cf5558'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}update_estimate_ven'));
    request.fields.addAll({
      'amount': '${priceController.text}',
      'est_vendor_id': '${widget.data!.estId}',
      'user_id':'${CUR_USERID}',
    });
   imagePath == null ? null : request.files.add(await http.MultipartFile.fromPath('pro_input_image', '${imagePath!.path.toString()}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      final jsonResponse = json.decode(result);
      print("${jsonResponse['message']}");
      Fluttertoast.showToast(msg: "${jsonResponse['message']}");
      Navigator.pop(context);
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text("Estimate Detail",style: TextStyle(color: primary),),
      ),
      body:  Container(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/1,
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Order Id : "),
                                  Text("${widget.data!.id}",style: TextStyle(color: Colors.black)),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text("Name : "),
                                  Text("${widget.data!.username}",style: TextStyle(color: Colors.black),),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text("Mobile : "),
                                  Text("${widget.data!.mobile}",style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),

                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          _launchURL("${widget.data!.estimate}");
                          //downloadPdf();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text("Download pdf",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      imagePath == null ? SizedBox.shrink() : Container(
                        child: Text("${imagePath!.path.toString()}"),
                      ),
                      // Container(
                      //   margin: EdgeInsetsDirectional.only(end: 20),
                      //   height: 80,
                      //   width: 80,
                      //   decoration: BoxDecoration(
                      //     // shape: BoxShape.circle,
                      //       border: Border.all(
                      //           width: 1.0, color: Colors.white)),
                      //   //  Theme.of(context).colorScheme.primary)),
                      //   child:
                      //   ClipRRect(
                      //     // borderRadius: BorderRadius.circular(100.0),
                      //       child:
                      //       // Consumer<UserProvider>(builder: (context, userProvider, _) {
                      //       // return
                      //       //    userProvider.profilePic != ''
                      //       //      ?
                      //       imagePath != null ?
                      //       // Image.asset("${imagePath}")
                      //       Image.file(imagePath!,fit: BoxFit.fill,)
                      //       // FadeInImage(
                      //       //   fadeInDuration: Duration(milliseconds: 150),
                      //       //   image: NetworkImage(filePath!),
                      //       // // NetworkImage(filePath!),
                      //       //  // CachedNetworkImageProvider(userProvider.profilePic.toString()),
                      //       //   height: 64.0,
                      //       //   width: 64.0,
                      //       //   fit: BoxFit.cover,
                      //       //   imageErrorBuilder: (context, error, stackTrace) =>
                      //       //       errorWidget(64),
                      //       //   placeholder: placeHolder(64),
                      //       // )
                      //           : SizedBox.shrink()
                      //     // }),
                      //   ),
                      // ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: (){
                                      print("working upload here");
                                      // uploadPdf();
                                      getFromGallery();

                                    },
                                    child: Container(
                                      height: 45,
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text("Upload document",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                    height: 45,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: priceController,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5),
                                          hintText: "Enter Price",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6)
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            InkWell(
                              onTap: (){
                                if(priceController.text.isNotEmpty || imagePath!.path.isNotEmpty){
                                  if(widget.data!.sellerEstimate == "") {
                                    submitDetail();
                                  }

                                }
                                else{
                                  Fluttertoast.showToast(msg: "Please fill all the fields");
                                }
                              },
                              child: Container(
                                height: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(widget.data!.sellerEstimate == "" ? "Submit" : "Submitted",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),),
                            )
                          ],
                        ),
                      ), 


                      // InkWell(
                      //   onTap: (){
                      //
                      //   },
                      //   child: Container(
                      //     height: 40,
                      //     decoration: BoxDecoration(
                      //         color: primary,
                      //         borderRadius: BorderRadius.circular(10.0)
                      //     ),
                      //     child: Center(child: Text("Upload Pdf")),
                      //   ),
                      // ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     if(result != null)
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             const Text('Selected file:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      //             ListView.builder(
                      //                 shrinkWrap: true,
                      //                 itemCount: result?.files.length ?? 0,
                      //                 itemBuilder: (context, index) {
                      //                   return Text(result?.files[index].name ?? '', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
                      //                 })
                      //           ],
                      //         ),),
                      //     Center(
                      //       child: ElevatedButton(
                      //         onPressed: () async{
                      //           result = await FilePicker.platform.pickFiles(allowMultiple: true );
                      //           if (result == null) {
                      //             print("No file selected");
                      //           } else {
                      //             setState(() {
                      //             });
                      //             result?.files.forEach((element) {
                      //               print(element.name);
                      //             });
                      //           }
                      //         },
                      //         child: const Text("File Picker"),
                      //       ),
                      //     ),
                      //
                      //   ],
                      // ),



                    ],
                  ),
                ),

              ),
            ),

          ],
        ),
      )
    );
  }
}
