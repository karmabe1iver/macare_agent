abstract class ApiPaths{
  //static String baseUrl = 'http://192.168.29.160:8000/api/v1/';
  static String baseUrl = 'https://service-macare.tequevia.com/api/v1/';
  //static String generalUrl =  'http://192.168.29.160:8000/api/v1/general/';
  static String generalUrl =  'https://service-macare.tequevia.com/api/v1/general/';


  static String stafflogin = 'staff-login/';

  static String laboratoryUrl = 'laboratory/laboratory-booking-agent-fetch/';
  static String deliveryUrl = 'pharmacy/get-allocation-for-agent/';
  static String deliveryAcceptRejectCondition1Url = 'pharmacy/prescription-agent-updates/';
  static String deliveryAcceptRejectCondition2Url = 'pharmacy/delivery-agent-updates/';
  static String laboratoryAcceptUrl = "laboratory/agent-accept-request/";
  static String laboratoryRejectUrl = "laboratory/laboratory-allocation-agent-reject/";
  static String addTestUrl = "laboratory/laboratory-booking-test-allocation/";
  static String addTestStatusUrl = "laboratory/collection-agent-status-update/";
  static String searchUrl = "laboratory/search-laboratory-price-list/";
  static String addSelectedTestUrl = "laboratory/laboratory-booking-test-allocation/";
  static String deliveryDetailscondition1Url = "pharmacy/prescription-agent-updates/";
  static String deliveryDetailscondition2Url = "pharmacy/delivery-agent-updates/";
  static String paymentcondition1Url = "pharmacy/prescription-agent-updates/";
  static String paymentcondition2Url = "pharmacy/delivery-agent-updates/";
  static String historyUrl = "laboratory/agent-history/";
  static String deletedUrl = "laboratory/laboratory-booking-test-allocation/";
  static String checkoutUrl = "laboratory/collection-agent-status-update/";
  static String laboratoryPaymentUrl = "laboratory/collection-agent-status-update/";



}