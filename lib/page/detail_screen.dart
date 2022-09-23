import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:testbloctask/blocs/productt/product_bloc.dart';
import 'package:testbloctask/model/product_response.dart';
import 'package:testbloctask/page/cart_screen.dart';

import '../utils/util_color.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body:  _buildListCovid(context)),

    );

  }
  Widget _buildListCovid(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as String;


    return BlocProvider(
      create: (context) => ProductBloc(

      )..add(GetProductList(slug: todo)) ,
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!,style: TextStyle(color: Colors.green)),
              ),
            );
          }
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              return _buildLoading();
            } else if (state is ProductLoading) {
              return _buildLoading();
            } else if (state is ProductLoaded) {

              return _buildCard(context, state.productModel);
            } else if (state is ProductError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),

    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
  Widget _buildCard(BuildContext context, ProductResponse model) {
    return Container(
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
                            text: "প্রোডাক্ট ডিটেইল",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)
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
                    borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )
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
                settings: RouteSettings(
                arguments: model,
                ),),);

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



            Html(
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
            ),

          ],
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

class CirclePainter extends CustomPainter {
  final _paint = Paint()
    ..color = UtilColor.colorPriceText
    ..strokeWidth = 2
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
