import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/collection_details_controller.dart';

class CollectionDetailsView extends GetView<CollectionDetailsController> {
  const CollectionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: Get.height/5,
        width: Get.width,
        child: Row(
          children: [
            IconButton(onPressed: () {  }, icon: Icon(CupertinoIcons.left_chevron,color: Colors.white,size: 20 ,),),
            Text('COLLECTION DETAILS',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
          ],
        ),
        
      )
    );
  }
}
