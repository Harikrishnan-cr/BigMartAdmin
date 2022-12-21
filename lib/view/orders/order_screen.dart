



import 'dart:developer';

import 'package:bigmart_admin/controller/order%20provider/orders_provider.dart';
import 'package:bigmart_admin/view/orders/order%20widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OrderScreenAdmin extends StatelessWidget {
  const OrderScreenAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  
    
      final orderProvider = Provider.of<OrderProvider>(context,listen: false);  
    orderProvider.fetchProducts(); 

   log( orderProvider.getOrderProductList.length.toString());          
    return Scaffold(      
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, _) {  
          final data = orderProvider.getOrderProductList;
          return ListView( 
            children: List.generate(orderProvider.getOrderProductList.length, (index) => OrderWidgetAdmin(adminOrderData:data[index],)), 
          );
        }
      ),
    );
  }
}