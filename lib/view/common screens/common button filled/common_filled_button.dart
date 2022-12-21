import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/style/text_style.dart';
import 'package:flutter/cupertino.dart';

class AddButtonAdmin extends StatelessWidget {
  const AddButtonAdmin({
    Key? key,this.height,this.width,this.text
  }) : super(key: key); 
final double? width;
final double? height;
final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(  
      width: width ?? 65,
      height: height ?? 33,
    decoration: BoxDecoration(
        color: greenColourAdmin,
        borderRadius: BorderRadius.circular(10)
    ),
      child: Center(child: Text(text ?? 'Nil',style: addTextStyle(),)),  
    );
  }
}
