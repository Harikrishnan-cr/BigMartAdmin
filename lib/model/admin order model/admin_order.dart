import 'package:cloud_firestore/cloud_firestore.dart';

class AdminOrdersProductModel {
  String orderId;
  String userId;
  String productId;
  String imgUrl;
  String userName;
  String houseName;
  String addressOne;
  String addressTwo;
  String paymentType;
  String status;
  Timestamp orderDate;
  String productName;
  int pinCode;
  int userPhone;
  num price; 
  num totalPrice;
  int noOfProducts;
  int productQuantity;
  AdminOrdersProductModel(
      {required this.addressOne,
      required this.paymentType,
      required this.addressTwo,
      required this.orderDate,
      required this.houseName,
      required this.imgUrl,
      required this.noOfProducts,
      required this.orderId,
      required this.pinCode,
      required this.price,
      required this.productId,
      required this.productName,
      required this.productQuantity,
      required this.status,
      required this.totalPrice,
      required this.userId,
      required this.userName,
      required this.userPhone});
}


  //  'orderId': orderId,
  //                       'userId': userId.uid,
  //                       'productId': value.productId,
  //                       'imgUrl': items.imgUrl,
  //                       'userName': userName,
  //                       'houseName':addressModel.houseName,
  //                       'addressOne':addressModel.adressLineOne,       
  //                       'addressTwo':addressModel.adressLineTwo,
  //                       'pinCode':addressModel.pincode,
  //                       'userPhone':addressModel.phoneNumber,        
  //                       'price': items.discountPrice,
  //                       'status': 'orderd',
  //                       'productName':items.title, 
  //                       'totalPrice': totalPrice,
  //                       'noOfProducts': cartCount,
  //                       'productQuantity': value.productQuantity,
  //                       'orderDate': DateTime.now()