import 'dart:convert';
import 'dart:io';
import 'package:eshopmultivendor/Helper/Constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:eshopmultivendor/Helper/Color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/Session.dart';
import '../Helper/String.dart';

class UploadCustomer extends StatefulWidget {
  const UploadCustomer({Key? key}) : super(key: key);

  @override
  State<UploadCustomer> createState() => _UploadCustomerState();
}

class _UploadCustomerState extends State<UploadCustomer> {
  File? imagePath;

  uploadImage()async{
    CUR_USERID = await getPrefrence(Id);
    var headers = {
      'Cookie': 'ci_session=135a4fdfe520ebed0b10065ef7bb0d702ac540a3'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}update_image'));
    request.fields.addAll({
      'user_id': '${CUR_USERID}'
    });
    print("image path here ${imagePath!.path.toString()}");
   imagePath == null ? null : request.files.add(await http.MultipartFile.fromPath('file', '${imagePath!.path.toString()}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var Jsonresponse  =  await response.stream.bytesToString();
      final Result = json.decode(Jsonresponse);
      print("result ${Result}");
      Fluttertoast.showToast(msg: "${Result['message']}");
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
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Upload Delivery Images",
          style: TextStyle(color: primary),
        ),
      ),
      body: Column(
          children: [

        Card(
          elevation: 5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: imagePath ==  null ? SizedBox.shrink() : Text("${imagePath!.path.toString()}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
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
                                  child: Text(
                                    "Upload Image",
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ]),
                    )),
              ),
            ],
          ),

        ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  uploadImage();
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  child: Center(child: Text("Delivery Image Upload",style: TextStyle(color: Colors.white),)),
                ),
              ),
            )
      ]),
    );
  }

  Future<void> getFromGallery() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.any);
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
}
