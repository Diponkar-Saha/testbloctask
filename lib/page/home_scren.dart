import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloctask/blocs/true/bloc/boolean_bloc.dart';
import 'package:testbloctask/model/search_response.dart';
import 'package:testbloctask/utils/util_color.dart';
import '../blocs/counter/bloc/counter_bloc.dart';

import '../blocs/search/search_bloc.dart';
import 'detail_screen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  final TextEditingController _qController = TextEditingController();

  SearchBloc searchBloc = SearchBloc();
  @override
  void initState() {
    _qController.addListener(() {
      searchBloc.add(GetSearchList(queryController: _qController));
    });


    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(


        body: Container(
          color: UtilColor.colorBackground,
          child: Column(


            children: [

              SizedBox(
                height: 20,
              ),
              _searchCustom(),
              Expanded(child: _buildListSearch(context)),


            ],
          ),
        )
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

            title: TextField(

              onChanged: (value)=>{


              },
              controller: _qController,
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

  Widget _buildListSearch(BuildContext context) {
    return Container(
      color: UtilColor.colorBackground,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocProvider(
          create: (_) => searchBloc ,
          child: BlocListener<SearchBloc, SearchState>(
            listener: (context, state) {
              if (state is SearchError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }else{

              }
            },
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return _buildLoading();
                } else if (state is SearchLoading) {
                  return _buildLoading();
                } else if (state is SearchLoaded) {
                  return _buildCard(context, state.searchModel);
                } else if (state is SearchError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, SearchResponse model) {

    return GridView.builder(


      itemCount: model.data.products.results.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            childAspectRatio: 1.5/ 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 16.0),
        itemBuilder: (BuildContext context, int index) {



          return MultiBlocProvider(
            providers: [
              BlocProvider(  create: (context) => BooleanBloc(),),
              BlocProvider(  create: (context) => CounterBloc(),)
            ],


            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child:InkWell(

                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen( ),
                      settings: RouteSettings(
                        arguments: model.data.products.results![index].slug,
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 100,
                        child: Center(
                          child:  Image.network("${model.data.products.results![index].image}",
                            fit: BoxFit.fitWidth,),
                        ),
                      ),



                      Expanded(child: Text(model.data.products.results![index].productName)),
                      Container(
                        padding: EdgeInsets.all(3),
                        child: Row(
                          children: [
                            Text("ক্রয় ${model.data.products.results![index].amount}",style: TextStyle(color: UtilColor.colorPriceText),),
                            Spacer(),
                            Text(' \৳10 ', style: TextStyle(fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                                color: UtilColor.colorPriceText),
                            ),
                          ],

                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        child: Row(
                          children: [
                            Text("বিক্রয় ${model.data.products.results![index].amount}",style: TextStyle(color: UtilColor.colorRemoveBikroy),),


                            Spacer(),
                            Text('লাভ \৳10 ', style: TextStyle(fontSize: 12, color: UtilColor.colorRemoveBikroy),
                            ),
                          ],

                        ),
                      ),


                      BlocBuilder<BooleanBloc, BooleanState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              if (state.count == true) ...[
                                icon(context),

                              ] else ...[
                                _buildCounter(context),

                              ],
                            ],
                          );
                        },
                      ),

                    ],
                  ),
                ),
              )
            ),
          );
        },

    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildCounter(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      child: Card(
        color: UtilColor.colorCartBackground,
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      //set border radius more than 50% of height and width to make circle
    ),
        child: Row(
          children: [
            Expanded(
              child: RawMaterialButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Decrement());
                },
                elevation: 2.0,
                fillColor: UtilColor.colorRemoveBackground,
                child: Icon(
                  Icons.remove,size: 15.0,color: UtilColor.colorWhite,
                ),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              ),
            ),

            BlocBuilder<CounterBloc, CounterState>(

              builder: (context, state) {
                return Container(
                  padding: EdgeInsets.only(left: 0),
                  height: 10,
                  width: 10,
                  child: Text(
                    '${state.count}  পিস',
                    style: const TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontSize: 10
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: RawMaterialButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Increment());
                },
                elevation: 2.0,
                fillColor: UtilColor.colorCart,
                child: Icon(
                  Icons.add,size: 15.0,color: UtilColor.colorWhite,
                ),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
                ))

          ],
        ),
      ),
    );
  }
  Widget icon(BuildContext context) {

    return RawMaterialButton(
      onPressed: () {
        context.read<BooleanBloc>().add(False());
      },
      elevation: 2.0,
      fillColor: UtilColor.colorCart,
      child: Icon(
        Icons.add,
        size: 15.0,
        color: UtilColor.colorWhite,
      ),
      padding: EdgeInsets.all(10.0),
      shape: CircleBorder(),
    );

  }
}


