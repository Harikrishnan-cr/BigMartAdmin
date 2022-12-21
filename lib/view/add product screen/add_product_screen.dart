import 'dart:developer';

import 'dart:io';

import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/size/style_admin.dart';
import 'package:bigmart_admin/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:bigmart_admin/controller/const/style/text_style.dart';

import 'package:bigmart_admin/view/common%20screens/common%20button%20filled/common_filled_button.dart';
import 'package:bigmart_admin/view/common%20screens/tab%20widget/tab_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatefulWidget {
  static const routName = "/AddProductScreen";
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  final priceController = TextEditingController();

  final discountController = TextEditingController();

  String catValue = 'Meat';

  File? pickImage;
  bool _isLoading = false;

  clearFieldFunction() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    discountController.clear();
    setState(() {
      catValue = 'Meat';
      pickImage = null;
    });
  }

  Future uploadFile() async {
//     final path = 'files/${pickImage!.path}';
// final file = File(pickImage!.path);

//final ref = FirebaseStorage.instance.ref().child(path);
//ref.putFile(file);
  }

  Future onRegisterButtonPressed() async {
    final uid = const Uuid().v4();
    try {
      final file = File(pickImage!.path);
      final ref = FirebaseStorage.instance
          .ref()
          .child('productImages')
          .child('${uid}jpg');

      UploadTask uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});

      final imgUrl = await snapshot.ref.getDownloadURL();
      //print(imgUrl);

      await FirebaseFirestore.instance
          .collection('productsadmin')
          .doc(uid)
          .set({
        'id': uid,
        'title': titleController.text,
        'description': descriptionController.text,
        'price': priceController.text,
        'imgUrl': imgUrl,
        'discount': discountController.text,
        'category': catValue,
        'createdAt': Timestamp.now()
      });
      clearFieldFunction();
      //Navigator.of(context).pushReplacementNamed(BottomBarScreen.namedRoute);
    } on FirebaseException catch (error) {
      log(error.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColourAdmin,
        elevation: 0,
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                clearFieldFunction();
              },
              child: Icon(Icons.refresh, color: whiteColourAdmin, size: 25)),
          constWidth10,
        ],
        title: Text(
          'ADD PRODUCTS',
          style: addTextStyle(),
        ),
      ),
      body:  ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 45,
              right: 45,
              top: 20,
            ),
            child: GestureDetector(
              onTap: () async {
                await pickImageGalary();
              },
              child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: greyBacgroundAdmin,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: greenColourAdmin, width: 1.6),
                    image: pickImage != null ?  DecorationImage(image:FileImage(pickImage!),fit: BoxFit.cover):const DecorationImage(image: NetworkImage('https://static.thenounproject.com/png/3322766-200.png'))
                  ),
                 
                        ),
            ),
          ),
          CommonTextField(
            lines: 1,
            hintText: 'Title',
            controller: titleController,
          ),
          CommonTextField(
            lines: 12,
            hintText: 'Description',
            controller: descriptionController,
          ),
          constHeight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'PRICE',
              style: cardCurrencyTextStyle(),
            ),
          ),
          CommonTextField(
            lines: 1,
            hintText: 'Price in ₹',
            controller: priceController,  
              textInputType: TextInputType.number,
              
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Discount'.toUpperCase(),
              style: cardCurrencyTextStyle(),
            ),
          ),
          CommonTextField(  
            textInputType: TextInputType.number,
              lines: 1,
              hintText: 'Discount',
              controller: discountController,
              numberOflines: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Category'.toUpperCase(),
              style: cardCurrencyTextStyle(),
            ),
          ),
          constHeight10,

          dropDown(),
//          Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//           // color: greenColourAdmin,
//           decoration: BoxDecoration(
//             border: Border.all(color: greenColourAdmin),
//             borderRadius: BorderRadius.circular(25)
//           ),
//            height: 50,
//             child: DropdownButton(
//               elevation: 0,
//               isExpanded: true,
//     value: "Tokyo",
//     items: [
//       DropdownMenuItem(
//             child: Text("New York"),
//             value: "New York"
//       ),
//       DropdownMenuItem(
//             child: Text("Tokyo"),
//             value: "Tokyo",
//       )
//     ],
//     onChanged: (value){
// log(value.toString());
//     },
// ),
//           ),
//         ),
          GestureDetector(
            onTap: () async { 
              log('add pressed');
               setState(() {
                  _isLoading = true;
                });
              await onRegisterButtonPressed().whenComplete(() {
                setState(() {
                  _isLoading = false;
                });
                return _navigateFunctionAdminTap(); 
              });
             
            },
            child: !_isLoading ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: AddButtonAdmin(
                text: 'Add',
                width: 60,
                height: 40,
              ),
            ) : Center(child: CircularProgressIndicator(color: greenColourAdmin,),)
          )
        ],
      ), 
    );
  }

  Future pickImageGalary() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      var selectedImg = File(image.path);
      setState(() {
        pickImage = selectedImg;
      });
    } else {
      log('No Image');
      return;
    }
  }

  void _navigateFunctionAdminTap() {
    Navigator.pushReplacementNamed(context, AdminTabScreen.routName);
  }

  Widget dropDown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: blackColourAdmin),
            borderRadius: BorderRadius.circular(10),
            color: whiteColourAdmin),
        child: DropdownButtonHideUnderline(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: DropdownButton<String>(
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: blackColourAdmin,
                fontSize: 16),
            value: catValue,
            hint: Text(
              'Data',
              style: cardCurrencyTextStyle(),
            ),
            onChanged: (value) {
              setState(() {
                catValue = value!;
              });
              log(catValue);
            },
            items: const [
              DropdownMenuItem(
                value: 'Meat',
                child: Text('Meat'),
              ),
              DropdownMenuItem(
                value: 'fruit',
                child: Text('Fruit'),
              ),
              DropdownMenuItem(
                value: 'vegetables',
                child: Text('Vegetables'),
              ),
              DropdownMenuItem(
                value: 'fish',
                child: Text('Fish'), 
              ),
              DropdownMenuItem(
                value: 'others',
                child: Text('Others'), 
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {Key? key,
      required this.lines,
      required this.hintText,
      required this.controller,
      this.numberOflines,
      this.textInputType  
      })
      : super(key: key);

  final int lines;
  final String hintText;
  final TextEditingController controller;
  final int? numberOflines;
final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextFormField(
        textInputAction: TextInputAction.next, 
        keyboardType: textInputType,
        maxLength: numberOflines,
        // textCapitalization: TextCapitalization.sentences,
        controller: controller,
        maxLines: lines,

        decoration: InputDecoration(
            filled: true,
            fillColor: whiteColourAdmin,
            hintText: hintText,
            alignLabelWithHint: true,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}

class CameraSection extends StatelessWidget {
  const CameraSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 45,
        right: 45,
        top: 20,
      ),
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
            color: greyBacgroundAdmin,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: greenColourAdmin, width: 1.6)),
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
