



import 'dart:developer';

import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:bigmart_admin/view/Home/home%20widget/product_tile_admin.dart';
import 'package:bigmart_admin/view/add%20product%20screen/add_product_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class HomeScreenAdmin extends StatelessWidget {
   static const routName = "/HomeScreenAdmin";   
  const HomeScreenAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('home load');  
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('productsadmin').snapshots(),
        builder: (context,snapshot) {

if(snapshot.connectionState == ConnectionState.waiting){
  return  Center(
    child: CircularProgressIndicator(color: greenColourAdmin,),    
  );
}

          return snapshot.data!.docs.isNotEmpty ? ListView(  
            children: List.generate(snapshot.data!.docs.length, (index) =>  Padding(
              padding:  const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
              child: ProductTile(id:snapshot.data!.docs[index]['id'] ,),     
            )),
          ) : Center(
            child: Text('Add products for sale',style: cardCurrencyTextStyle(),),  
          );
        }
      ),
    floatingActionButton: FloatingActionButton(onPressed: () { 
      Navigator.pushNamed(context, AddProductScreen.routName);
    },
    backgroundColor: greenColourAdmin,
    child: const Text('Add',style: TextStyle(fontWeight: FontWeight.bold),),
    ),
      );
  }
}