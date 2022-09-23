import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../model/product_response.dart';
import '../utils/util_color.dart';
import 'detail_screen.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as ProductResponse;
    return SafeArea(
      child: Scaffold(
          body: _buildCard(context,todo)),

    );

  }



  Widget _buildCard(BuildContext context, ProductResponse model) {
    return SingleChildScrollView(
      child: Container(
        color: UtilColor.colorBackground,

        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.all(8),
                child: Row(

                  children: [
                    RichText(
                      text: TextSpan(
                        children: [

                          WidgetSpan(
                            child: Icon(Icons.arrow_back_rounded, size: 20),
                          ),
                          TextSpan(
                              text: "প্রোডাক্ট ডিটেইল",style: TextStyle(fontSize: 20,color: Colors.black)
                          ),
                        ],
                      ),
                    ),
                    Spacer()
                  ],

                ),
              ),


              _searchCustom(),

              Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    color: Colors.white,
                    child: Container(
                      height: 180,
                      width: 50,
                    ),
                  ),
                  Spacer(),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 200,
                        width: 200,
                        child: Image.network("${model.data?.image}"),
                      ),
                    ),
                  ),
                  Spacer(),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    color: Colors.white,
                    child: Container(
                      height: 180,
                      width: 50,
                    ),
                  ),
                ],

              ),


              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(child: Text("${model.data?.productName}",style: TextStyle(color: Colors.black,fontSize: 20)),),

                    Spacer()

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text("ব্রান্ডঃ প্রিঞ্জেলস",style: TextStyle(color: Colors.black)),

                    Spacer(),
                    _buildCircle(context),


                    Spacer(),
                    Text("ডিস্ট্রিবিউটরঃ মোঃ মোবারাক হোসেন",style: TextStyle(color: Colors.black)),
                    Spacer(),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(8),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(

                      children: [
                        Row(
                          children: [
                            Text("ক্রয়মূল্যঃ",style: TextStyle(color: UtilColor.colorPriceText)),
                            Spacer(),
                            Text(' \৳10 ', style: TextStyle(fontSize: 12,

                                color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("বিক্রয়মূল্যঃ",style: TextStyle(color: Colors.black)),
                            Spacer(),
                            Text(' \৳10 ', style: TextStyle(fontSize: 12,

                                color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: List.generate(150~/2, (index) => Expanded(
                            child: Container(
                              color: index%2==0?Colors.transparent
                                  :Colors.grey,
                              height: 2,
                            ),
                          )),
                        ),
                        Row(
                          children: [
                            Text("লাভঃ",style: TextStyle(color: Colors.black)),
                            Spacer(),
                            Text(' \৳10 ', style: TextStyle(fontSize: 12,

                                color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),

              ),







              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),

                    ),
                  );

                },
                child: ClipPath(
                  child: Container(
                    height: 80,
                    width: 80,
                    color: UtilColor.colorCart,
                    child: Center(
                      child: Text("এটিক\nকিনুন",style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  clipper: _Hexagon(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text("বিস্তারিত",style: TextStyle(color: Colors.black)),
                    Spacer()
                  ],

                ),
              ),

              Expanded(child:  Html(
                data: "${model.data?.description}",
                tagsList: Html.tags,
                style: {
                  "table": Style(
                    backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                  ),
                  "tr": Style(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  "th": Style(
                    padding: EdgeInsets.all(6),
                    backgroundColor: Colors.grey,
                  ),
                  "td": Style(
                    padding: EdgeInsets.all(6),
                    alignment: Alignment.topLeft,
                  ),
                  'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                },
              ),)




            ],
          ),
        ),
      ),
    );



  }

  Widget _searchCustom() {
    return Container(
      color: UtilColor.colorBackground,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            //set border radius more than 50% of height and width to make circle
          ),
          child: ListTile(

            title: const TextField(

              decoration: InputDecoration(
                hintText: 'কাঙ্ক্ষিত পণ্যটি খুঁজুন',
                border: InputBorder.none,
              ),

            ),
            trailing: IconButton(
              icon: Icon(Icons.search, color: Colors.grey),
              onPressed: () {

              },
            ),
          ),

        ),
      ),
    );
  }



}
Widget _buildCircle(BuildContext context) {
  return CustomPaint(
    size: Size(10, 10),
    painter: CirclePainter(),
  );
}

class _Hexagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.25, 0);
    path.lineTo(size.width * 0.75, 0);
    path.lineTo(size.width, size.height * sqrt(3) / 4);

    path.lineTo(size.width * 0.75, size.height * sqrt(3) / 2);
    path.lineTo(size.width * 0.25, size.height * sqrt(3) / 2);
    path.lineTo(0, size.height * sqrt(3) / 4);
    path.lineTo(size.width * 0.25 , 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      false;
}
