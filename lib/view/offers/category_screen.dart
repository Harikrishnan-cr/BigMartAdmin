import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/size/style_admin.dart';
import 'package:bigmart_admin/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:bigmart_admin/view/add_offer/add_offer.dart';

import 'package:bigmart_admin/view/login%20screen/login_screen.dart';
import 'package:bigmart_admin/view/offers/category%20widget/category_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OffersScreenAdmin extends StatelessWidget {
  const OffersScreenAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('productsOffersAadmin')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: greenColourAdmin,
                ),
              );
            }

            return snapshot.data!.docs.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                          child: ListView(
                        children:
                            List.generate(snapshot.data!.docs.length, (index) {
                          // final val = snapshot.data!.docs[''];
                          final offerId = snapshot.data!.docs[index]['offerId'];
                          final offerCode =
                              snapshot.data!.docs[index]['offerCode'];
                          final offerCreatedAt =
                              snapshot.data!.docs[index]['offerCreatedAt'];
                          final offerImgUrrl =
                              snapshot.data!.docs[index]['offerImgUrl'];
                          final offerPercentage =
                              snapshot.data!.docs[index]['offerPercentage'];
                          return OffersWidgetAdmin(
                            offerCode: offerCode,
                            offerId: offerId,
                            offerPerce: int.parse(offerPercentage),
                            imgUrl: offerImgUrrl,
                          );
                        }),
                      )),
                      constHeight10,
                      constHeight10,
                      constHeight10,
                      constHeight10,
                      constHeight10,
                      constHeight10,
                      constHeight10,
                    ],
                  )
                : Center(
                    child: Text(
                      'Add products for sale',
                      style: cardCurrencyTextStyle(),
                    ),
                  );
          }),
      bottomSheet: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return AddOfferScreen();
              },
            ));
          },
          child: const CommonButtobMain(
            height: 40,
            titleText: 'Add Offers',
          )),
    );
  }
}
