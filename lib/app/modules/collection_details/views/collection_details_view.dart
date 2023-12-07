import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:macare_agent/app/utils/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../controllers/collection_details_controller.dart';

class CollectionDetailsView extends GetView<CollectionDetailsController> {
  const CollectionDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CollectionDetailsController());
    return Scaffold(
        bottomNavigationBar: _bottomBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height / 7,
              width: Get.width,
              color: MyTheme.appBarColor,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 9.0, left: 10,top: 28),
                    child: IconButton(
                      onPressed: () {Get.back();},
                      icon: const Icon(
                        CupertinoIcons.left_chevron,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'COLLECTION DETAILS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.height * .025,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                  children: [
                SizedBox(
                  height: Get.height * .007,
                  width: Get.width,
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Text('COLLECTION ADDRESS',
                      style: MyTheme.outfit(fontWeight: FontWeight.w500)),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '7012913930',
                              style: MyTheme.outfit(
                                  fontWeight: FontWeight.w500,
                                  textSize: Get.height * .016),
                            ),
                            SizedBox(
                              height: 8,
                              width: Get.width,
                            ),
                            Text(
                              'Kolathara',
                              style: MyTheme.outfit(
                                  fontWeight: FontWeight.w400,
                                  textSize: Get.height * .016,
                                  color: MyTheme.textColor),
                            ),
                            SizedBox(
                              height: 8,
                              width: Get.width,
                            ),
                            Text(
                              'test@g.com',
                              style: MyTheme.outfit(
                                  fontWeight: FontWeight.w400,
                                  textSize: Get.height * .016,
                                  color: MyTheme.textColor),
                            ),
                            SizedBox(
                              height: 8,
                              width: Get.width,
                            ),
                            Text(
                              '7012913930',
                              style: MyTheme.outfit(
                                  fontWeight: FontWeight.w500,
                                  textSize: Get.height * .016,
                                  color: MyTheme.phoneNumberTextColor),
                            ),
                            SizedBox(
                              height: 8,
                              width: Get.width,
                            ),
                            Text('BOOKED BY',
                                style: MyTheme.outfit(
                                  fontWeight: FontWeight.w500,
                                  textSize: Get.height * .020,
                                )),
                            SizedBox(
                              height: 8,
                              width: Get.width,
                            ),
                            Text('Amar shankar',
                                style: MyTheme.outfit(
                                  fontWeight: FontWeight.w500,
                                  textSize: Get.height * .018,
                                )),
                            SizedBox(
                              height: 8,
                              width: Get.width,
                            ),
                            Text(
                              'Calicut,Kollathara',
                              style: _addressStyle(),
                            ),
                            Text(
                              'Marakan kadav paramb',
                              style: _addressStyle(),
                            ),
                            Text('Pin:637006', style: _addressStyle()),
                            SizedBox(
                              height: 8,
                              width: Get.width,
                            ),
                            Text(
                              '7012913930',
                              style: MyTheme.outfit(
                                  fontWeight: FontWeight.w500,
                                  textSize: Get.height * .015,
                                  color: MyTheme.phoneNumberTextColor),
                            ),
                            SizedBox(
                              height: 10,
                              width: Get.width,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * .20,
                          ),
                          InkWell(
                            onTap: controller.makePhoneCall,
                            child: Container(
                              width: 43.0,
                              height: 43.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: MyTheme.buttonColor,
                              ),
                              child: const Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                  width: Get.width,
                  child: Container(
                    color: MyTheme.dividerColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LABORATORY',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w500,
                            textSize: Get.height * .018),
                      ),
                      SizedBox(
                        height: 8,
                        width: Get.width,
                      ),
                      Text('Macare Diagno Center Kaloor',
                          style: MyTheme.outfit(
                            fontWeight: FontWeight.w500,
                            textSize: Get.height * .018,
                          )),
                      Text(
                        'Kaloor,Kochin',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w400,
                            textSize: Get.height * .018,
                            color: MyTheme.textColor),
                      ),
                      Text(
                        '18001211135',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w500,
                            textSize: Get.height * .018,
                            color: MyTheme.phoneNumberTextColor),
                      ),
                      SizedBox(
                        height: 5,
                        width: Get.width,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                  width: Get.width,
                  child: Container(
                    color: MyTheme.dividerColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COLLECTION SAMPLES',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w500,
                            textSize: Get.height * .018),
                      ),
                      SizedBox(
                        height: 8,
                        width: Get.width,
                      ),
                      Text(
                        'Blood sample collection',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w400,
                            textSize: Get.height * .018,
                            color: MyTheme.textColor),
                      ),
                      Text(
                        'Blood sample collection',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w400,
                            textSize: Get.height * .018,
                            color: MyTheme.textColor),
                      ),
                      Text(
                        'Blood sample collection',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w400,
                            textSize: Get.height * .018,
                            color: MyTheme.textColor),
                      ),
                      SizedBox(
                        height: 5,
                        width: Get.width,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                  width: Get.width,
                  child: Container(
                    color: MyTheme.dividerColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COLLECTION DATE AND TIME',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w500,
                            textSize: Get.height * .018),
                      ),
                      SizedBox(
                        height: Get.height * .018,
                        width: Get.width,
                      ),
                      Text(
                        '2023-11-07',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w400,
                            textSize: Get.height * .018,
                            color: MyTheme.phoneNumberTextColor),
                      ),
                      Text(
                        '12.03AM',
                        style: MyTheme.outfit(
                            fontWeight: FontWeight.w400,
                            textSize: Get.height * .018,
                            color: MyTheme.phoneNumberTextColor),
                      ),
                      SizedBox(
                        height: 5,
                        width: Get.width,
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
    );
  }

  TextStyle _addressStyle() {
    return MyTheme.outfit(
        fontWeight: FontWeight.w400,
        textSize: Get.height * .016,
        color: MyTheme.textColor);
  }

  Widget _bottomBar() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 49,
              width: Get.width / 2.4,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'SHOW DIRECTION',
                    style: TextStyle(
                        color: Colors.white, fontSize: Get.height * .018),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyTheme.buttonColor),
                  )),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 49,
              width: Get.width / 2.4,
              child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.ADD_TEST);
                  },
                  child: Text(
                    'REACHED',
                    style: TextStyle(
                        color: Colors.white, fontSize: Get.height * .018),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyTheme.buttonColor),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
