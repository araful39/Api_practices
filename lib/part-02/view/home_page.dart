import 'package:api_practice/part-02/model/product_model.dart';
import 'package:api_practice/part-02/services/api_services.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _seachController=TextEditingController();

  @override
  void initState() {
    super.initState();
    ApiService().getProduct();

  }

  List<ProductListModel> newList=[];
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    // print(apiList2.length);
    return Scaffold(
        appBar: AppBar(
          title:TextField(
            controller: _seachController,
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            // onChanged: filterSearchResults,
          ),
        ),
        body:
        // Text("")


        FutureBuilder(
            future: apiService.getProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductListModel> apiList=snapshot.data ?? [];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: apiList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 200,
                          width: 200,
                          child: Card(
                            child: Column(
                              children: [
                                Card(
                                  color: Colors.grey,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          "Product Name : ${snapshot.data![index].name.toString()}"),
                                      Text(
                                          "Product ID : ${snapshot.data![index].id.toString()}")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CachedNetworkImage(
                                  height: 120,
                                  width: 120,
                                  imageUrl: apiList[index].image.toString(),
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Center(child: Text("Not availeble")),
                                ),

                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        "Udate: ${snapshot.data![index].updatedAt.toString()}"),
                                    Text(
                                        "Creat Data ${snapshot.data![index].creationAt.toString()}")
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.hasError}");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));

  }
}
