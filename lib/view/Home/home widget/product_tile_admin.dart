import 'dart:developer';

import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/size/style_admin.dart';
import 'package:bigmart_admin/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:bigmart_admin/view/common%20screens/alert%20box/alert.dart';
import 'package:bigmart_admin/view/common%20screens/common%20button/common_button.dart';

import 'package:bigmart_admin/view/edit%20screen/edit_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  
  const ProductTile({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool _isLoading = false;
  String head = 'Delete!';
  String headtwo = 'Are you sure';
  String butt = 'cancel';
  String butttwo = 'Confirm';
  String title = '';
  num? price;
  num? discount;
  num? discountPrice;
  String? imgUrl;
  String? category;
  String? description;
  @override
  void initState() {
    
    getUserData();
    super.initState();
  }

  Future getUserData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final DocumentSnapshot userDetails = await FirebaseFirestore.instance
          .collection('productsadmin')
          .doc(widget.id)
          .get();

      // ignore: unnecessary_null_comparison
      if (userDetails == null) {
        return;
      } else {
        setState(() {
          title = userDetails.get('title');
          price = int.parse(userDetails.get('price'));
          discount = int.parse(userDetails.get('discount'));
          discountPrice = price! - (price! * discount! / 100);
          imgUrl = userDetails.get('imgUrl');
          category = userDetails.get('category');
          description = userDetails.get('description');
          // log(discountPrice.toString());
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 154,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FancyShimmerImage(  
                   width: 150,
                  height: 154,   
                  imageUrl: imgUrl == null ? 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg' : imgUrl!,
                imageBuilder: (context, imageProvider) {
                  return Container(
                 
                  decoration: BoxDecoration(
                      color: blackColourAdmin,
                      borderRadius: BorderRadius.circular(12),
                      image: imgUrl == null
                          ?  DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover)
                          : DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                );
                },
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 10, left: 10, bottom: 10),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 160,
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: cardTextStyle(),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        '₹',
                        style: cardCurrencyTextStyle(),
                      ),
                      constWidth5,
                      Text(
                        discountPrice.toString(),
                        style: cardRsTextStyle(),
                      ),
                    ],
                  ),
                ),
                constHeight5,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        '₹',
                        style: cardCurrencyTextStyle(),
                      ),
                      constWidth5,
                      Text(
                        price.toString(),
                        style: markedTextStyle(),
                      ),
                      constWidth10,
                      constWidth10,
                      constWidth10,
                      Text(
                        discount.toString(),
                        style: cardTextStyle(),
                      ),
                      Text(
                        '%',
                        style: cardTextStyle(),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return EditProductScreen(
                                    description: description!,
                                    id: widget.id,
                                    title: title,
                                    price: price!,
                                    discount: discount!,
                                    catValue: category!,
                                    imageUrl: imgUrl ??
                                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
                              },
                            ));
                          },
                          child: const CommonButtonScreen(
                              height: 29,
                              width: 73,
                              iconWidth: 5,
                              iconSize: 14,
                              textFunction: 'Edit',
                              icon: Icons.edit)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            deletProductAlertBox(
                                    id: widget.id,
                                    confirmButton: 'Delete',
                                    cancelButton: 'Cancel',
                                    context: context,
                                    alertTitle: 'Are you sure?',
                                    alterSubtitle:
                                        'Are you sure you want to delete this item?')
                                .show();

                            log('Delete');
                          },
                          child: const CommonButtonScreen(
                              height: 29,
                              width: 73,
                              iconWidth: 4,
                              iconSize: 14,
                              textFunction: 'Delete',
                              icon: Icons.delete)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
