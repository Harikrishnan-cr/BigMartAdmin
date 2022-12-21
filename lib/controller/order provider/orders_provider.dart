import 'dart:developer';

import 'package:bigmart_admin/model/admin%20order%20model/admin_order.dart';
import 'package:bigmart_admin/view/orders/order_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier {
   List<AdminOrdersProductModel> _orderProductsList = [];

  List<AdminOrdersProductModel> get getOrderProductList {
    return _orderProductsList;
  }

  Future<void> fetchProducts() async {
   
    await FirebaseFirestore.instance
        .collection('orders').orderBy('orderDate',descending: false)  
        .get()
        .then((QuerySnapshot productsSnapshot) {
          _orderProductsList.clear();     
      for (var data in productsSnapshot.docs) {
     
        log(data.get('productName'));       
        _orderProductsList.insert(       
            0,  
            AdminOrdersProductModel(
              orderDate: data.get('orderDate'), 
              paymentType: data.get('payment-type'), 
                addressOne: data.get('addressOne'),
                addressTwo: data.get('addressTwo'),
                houseName: data.get('houseName'),
                imgUrl: data.get('imgUrl'),
                noOfProducts: data.get('noOfProducts'),
                orderId: data.get('orderId'),
                pinCode: data.get('pinCode'),
                price: data.get('price'),
                productId: data.get('productId'),
                productName: data.get('productName'),
                productQuantity: data.get('productQuantity'),
                status: data.get('status'),
                totalPrice: data.get('totalPrice'),
                userId: data.get('userId'),
                userName: data.get('userName'),
                userPhone: data.get('userPhone'))
            // ProductModel(
            //     id: data.get('id'),
            //     categories: data.get('category'),
            //     description: data.get('description'),
            //     discount: int.parse(data.get('discount')),
            //     discountPrice:int.parse(data.get('price')) -  (int.parse(data.get('price')) * int.parse(data.get('discount'))/100),
            //     imgUrl: data.get('imgUrl'),
            //     price: int.parse(data.get('price')),
            //     title: data.get('title'))

            );
      }
    });
  }
}
