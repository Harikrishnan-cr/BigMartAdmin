





import 'dart:developer';

import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/model/admin%20order%20model/admin_order.dart';

import 'package:flutter/material.dart';

class OrdersFullDetails extends StatelessWidget {
  OrdersFullDetails({Key? key, required this.orderList}) : super(key: key);
  final AdminOrdersProductModel orderList;
  late String dateOrdered;
  @override
  Widget build(BuildContext context) {
    final totalPrice = orderList.price * orderList.productQuantity;
    final date = orderList.orderDate.toDate();
    dateOrdered = '${date.day}/${date.month}/${date.year}';
    final orerid = orderList.orderId.toString();
     log('${dateOrdered}------------');     
    return Scaffold(
      appBar: AppBar(
          title:Text('#${orerid[3]}${orerid[4]}${orerid[5]}${orerid[6]}${orerid[7]}${orerid[8]}${orerid[3]}'),
              elevation: 0,
              centerTitle: true,
              backgroundColor: greenColourAdmin,
      ),

//       AppBar(
//         backgroundColor: Colors.blue[700],
//         title:  Text('#${orerid[3]}${orerid[4]}${orerid[5]}${orerid[6]}${orerid[7]}${orerid[8]}${orerid[3]}'),
//         centerTitle: true,
// //         actions: [
// //             IconButton(onPressed: () {
// // //               Navigator.of(context).push(MaterialPageRoute(builder: (ctx1){
// // // return const DukkanScreen();
// // //               }));
// //             }, icon: const Icon(Icons.keyboard_arrow_right_outlined) )
// //           ],
//       ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(dateOrdered.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400))
                      ],
                    ),
                    orderList.status == 'Deliverd'
                        ? Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: greenColourAdmin,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('Delivered',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w500))
                            ],
                          )
                        : Row(
                            children: [ 
                              Icon(
                                Icons.circle,
                                color: Colors.red,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(orderList.status.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w500))
                            ],
                          )
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                const Divider(
                  thickness: 1.3,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${orderList.productQuantity} Pack',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )
                      ],
                    ),
  //                   Row(
  //                     children: [
  //                       Icon(
  //                         Icons.receipt_long_sharp,
  //                         color: Colors.blue[700],
  //                       ),
  //                       const SizedBox(
  //                         width: 10,
  //                       ),
  //                       GestureDetector(
  //                         onTap: () async{
  //                           log('recipt'); 

                       




  // // final pdf = pw.Document();

  // // pdf.addPage(
  // //   pw.Page(
  // //     build: (pw.Context context) => pw.Center(
  // //       child: pw.Text('Hello World!'),
  // //     ),
  // //   ),
  // // );

  // // final file = File('example.pdf'); 
  // // await file.writeAsBytes(await pdf.save());

                        
  //                         },
  //                         child: Text('RECEIPT',
  //                             style: TextStyle(
  //                                 color: Colors.blue[700],
  //                                 fontSize: 16,
  //                                 fontWeight: FontWeight.w400)),
  //                       )
  //                     ],
  //                   )  
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 78,
                      height: 65,
                      decoration: BoxDecoration(
                          color: whiteColourAdmin,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(orderList.imgUrl),
                              fit: BoxFit.cover)),
                    ),
                    //  Image(
                    //   image: ,
                    //   width: 78,
                    // ),
                    const SizedBox(
                      height: 15,
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 210,
                            child: Text(
                              orderList.productName,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            )),
                        Text('${orderList.productQuantity} Pack'),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: secondGreenColourAdmin,
                                    border: Border.all(
                                        color: greenColourAdmin, width: 1.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                  ),
                                  child: Center(
                                      child: Text(orderList.productQuantity
                                          .toString())),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('X'),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.currency_rupee,
                                  size: 16,
                                ),
                                Text(orderList.price.toString()),
                              ],
                            ),
                            const SizedBox(
                              width: 54,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 16,
                                ),
                                SizedBox(
                                    width: 48,
                                    child: Text(
                                      '$totalPrice',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 19,
                ),
                const Divider(
                  thickness: 1.3,
                ),
                const SizedBox(
                  height: 13,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text('Item Total',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400))
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee,
                              size: 16,
                            ),
                            Text(totalPrice.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text('Delivery',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400))
                          ],
                        ),
                        Row(
                          children: const [
                            Text('FREE',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text('Grand Total',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee,
                              size: 16,
                            ),
                            Text(totalPrice.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const Divider(
                      thickness: 1.3,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text('ORDERD DETAILS',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey))
                          ],
                        ),
                        // Row(
                        //   children: const [
                        //     Icon(
                        //       Icons.share,
                        //       size: 18,
                        //       color: Color.fromARGB(255, 8, 105, 184),
                        //     ),
                        //     SizedBox(
                        //       width: 8,
                        //     ),
                        //     Text('SHARE',
                        //         style: TextStyle(
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.w500,
                        //             color: Color.fromARGB(255, 8, 105, 184)))
                        //   ],
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(orderList.userName,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Text('+91-${orderList.userPhone}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey))
                              ],
                            )
                          ],
                        ),
                        // Row(
                        //   children: const [
                        //     Icon(
                        //       Icons.call,
                        //       size: 30,
                        //       color: Color.fromARGB(255, 8, 105, 184),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Icon(
                        //       Icons.whatsapp_outlined,
                        //       size: 30,
                        //       color: Colors.green,
                        //     ),
                        //   ],
                        // )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Address',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        Text(orderList.houseName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        Text(orderList.addressOne,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('City',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(orderList.addressTwo,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: const [
                    //     Text('Pincode',
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w500,
                    //         )),
                    //     Text('560061',
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w400,
                    //         ))
                    //   ],
                    // )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),

                orderList.paymentType == 'onp'
                    ? PaidOrNotPaid(
                        colors: Colors.green,
                        paymentStatus: "PAID",
                        paymentType: "Online")
                    : PaidOrNotPaid(
                        colors: Colors.red,
                        paymentStatus: "UNPAID",
                        paymentType: "Cash On Delivary"),
                const SizedBox(
                  height: 11,
                ),
                const Divider(
                  thickness: 1.3,
                ),
                const SizedBox(
                  height: 12,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: const [
                //         Text('ADDTIONAL INFORMATION',
                //             style: TextStyle(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w500,
                //                 color: Colors.grey)),
                //         SizedBox(
                //           height: 15,
                //         ),
                //         Text('Pincode',
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w500,
                //             )),
                //         SizedBox(
                //           height: 6,
                //         ),
                //         Text('',
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400,
                //             )),
                //         SizedBox(
                //           height: 18,
                //         ),
                //         Text('Email',
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w500,
                //             )),
                //         SizedBox(
                //           height: 6,
                //         ),
                //         Text('greeniceaqua@gmail.com',
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400,
                //             ))
                //       ],
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 19,
                ),
                // OutlinedButton(
                //     style: OutlinedButton.styleFrom(
                //         primary: Colors.black,
                //         shape: (RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10))),
                //         side: const BorderSide(
                //             style: BorderStyle.solid,
                //             width: 1.5,
                //             color: Color.fromARGB(255, 15, 95, 160))),
                //     onPressed: () => null,
                //     child: const Padding(
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 85, vertical: 14),
                //       child: Text('Share receipt',style: TextStyle(fontSize: 16),),
                //     ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PaidOrNotPaid extends StatelessWidget {
  const PaidOrNotPaid(
      {Key? key,
      required this.colors,
      required this.paymentStatus,
      required this.paymentType})
      : super(key: key);
  final String paymentType;
  final String paymentStatus;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Payment',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
            Text(paymentType,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
        Column(
          children: [
            Container(
              width: 55,
              height: 21,
              decoration: BoxDecoration(
                color: const Color.fromARGB(111, 61, 223, 67),
                border: Border.all(
                    color: const Color.fromARGB(93, 61, 223, 67), width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Center(
                  child: Text(paymentStatus,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: colors))),
            ),
          ],
        )
      ],
    );
  }
}
