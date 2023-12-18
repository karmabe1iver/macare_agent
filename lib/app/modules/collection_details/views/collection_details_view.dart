import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:macare_agent/app/data/model/laboratory_model.dart';
import 'package:macare_agent/app/utils/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app.dart';
import '../controllers/collection_details_controller.dart';

class CollectionDetailsView extends GetView<CollectionDetailsController> {
  const CollectionDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime initial=DateTime.parse(controller.argument.value.laboratoryBookingDate);
    DateFormat formattedDate = DateFormat('dd/MM/yyyy');
    String date= formattedDate.format(initial);
    Get.lazyPut(() => CollectionDetailsController());

    return Scaffold(
        bottomNavigationBar: _bottomBar(controller.argument.value),
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
              child: RefreshIndicator(
                onRefresh: () async{  },
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
                              controller.argument.value!.customerNameForCollection!.isNotEmpty?
                              Text(
                                controller.argument.value!.customerNameForCollection.toString(),
                                style: MyTheme.outfit(
                                    fontWeight: FontWeight.w500,
                                    textSize: Get.height * .016),
                              ):const SizedBox(),
                              controller.argument.value!.customerAddressForCollection!.isNotEmpty?
                              Text(
                                controller.argument.value!.customerAddressForCollection.toString(),
                                style: MyTheme.outfit(
                                    fontWeight: FontWeight.w400,
                                    textSize: Get.height * .016,
                                    color: MyTheme.smallFontColor),
                              ):const SizedBox(),
                              controller.argument.value!.customerEmailForCollection!.isNotEmpty?
                              Text(
                                controller.argument.value!.customerEmailForCollection.toString(),
                                style: MyTheme.outfit(
                                    fontWeight: FontWeight.w400,
                                    textSize: Get.height * .016,
                                    color: MyTheme.smallFontColor),
                              ):const SizedBox(),
                              controller.argument.value!.customerPhoneForCollection!.isNotEmpty?
                              Text(
                                controller.argument.value!.customerPhoneForCollection.toString(),
                                style: MyTheme.outfit(
                                    fontWeight: FontWeight.w500,
                                    textSize: Get.height * .016,
                                    color: MyTheme.phoneNumberTextColor),
                              ):const SizedBox(),
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
                              controller.argument.value!.customerNameBookedBy!.isNotEmpty?
                              Text(controller.argument.value!.customerNameBookedBy.toString(),
                                  style: MyTheme.outfit(
                                    fontWeight: FontWeight.w500,
                                    textSize: Get.height * .018,
                                  )):const SizedBox(),
                              controller.argument.value!.customerAddressBookedBy!.isNotEmpty?
                              Text(
                                controller.argument.value!.customerAddressBookedBy.toString(),
                                style: _addressStyle(),
                              ):const SizedBox(),
                              controller.argument.value!.customerEmailBookedBy!.isNotEmpty?
                              Text(
                                controller.argument.value!.customerEmailBookedBy.toString(),
                                style: _addressStyle(),
                              ):const SizedBox(),
                              //Text('Pin:637006', style: _addressStyle()),
                              // SizedBox(
                              //   height: 8,
                              //   width: Get.width,
                              // ),
                              controller.argument.value!.customerPhoneBookedBy!.isNotEmpty?
                              Text(
                                controller.argument.value!.customerPhoneBookedBy.toString(),
                                style: MyTheme.outfit(
                                    fontWeight: FontWeight.w500,
                                    textSize: Get.height * .015,
                                    color: MyTheme.phoneNumberTextColor),
                              ):const SizedBox(),
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
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
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
                          'LABORATORY',
                          style: MyTheme.outfit(
                              fontWeight: FontWeight.w500,
                              textSize: Get.height * .018),
                        ),
                        SizedBox(
                          height: 8,
                          width: Get.width,
                        ),
                        Text(controller.argument.value!.laboratoryName.toString(),
                            style: MyTheme.outfit(
                              fontWeight: FontWeight.w500,
                              textSize: Get.height * .018,
                            )),
                        Text(
                          controller.argument.value!.laboratoryAddress.toString(),
                          style: MyTheme.outfit(
                              fontWeight: FontWeight.w400,
                              textSize: Get.height * .018,
                              color: MyTheme.smallFontColor),
                        ),
                        Text(
                          controller.argument.value!.laboratoryContact.toString(),
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
                              color: MyTheme.smallFontColor),
                        ),
                        Text(
                          'Blood sample collection',
                          style: MyTheme.outfit(
                              fontWeight: FontWeight.w400,
                              textSize: Get.height * .018,
                              color: MyTheme.smallFontColor),
                        ),
                        Text(
                          'Blood sample collection',
                          style: MyTheme.outfit(
                              fontWeight: FontWeight.w400,
                              textSize: Get.height * .018,
                              color: MyTheme.smallFontColor),
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
                          controller.argument.value!.laboratoryBookingTime.toString(),
                          style: MyTheme.outfit(
                              fontWeight: FontWeight.w400,
                              textSize: Get.height * .018,
                              color: MyTheme.phoneNumberTextColor),
                        ),
                        Text(
                          date.toString(),
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
        color: MyTheme.smallFontColor);
  }

  Widget _bottomBar(LaboratoryResponseModel argument) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 49,
              width: Get.width / 2.4,
              child: TextButton(
                  onPressed: () {
                    openMaps(double.parse(controller.argument.value.customerLatitude), double.parse(controller.argument.value.customerLongitude));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyTheme.appBarColor),
                  ),
                  child: Text(
                    'SHOW DIRECTION',
                    style: TextStyle(
                        color: Colors.white, fontSize: Get.height * .018),
                  )),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 49,
              width: Get.width / 2.4,
              child: TextButton(
                  onPressed: () {
                     // Get.toNamed(Routes.ADD_TEST);

                    String status="Booking Proccessed";
                     controller.statusFetchData(bookingReference: argument.bRef,
                         bookingAllocationStatus: status,
                         bookingStatus: status,
                         empReference: App.employeereference,  );


                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyTheme.buttonColor),
                  ),
                  child: Text(
                    'REACHED',
                    style: TextStyle(
                        color: Colors.white, fontSize: Get.height * .018),
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
  }}
