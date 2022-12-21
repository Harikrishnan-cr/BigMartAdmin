import 'dart:developer';
import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/size/style_admin.dart';
import 'package:bigmart_admin/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:bigmart_admin/model/admin%20order%20model/admin_order.dart';
import 'package:bigmart_admin/view/orders/order_full_details/order_full_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class OrderWidgetAdmin extends StatelessWidget {
  const OrderWidgetAdmin({Key? key,required this.adminOrderData}) : super(key: key);

   
final AdminOrdersProductModel adminOrderData;  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrdersFullDetails(orderList: adminOrderData),)); 
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 15,
        ),
        child: Container(
          width: 150,
          height: 190,
          decoration: BoxDecoration(
            color: whiteColourAdmin,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   FancyShimmerImage(
                     width: 100,
                      height: 75,
                    imageUrl: adminOrderData.imgUrl, 
                   imageBuilder: (context, imageProvider) {
                     return  Container(
                     
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image:  DecorationImage( 
                              image: imageProvider,
                              fit: BoxFit.cover)),
                    );
                   },
                   ),
                    constHeight10,
                    constHeight10,
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 210,
                            child: Text(
                              adminOrderData.productName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: cardTextStyle(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 210,
                            child: Row(
                              children: [
                                Text(
                                  'Price : ₹',
                                  style: cardCurrencyTextStyle(),
                                ),
                                constWidth5,
                                Text(
                                  '${adminOrderData.price*adminOrderData.productQuantity}',
                                  style: cardRsTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                constHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text( 
                      'Qty : ${adminOrderData.productQuantity}',
                      style: const TextStyle( 
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 15),
                    ),
                    Text(
                      'user Name : ${adminOrderData.userName}',
                      style: cardTextStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
      
                    DropdownButtonExample(dropdownValue: adminOrderData.status,orderId: adminOrderData.orderId,)    
                    // CommonButtonScreen(
                    //     height: 30,
                    //     width: 90,
                    //     iconWidth: 5,
                    //     iconSize: 18,
                    //     textFunction: 'Cancel',
                    //     icon: Icons.delete_forever_sharp),
    
                  //  , CommonButtonScreen(
                  //       height: 30,
                  //       width: 90,
                  //       iconWidth: 5,
                  //       iconSize: 18,
                  //       textFunction: '   Ok',
                  //       icon: Icons.confirmation_num),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}














const List<String> list = <String>['orderd', 'Shipped', 'Deliverd'];  


// class DropdownButtonApp extends StatelessWidget {
//   const DropdownButtonApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('DropdownButton Sample')),
//         body: const Center(
//           child: DropdownButtonExample(),
//         ),
//       ),
//     );
//   }
// }

class DropdownButtonExample extends StatefulWidget {
   DropdownButtonExample({super.key,required this.dropdownValue,required this.orderId}); 

  String dropdownValue;
  final String orderId; 
  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
 

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      
      value: widget.dropdownValue, 
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,  
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {  
        log(value.toString());   
        // This is called when the user selects an item.
        FirebaseFirestore.instance
        .collection('orders').doc(widget.orderId).update({'status':value});   
        setState(() {
          widget.dropdownValue = value!; 
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
