import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/BottomNavigation/Home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Theme/colors.dart';
import 'package:http/http.dart'as http;

import 'homeeeeeeeeeeeeeee.dart';
import 'model/userprofile.dart';


class EditeProfile extends StatefulWidget {
  Userprofile? getProfileModel;
  EditeProfile({this.getProfileModel});

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {


  void initState() {
    // TODO: implement initState
    super.initState();
    // nameCtr.text = widget.getProfileModel!.data![0].username.toString();
    // emailCtr.text = widget.getProfileModel!.data![0].email.toString();
    // mobileController.text = widget.getProfileModel!.data![0].mobile.toString();
    // addressController.text = widget.getProfileModel!.data![0].address.toString();
  }
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController CpassController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  // Data? getprofile;

  String? id;
  String? username;
  // getuserProfile() async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? id  =  preferences.getString('userid');
  //   username  =  preferences.getString('username');
  //   print("aaaaaaaaaa");
  //   print(username);
  //
  //   setState(() {
  //   });
  //   var headers = {
  //     'Cookie': 'ci_session=7ff77755bd5ddabba34d18d1a5a3b7fbca686dfa'
  //   };
  //   var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/financego/app/v1/api/get_profile'));
  //   request.fields.addAll({
  //     'user_id': id.toString()
  //   });
  //   print("This is user request-----------${request.fields}");
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     var finalResult = await response.stream.bytesToString();
  //     final jsonResponse = Userprofile.fromJson(json.decode(finalResult));
  //     print("this is final resultsssssssss${finalResult}");
  //     print("getuserdetails==============>${jsonResponse}");
  //     setState(() {
  //
  //     });
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  // }

  profileUpdate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id  =  preferences.getString('userid');
    username  =  preferences.getString('username');
    print("TTTTTTTTTTTTT>>>>>>>>>>>${id}");
    print("username is here${username}");
    var headers = {
      'Cookie': 'ci_session=199a1efb5ef15df0d3e37e14be83da417540bef9'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/financego/app/v1/api/update_user'));
    request.fields.addAll({
      'user_id': id.toString(),
      'email': emailCtr.text,
      'mobile': mobileController.text,
      'address': addressController.text,
      'image': ''
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }
  // void initState(){
  //   super.initState();
  //   profileUpdate();
  // }
  // File? imageFile;
  // final ImagePicker _picker = ImagePicker();
  //
  // Future<bool> showExitPopup() async {
  //   return await showDialog(
  //     //show confirm dialogue
  //     //the return value will be from "Yes" or "No" options
  //     context: context,
  //     builder: (context) => AlertDialog(
  //         title: Text('Select Image'),
  //         content: Row(
  //           // crossAxisAlignment: CrossAxisAlignment.s,
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             ElevatedButton(
  //               onPressed: () {
  //                 _getFromCamera();
  //               },
  //               //return false when click on "NO"
  //               child: Text('Camera'),
  //             ),
  //             const SizedBox(
  //               width: 15,
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 _getFromGallery();
  //                 // Navigator.pop(context,true);
  //                 // Navigator.pop(context,true);
  //               },
  //               //return true when click on "Yes"
  //               child: Text('Gallery'),
  //             ),
  //           ],
  //         )),
  //   ) ??
  //       false; //if showDialouge had returned null, then return false
  // }
  // _getFromGallery() async {
  //   final XFile? pickedFile =
  //   await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
  //   /* PickedFile? pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //   );*/
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //     Navigator.pop(context);
  //   }
  // }
  // _getFromCamera() async {
  //   final XFile? pickedFile =
  //   await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
  //   /*  PickedFile? pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );*/
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //     Navigator.pop(context);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: primary,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      title: Text(
        "Edit Profile",
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w700, fontSize: 20,color: Colors.white),
      ),
      actions: [
        // TextButton(
        //     onPressed: () {},
        //     child: Text(
        //       locale.update!,
        //       style: Theme.of(context).textTheme.subtitle1!.copyWith(
        //           color: Theme.of(context).primaryColorLight,
        //           fontWeight: FontWeight.w600),
        //     ))
      ],
    ),
    body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            SizedBox(height: 20,),
            Stack(
                children:[
                  Container(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child:Image.asset("assets/imgs/Layer 1753.png",fit: BoxFit.fill,),
                    ),
                    // ClipRRect(
                    //     borderRadius: BorderRadius.circular(20),
                    //     child: Image.asset("assets/images/tablets.png")
                    //   // Image.file(imageFile!,fit: BoxFit.fill,),
                    // ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      // top: 30,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=>ProductList()));
                          // showExitPopup();
                        },
                        child: Container(
                            height: 30,width: 30,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.camera_enhance_outlined,color: Colors.white,)),
                      ))
                ]
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Name", style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: nameCtr,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          // hintText: 'Ankit Bairagi',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: blackColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "name is required";
                      //   }
                      // },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Email Id", style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: emailCtr,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          // hintText: 'ankit0147@gmail.com',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color:blackColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "Email is required";
                      //   }
                      //   if (!v.contains("@")) {
                      //     return "Enter Valid Email Id";
                      //   }
                      // },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Mobile No", style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                          counterText: "",
                          // hintText: '9109599773',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: blackColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "mobile number is required";
                      //   }
                      //
                      // },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Address", style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      // controller: mobileController,
                      // keyboardType: TextInputType.number,
                      // maxLength: 10,
                      decoration: InputDecoration(
                          counterText: "",
                          // hintText: '9109599773',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: blackColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "mobile number is required";
                      //   }
                      //
                      // },
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Text("DOB", style: TextStyle(
                    //       color: blackColor, fontWeight: FontWeight.bold),),
                    // ),
                    //
                    // SizedBox(height: 10,),
                    // TextFormField(
                    //   controller: passController,
                    //   keyboardType: TextInputType.emailAddress,
                    //   decoration: InputDecoration(
                    //       hintText: '22/1/2001',
                    //       hintStyle: TextStyle(
                    //           fontSize: 15.0, color: primary),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10)),
                    //       contentPadding: EdgeInsets.only(left: 10, top: 10)
                    //   ),
                    //   // validator: (v) {
                    //   //   if (v!.isEmpty) {
                    //   //     return "Date of Birth is required";
                    //   //   }
                    //   //
                    //   // },
                    // ),
                    SizedBox(height: 30,),
                    InkWell(
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                        },
                        child:  Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [primary, primary],
                                  stops: [0, 1]),
                              color: primary),
                          child:
                          Center(
                              child: Text("Update", style: TextStyle(fontSize: 18, color: Colors.white))),
                        )
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Text("Gender", style: TextStyle(
                    //       color: colors.black54, fontWeight: FontWeight.bold),),
                    // ),
                    //
                    // SizedBox(height: 10,),
                    // TextFormField(
                    //   controller: CpassController,
                    //   keyboardType: TextInputType.emailAddress,
                    //   decoration: InputDecoration(
                    //       hintText: 'Male',
                    //       hintStyle: TextStyle(
                    //           fontSize: 15.0, color: colors.secondary),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10)),
                    //       contentPadding: EdgeInsets.only(left: 10, top: 10)
                    //   ),
                    //   // validator: (v) {
                    //   //   if (v!.isEmpty) {
                    //   //     return "Gender is required";
                    //   //   }
                    //   // },
                    // ),
                    // SizedBox(height: 10,),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Text("Registration Card", style: TextStyle(
                    //       color: colors.black54, fontWeight: FontWeight.bold),),
                    // ),
                    // SizedBox(height: 10,),
                    //
                    // InkWell(
                    //   onTap: (){
                    //     showExitPopup();
                    //   },
                    //   child: Container(
                    //     // height: MediaQuery.of(context).size.height/4,
                    //     // height: 60,
                    //     child: DottedBorder(
                    //       borderType: BorderType.RRect,
                    //       radius: Radius.circular(5),
                    //       dashPattern: [5, 5],
                    //       color: Colors.grey,
                    //       strokeWidth: 2,
                    //       child: imageFile == null || imageFile == ""  ?
                    //       Center(child:Icon(Icons.drive_folder_upload_outlined,color: Colors.grey,size: 60,)): Column(
                    //         children: [
                    //           Image.file(imageFile!,fit: BoxFit.fill,),
                    //         ],
                    //       ),
                    //
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10,),
                    // SizedBox(height: 45,),
                    // Center(
                    //   child: Btn(
                    //       height: 50,
                    //       width: 320,
                    //       color: colors.secondary,
                    //       title: 'Update',
                    //       // onPress: () {
                    //       //   {
                    //       //     Navigator.push(context,
                    //       //         MaterialPageRoute(
                    //       //             builder: (context) => HomeScreen()));
                    //       //   }
                    //       // },
                    //       onPress: () {
                    //         if (_formKey.currentState!.validate())
                    //         {
                    //           Navigator.push(context,
                    //               MaterialPageRoute(builder: (context) =>ProfileScreen()));
                    //         } else {
                    //           const snackBar = SnackBar(
                    //             content: Text('All Fields are required!'),
                    //           );
                    //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //           //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    //         }
                    //       }
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
}
