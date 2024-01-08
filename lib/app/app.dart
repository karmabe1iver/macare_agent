import 'package:macare_agent/app/utils/local_store.dart';

abstract class App{
  static String token =LocalStore.getData("accessToken")??"";
  //static String employeeReferences =
  static String employeereference =LocalStore.getData("employeeReference")??"";

  static String bookingReference ='';
  static String laboratoryReference="";
  static String id="";
  static bool paymentType=false;

  static bool deliverytype=false;
  static String employeename =LocalStore.getData("employeeName")??"";
  static String totalfeeee ='';
  static String subtotalFee ='';
  static String fcmToken ='';


  static String agentUpdateReference ='';



}