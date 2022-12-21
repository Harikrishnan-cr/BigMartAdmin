import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle cardTextStyle() => TextStyle(
    fontWeight: FontWeight.bold, color: blackColourAdmin, fontSize: 16);
TextStyle cardCurrencyTextStyle() => TextStyle(
    fontWeight: FontWeight.bold, color: blackColourAdmin, fontSize: 20);
TextStyle cardRsTextStyle() => TextStyle(
    fontWeight: FontWeight.bold, color: greenColourAdmin, fontSize: 20);
TextStyle productRsTextStyle() => TextStyle(
    fontWeight: FontWeight.bold, color: greenColourAdmin, fontSize: 25);

TextStyle signUpUserTextStyle() => TextStyle(
    fontWeight: FontWeight.bold, color: blackColourAdmin, fontSize: 25);
TextStyle mainMenuText() => TextStyle(
      fontWeight: FontWeight.bold,
      color: blackColourAdmin,
      fontSize: 31,
      shadows: const [
        Shadow(
          offset: Offset(1.0, 1.0), 
          blurRadius: 3.0,
          color: Color.fromARGB(255, 11, 11, 11),
        ),
        
      ],
    );

//----------------Marked Money ---------------------------

TextStyle markedTextStyle() => const TextStyle(
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(197, 130, 128, 128),
    fontSize: 19,
    decoration: TextDecoration.lineThrough,
    decorationThickness: 1.8);
TextStyle packAndKiloTextStyle() => const TextStyle(
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(197, 130, 128, 128),
    fontSize: 16);
