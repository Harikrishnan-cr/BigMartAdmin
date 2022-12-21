import 'dart:developer';

import 'package:bigmart_admin/controller/const/color/admin_color.dart';

import 'package:bigmart_admin/view/common%20screens/common%20button/common_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class OffersWidgetAdmin extends StatelessWidget {
  const OffersWidgetAdmin({Key? key,required this.imgUrl,required this.offerCode,required this.offerId,required this.offerPerce}) : super(key: key);

final String imgUrl;
final String offerCode;
final int offerPerce;
final String offerId; 
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(  
                image: DecorationImage(    
                    fit: BoxFit.cover,
                    image: NetworkImage(   
                        imgUrl)),
                color: whiteColourAdmin,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 1.2,
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: whiteColourAdmin,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 1.2,
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.end, 
                  children: [
                    //CommonButtonScreen(height: 30, width: 100, iconWidth: 15, iconSize: 18, textFunction: 'Edit', icon: Icons.edit),
                    GestureDetector(
                      onTap: () async{
                        log('delete pressed'); 
                         await FirebaseFirestore.instance
              .collection('productsOffersAadmin')  
              .doc(offerId)   
              .delete();
                      },
                      child: const CommonButtonScreen(height: 30, width: 100, iconWidth: 15, iconSize: 18, textFunction: 'Delete', icon: Icons.delete,)),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
