import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:macare_agent/app/utils/my_theme.dart';

import '../controllers/collection_details_controller.dart';

class CollectionDetailsView extends GetView<CollectionDetailsController> {
  const CollectionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            height: Get.height/7.5,
            width: Get.width,
            color: MyTheme.appBarColor,
            child: Row(
              children: [
                IconButton(onPressed: () {  }, icon: Icon(CupertinoIcons.left_chevron,color: Colors.white,size: 20 ,),),
                Text('COLLECTION DETAILS',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),)
              ],
            ),

          ),
          Container(
              child: Column(
                children: [SizedBox(height: 18,width: Get.width,),
                  Text('COLLECTION ADDRESS',style: MyTheme.outfit(fontWeight: FontWeight.w500)),
                  Text('7012913930'),
                  Text('Kolathara'),
                  Text('test@g.com'),
                  Text('7012913930'),
                  Text('BOOKED BY'),
                  Text('Amar shankar'),
                  Text('Calicut,Kollathara'),
                  Text('Marakan kadav paramb'),
                  Text('Pin:637006'),
                  Text('7012913930'),
                ],
              ),
            ),

        ],
      )
    );
  }
}
