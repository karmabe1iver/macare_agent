import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/my_theme.dart';
import '../controllers/delivery_details_controller.dart';

class DeliveryDetailsView extends GetView<DeliveryDetailsController> {
  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => DeliveryDetailsController());
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * .2,
            width: Get.width,
            color: MyTheme.appBarColor,
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 9.0, left: 10, top: 28),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
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
                    'DELIVERY DETAILS',
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
            child: RefreshIndicator(
              onRefresh: () async {},
              child: Obx(
                () => ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: Get.height * .007,
                      width: Get.width,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('DELIVERY ADDRESS',
                          style: MyTheme.outfit(fontWeight: FontWeight.w500)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   '7012913930',
                                //   style: MyTheme.outfit(
                                //       fontWeight: FontWeight.w500,
                                //       textSize: Get.height * .016),
                                // ),
                                //  SizedBox(
                                //   height: 8,
                                //   width: Get.width,
                                // ),
                                Text(
                                  controller.argument.value!.deliveryDetails!
                                      .first.customerAddress
                                      .toString(),
                                  style: MyTheme.outfit(
                                      fontWeight: FontWeight.w400,
                                      textSize: Get.height * .016,
                                      color: MyTheme.textColor),
                                ),
                                SizedBox(
                                  height: 5,
                                  width: Get.width,
                                ),
                                // Text(
                                //   'test@g.com',
                                //   style: MyTheme.outfit(
                                //       fontWeight: FontWeight.w400,
                                //       textSize: Get.height * .016,
                                //       color: MyTheme.textColor),
                                // ),
                                SizedBox(
                                  height: 8,
                                  width: Get.width,
                                ),
                                Text(
                                  controller.argument.value!.deliveryDetails!
                                      .first.customerPhone
                                      .toString(),
                                  style: MyTheme.outfit(
                                      fontWeight: FontWeight.w500,
                                      textSize: Get.height * .016,
                                      color: MyTheme.phoneNumberTextColor),
                                ),
                                // SizedBox(
                                //   height: 8,
                                //   width: Get.width,
                                // ),
                                // Text('BOOKED BY',
                                //     style: MyTheme.outfit(
                                //       fontWeight: FontWeight.w500,
                                //       textSize: Get.height * .020,
                                //     )),
                                SizedBox(
                                  height: 8,
                                  width: Get.width,
                                ),
                                Text(
                                    controller.argument.value!.deliveryDetails!
                                        .first.customerName
                                        .toString(),
                                    style: MyTheme.outfit(
                                      fontWeight: FontWeight.w500,
                                      textSize: Get.height * .018,
                                    )),
                                SizedBox(
                                  height: 8,
                                  width: Get.width,
                                ),
                                Text(
                                  controller.argument.value!.deliveryDetails!
                                      .first.customerAddress
                                      .toString(),
                                  style: _addressStyle(),
                                ),
                                // Text(
                                //   'Marakan kadav paramb',
                                //   style: _addressStyle(),
                                // ),
                                // Text('Pin:637006', style: _addressStyle()),
                                // SizedBox(
                                //   height: 8,
                                //   width: Get.width,
                                // ),
                                Text(
                                  controller.argument.value!.deliveryDetails!
                                      .first.customerPhone
                                      .toString(),
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
                            'SELLER INFO',
                            style: MyTheme.outfit(
                                fontWeight: FontWeight.w500,
                                textSize: Get.height * .018),
                          ),
                          SizedBox(
                            height: 8,
                            width: Get.width,
                          ),
                          Text(
                              controller
                                  .argument
                                  .value.pharmacyInfo!.first.branchName.toString(),
                              style: MyTheme.outfit(
                                  //fontWeight: FontWeight.w500,
                                  textSize: Get.height * .018,
                                  color: MyTheme.smallFontColor)),
                          // Text(
                          //   'Kaloor,Kochin',
                          //   style: MyTheme.outfit(
                          //       fontWeight: FontWeight.w400,
                          //       textSize: Get.height * .018,
                          //       color: MyTheme.textColor),
                          // ),
                          // Text(
                          //   '18001211135',
                          //   style: MyTheme.outfit(
                          //       fontWeight: FontWeight.w500,
                          //       textSize: Get.height * .018,
                          //       color: MyTheme.phoneNumberTextColor),
                          // ),
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
                            'ORDER DATE AND AMOUNT',
                            style: MyTheme.outfit(
                                fontWeight: FontWeight.w500,
                                textSize: Get.height * .018),
                          ),
                          SizedBox(
                            height: 8,
                            width: Get.width,
                          ),
                          Row(
                            children: [
                              Text(
                                controller.argument.value.orderDate.toString(),
                                style: MyTheme.outfit(
                                    fontWeight: FontWeight.w400,
                                    textSize: Get.height * .018,
                                    color: MyTheme.numbersColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                controller.argument.value.orderAmount
                                    .toString(),
                                style: MyTheme.outfit(
                                    fontWeight: FontWeight.w400,
                                    textSize: Get.height * .038,
                                    color: MyTheme.numbersColor),
                              ),
                            ],
                          ),

                          // Text(
                          //   'Blood sample collection',
                          //   style: MyTheme.outfit(
                          //       fontWeight: FontWeight.w400,
                          //       textSize: Get.height * .018,
                          //       color: MyTheme.textColor),
                          // ),
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
                            'ORDER ITEMS',
                            style: MyTheme.outfit(
                                fontWeight: FontWeight.w500,
                                textSize: Get.height * .018),
                          ),
                          SizedBox(
                            height: Get.height * .018,
                            width: Get.width,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: 0,
                                minWidth: 0,
                                maxHeight: Get.height),
                            child: ListView.builder(
                                itemCount: controller
                                    .argument.value.orderItems!.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(children: [
                                    Container(
                                      height: 80,
                                      width: 60,
                                      child: Image.network(controller.argument
                                          .value.orderItems![index].productImage
                                          .toString()),
                                    ),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.argument.value
                                              .orderItems![index].productName
                                              .toString(),
                                          style: MyTheme.outfit(
                                            fontWeight: FontWeight.w500,
                                            textSize: Get.height * .018,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              color:
                                                  MyTheme.phoneNumberTextColor,
                                              size: Get.height * .018,
                                            ),
                                            Text(
                                              controller
                                                  .argument
                                                  .value
                                                  .orderItems![index]
                                                  .productPrice
                                                  .toString(),
                                              style: MyTheme.outfit(
                                                  fontWeight: FontWeight.w400,
                                                  textSize: Get.height * .018,
                                                  color: MyTheme
                                                      .phoneNumberTextColor),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          controller
                                              .argument
                                              .value
                                              .orderItems![index]
                                              .manufacturerName
                                              .toString(),
                                          style: MyTheme.outfit(
                                              fontWeight: FontWeight.w400,
                                              textSize: Get.height * .018,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ]);
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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
                  onPressed: () {
                    openMaps(double.parse(controller.argument.value.deliveryDetails!.first.customerLatitude), double.parse(controller.argument.value.deliveryDetails!.first.customerLongitude));

                     controller.showdirectionFetchData(allocationReferrence: controller
                         .argument.value!.allocationReference
                         .toString(), deliveryType: controller.argument.value.type.toString(), orderReference: controller.argument.value.orderReference
                         .toString());

                  },
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
                    controller.deliveryDetailsFetchData(
                        allocationReferrence: controller
                            .argument.value!.allocationReference
                            .toString(),
                        deliveryType: controller.argument.value.type.toString(),
                        orderReference: controller.argument.value.orderReference
                            .toString());
                    Get.toNamed(Routes.PAYMENT,arguments: controller.argument);
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
  void openMaps(double latitude, double longitude) async {
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      throw 'Could not open the map.';
    }
  }


}
