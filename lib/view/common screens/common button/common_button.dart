


import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/size/style_admin.dart';
import 'package:flutter/material.dart';


class CommonButtonScreen extends StatelessWidget {
  const CommonButtonScreen({Key? key, required this.height, required this.width, required this.iconWidth, required this.iconSize, required this.textFunction, required this.icon}) : super(key: key);
final double height;
final double width;
final double iconWidth;
final double iconSize;
final String textFunction;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: voiletColourAdmin,
          width: 1.6 
          )),
      child: Center(
          child: Row(
          
            children: [
             SizedBox(
            width: iconWidth,
             ),
            Icon(icon,size: iconSize,color: voiletColourAdmin,), 
             constWidth5,
            Text(
        textFunction.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
                fontWeight: FontWeight.w500, color: voiletColourAdmin, fontSize: 15),
      ),
            ],
          )),
    );
  }
}