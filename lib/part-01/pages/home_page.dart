

import 'package:api_practice/part-01/pages/showdata.dart';
import 'package:api_practice/part-01/service/service_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


ServiceController serviceController=ServiceController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: serviceController.getEcommerceApi(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                // print(snapshot.data!.length);
                  return Showdata(juelarymodel: snapshot.data![index]);
                });
          }
          else if(snapshot.hasError){
            return Center(
              child: Text("Data not fourd"),
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
