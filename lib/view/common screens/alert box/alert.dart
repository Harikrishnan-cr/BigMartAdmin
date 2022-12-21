import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/view/common%20screens/tab%20widget/tab_screen_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

String? alertTitle;
String? alterSubtitle;
String? cancelButton;
String? confirmButton;
String? id;
Alert deletProductAlertBox(
    {required id,
    required context,
    alertTitle,
    alterSubtitle,
    cancelButton,
    confirmButton}) {
  return Alert(   
    context: context,
    type: AlertType.warning,      
    title: alertTitle ?? "ALERT",
    desc: alterSubtitle ?? "Flutter is more awesome with RFlutter Alert.",
    style: const AlertStyle(
        animationType: AnimationType.fromBottom,
        animationDuration: Duration(milliseconds: 500)
        //   AnimationType  = AnimationType.fromBottom,
        // Duration animationDuration = const Duration(milliseconds: 200),
        ),
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        color: blackColourAdmin,
        child: Text(
          cancelButton ?? "",
          style: TextStyle(
              color: whiteColourAdmin,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      DialogButton(
        onPressed: () async {
          await FirebaseFirestore.instance
              .collection('productsadmin')
              .doc(id)
              .delete();
         Navigator.of(context).pushReplacementNamed(AdminTabScreen.routName); 
        },
        color: greenColourAdmin,
        child: Text(
          confirmButton ?? "GRADIENT",
          style: TextStyle(
              color: whiteColourAdmin,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        // gradient: LinearGradient(colors: [
        //   Color.fromRGBO(116, 116, 191, 1.0),
        //   Color.fromRGBO(52, 138, 199, 1.0)
        // ]),
      )
    ],
  );
}
