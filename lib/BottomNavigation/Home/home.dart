import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quick_pay/BottomNavigation/Account/my_profile.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/add_money.dart';

import 'package:quick_pay/Theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/getbannermodel.dart';
import '../../model/userprofile.dart';
import '../Account/notifications_page.dart';
import '../Scan/scan_page.dart';
import 'Pages/get_payment.dart';
import 'Pages/phone_recharge.dart';
import 'Pages/transactions_page.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class Payment {
  String image;
  String? title;
  Function onTap;
  Payment(this.image, this.title, this.onTap);
}

class _HomePageState extends State<HomePage> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
   int currentindex=0;

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;
  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
    await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );
    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }
    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  Getbannermodel? getbannermodel;
  getBanner() async {
    var headers = {
      'Cookie': 'ci_session=83721b31871c96522e60f489ca4e917362cdb60c'
    };
    var request = http.Request('GET', Uri.parse('https://developmentalphawizz.com/financego/app/v1/api/get_slider_images'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = Getbannermodel.fromJson(json.decode(finalResponse));
      print("aaaaaaaa>>>>>>>>>>>>>$jsonResponse");
      setState(() {
        getbannermodel = jsonResponse;
      });

      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
  }

  String? username;
  String? address;

  getuserProfile() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id  =  preferences.getString('userid');
    username  =  preferences.getString('username');
    address =preferences.getString("address");

    print(address);
    setState(() {
    });
    var headers = {
      'Cookie': 'ci_session=7ff77755bd5ddabba34d18d1a5a3b7fbca686dfa'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/financego/app/v1/api/get_profile'));
    request.fields.addAll({
      'user_id': id.toString()
    });
    print("This is user request-----------${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = Userprofile.fromJson(json.decode(finalResult));
      print("this is final resultsssssssss${finalResult}");

      print("getuserdetails==============>${jsonResponse}");
      setState(() {

      });
    }
    else {
      print(response.reasonPhrase);
    }
  }
  void initState(){
    super.initState();
    getuserProfile();
    getBanner();
  }
  @override
  void dispose() {
    super.dispose();
    _anchoredBanner?.dispose();
  }
  List<Map<String, dynamic>> newsList = [
    {"image": "assets/imgs/Pay or Send.png", "title": "Pay Or Send",},
    {"image": "assets/imgs/Add Money.png", "title": "Add Money",},
    {"image": "assets/imgs/Get Payment.png", "title": "QR Code",},
    {"image": "assets/imgs/Add Money.png", "title": "Transaction History",},
    {"image": "assets/imgs/wallet.png", "title": "Wallet",},
    // {"image": "assets/imgs/Editorial1.png", "title": "Editorial",},
    // {"image": "assets/imgs/Awareness inputs.png", "title": "Awareness Inputs",},
  ];
  List<Map<String, dynamic>> newsList2 = [
    {"image": "assets/imgs/Recharge.png", "title": "Recharge",},
    {"image": "assets/imgs/Electricity.png", "title": "Electricity",},
    {"image": "assets/imgs/Water Bill.png", "title": " Water Bill",},
    {"image": "assets/imgs/Gas Bill.png", "title": "Gas Bil",},
    {"image": "assets/imgs/Recharge.png", "title": "Dth",},
    {"image": "assets/imgs/See all.png", "title": "See all",},
    // {"image": "assets/imgs/Awareness inputs.png", "title": "Awareness Inputs",},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/8.5,
                child: Stack(
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height/9.5,
                      width:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color:primary,
                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),
                              bottomRight:Radius.circular(20))),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(70),
                                            child:Image.asset("assets/imgs/Layer 1753.png",fit: BoxFit.fill,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(username?? "name",style: TextStyle(color: Colors.white,fontSize: 20)),
                                      Container(
                                        width: 80,
                                        child: Text(address?? "" ,style: TextStyle(color: Colors.white,fontSize: 15, overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 40),
                                Image.asset("assets/homelogo.png", height: 82, width: 82,),
                                SizedBox(width: MediaQuery.of(context).size.width/5),
                                Row(
                                  children: [ InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (c)=> ScanQRPage()));
                                    },
                                    child: Icon(Icons.qr_code_scanner,color: Colors.white,)),
                                  SizedBox(width: 10,),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (c)=> NotificationsPage()));
                                      },
                                      child: Icon(Icons.notifications,color: Colors.white,)),],),
                              ],),
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   top: 85,
                    //   left: 20,
                    //   right: 20,
                    //   child: Container(
                    //     height: 45,
                    //     width:MediaQuery.of(context).size.width,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(8)),
                    //     child: Center(child:TextFormField(
                    //       decoration: InputDecoration(
                    //           border: InputBorder.none,
                    //           prefixIcon: Icon(Icons.search,color: Colors.grey,),
                    //           hintText: 'Search here'),style: TextStyle(color: Colors.grey),)
                    //     ),
                    //   ),
                    // )
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _RechargCard(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Quick recharge & Bill Payment",style: TextStyle(color: blackColor,fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                    _RechargCard2(),
                    _CarouselSlider(),
                    // CarouselSlider(
                    //   options: CarouselOptions(
                    //       viewportFraction: 1.0,
                    //       initialPage: 0,
                    //       enableInfiniteScroll: true,
                    //       reverse: false,
                    //       autoPlay: true,
                    //       autoPlayInterval: Duration(seconds: 3),
                    //       autoPlayAnimationDuration:
                    //       Duration(milliseconds: 150),
                    //       enlargeCenterPage: false,
                    //       scrollDirection: Axis.horizontal,
                    //       height: 150.0),
                    //   items: [1,2,3,4,5].map((i) {
                    //     return Builder(
                    //       builder: (BuildContext context) {
                    //         return Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           margin: EdgeInsets.symmetric(horizontal: 5.0,),
                    //           child: ClipRRect(
                    //               borderRadius: BorderRadius.circular(20),
                    //               child:
                    //               Image.asset("assets/imgs/home banner.png",)
                    //             // Image.network(
                    //             //   "${getbannermodel.data![0].image}",
                    //             //   fit: BoxFit.fill,
                    //             // )
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   }).toList(),
                    // ),
                  ],
                ),
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                        width: 30.0,
                        height: 4.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    Container(
                        width: 30.0,
                        height: 4.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10),
                        )
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  newsCard(int i){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: (){
          if(i == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (C) => ScanQRPage()));
          }else if(i ==1){
            Navigator.push(
                context, MaterialPageRoute(builder: (C) => AddMoneyUI()));
          }else if(i == 2){
            Navigator.push(
                context, MaterialPageRoute(builder: (C) => GetPaymentPage()));
          }else {
            Navigator.push(
                context, MaterialPageRoute(builder: (C) => TransactionPage()));
          }
        },
        child: Container(
          // height: 300,
          child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                      children:[
                        Image.asset('${newsList[i]['image']}',height: 40,),
                      ]
                  ),
                  SizedBox(height: 5,),
                  Text("${newsList[i]['title']}",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),)
                ],
              )),
        ),
      ),
    );
  }
  newsCard2(int i){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: (){
          if(i == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (C) => PhoneRechargePage()));
          }
          // else if(i ==1){
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          //
          // }else if(i == 2){
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          // } else if (i==3){
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          // } else if (i==4){
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          // } else {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          // }
        },
        child: Container(
          child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                      children:[
                        Image.asset('${newsList2[i]['image']}',height: 40,),
                      ]
                  ),
                  Text("${newsList2[i]['title']}",textAlign: TextAlign.center,style: TextStyle(color: Colors.black),)
                ],
              )),
        ),
      ),
    );
  }
  _RechargCard(){
    return  SizedBox(
      height:MediaQuery.of(context).size.height/6.3,
      width:MediaQuery.of(context).size.width,
      child: GridView.builder(
        shrinkWrap: false,
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 0.9
        ),
        itemBuilder:(context, index) {
          return newsCard(index);
        },
        itemCount: newsList.length,
      ),
    );
  }

  _RechargCard2(){
    return  SizedBox(
      height:MediaQuery.of(context).size.height/3.9,
      width:MediaQuery.of(context).size.width,
      child: GridView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:4,
          childAspectRatio: 0.9,
        ),
        itemBuilder:(context, index) {
          return newsCard2(index);
        },
        itemCount: newsList2.length,
      ),
    );
  }

  _CarouselSlider(){
    return  Padding(
      padding: EdgeInsets.only(
          top: 18, bottom: 18, left: 10, right: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration:
          Duration(milliseconds: 150),
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
          height: 180,
          onPageChanged: (position, reason) {
            setState(() {
              currentindex = position;
            });
            print(reason);
            print(
                CarouselPageChangedReason.controller);
          },
        ),
        items: getbannermodel?.data?.map((val) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(

                borderRadius:
                BorderRadius.circular(20)),
            // height: 180,
            // width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                borderRadius:
                BorderRadius.circular(20),
                child: Image.network(
                  "${val.image}",
                  fit: BoxFit.fill,
                )),
          );
        }).toList(),
      ),
    );

  }

}
