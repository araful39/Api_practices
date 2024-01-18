

import 'package:api_practice/part-01/color/color.dart';
import 'package:api_practice/part-01/model.dart';
import 'package:flutter/cupertino.dart';

class Showdata extends StatelessWidget {
  final JuelaryModel juelarymodel;
  const Showdata({super.key, required this.juelarymodel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 50,
        color: AppColor.privetColor,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(juelarymodel.image.toString(),height: 100,width: 100,),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50,),
                Text(juelarymodel.id.toString()),
                SizedBox(width: 50,),
                Expanded(child: Text(juelarymodel.title.toString()))
              ],
            ),

          ],
        ),
      ),
    );
  }
}

