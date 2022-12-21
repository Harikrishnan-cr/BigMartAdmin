import 'dart:developer';
import 'dart:io';

import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/size/style_admin.dart';

import 'package:bigmart_admin/view/add%20product%20screen/add_product_screen.dart';
import 'package:bigmart_admin/view/login%20screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddOfferScreen extends StatefulWidget {
  AddOfferScreen({Key? key}) : super(key: key);

  @override
  State<AddOfferScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {
  final TextEditingController offerTextController = TextEditingController();

  final TextEditingController offerCode = TextEditingController();

  File? pickImage;
  bool _isLoading = false;

  clearFieldFunction() {
    offerCode.clear();
    offerTextController.clear(); 
   setState(() {
      pickImage = null;
   });
  }

  Future uploadFile() async {
//     final path = 'files/${pickImage!.path}';
// final file = File(pickImage!.path);

//final ref = FirebaseStorage.instance.ref().child(path);
//ref.putFile(file);
  }

  Future onAddOfferButtonPressed() async {  
  setState(() {
      _isLoading = true;
  });
    final uid = const Uuid().v4();
    try {
      final file = File(pickImage!.path);
      final ref = FirebaseStorage.instance
          .ref()
          .child('offerImages') 
          .child('${uid}jpg');

      UploadTask uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});

      final imgUrl = await snapshot.ref.getDownloadURL();
      //print(imgUrl);

      await FirebaseFirestore.instance
          .collection('productsOffersAadmin')  
          .doc(uid)
          .set({
        'offerId': uid,
        'offerCode': offerCode.text,
        'offerImgUrl': imgUrl,
        'offerPercentage': offerTextController.text,
        'offerCreatedAt': Timestamp.now()
      });
      clearFieldFunction();
      setState(() {
        _isLoading = false; 
      });
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
        title: const Text('Add Offers'),
        actions: [
          GestureDetector(
            onTap: () {
              clearFieldFunction();  
            },
            child: const Icon(Icons.clear_all)),
          constWidth10
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              constHeight10,
              constHeight10,
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                  image: pickImage != null ?  DecorationImage(image:FileImage(pickImage!),fit: BoxFit.cover):const DecorationImage(image: NetworkImage('https://static.thenounproject.com/png/3322766-200.png')) 
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickImageGalary(); 
                        },
                        child: Icon(Icons.camera_alt)),
                      constHeight5,
                     
                    ],
                  ),
                ),
              ),
              constHeight10,
              constHeight10,
              CommonTextField(
                lines: 1,
                hintText: 'Add Offer in Percentage',
                controller: offerTextController,
                numberOflines: 2,
                textInputType: TextInputType.number,
              ),
              CommonTextField(
                  lines: 1,
                  hintText: 'Coupen Code',
                  controller: offerCode,
                  numberOflines: 6,
                  textInputType: TextInputType.streetAddress),
              // EmailLoginPageControllers(mainemail: 'Add Offer', labelEmail: 'Add Offer', textController: offerTextController),
              // EmailLoginPageControllers(mainemail: 'Add Offer', labelEmail: 'Add Offer', textController: offerCode),
            ],
          ),
        ),
      ),
      bottomSheet: _isLoading != true ? GestureDetector(
        onTap: () {
          onAddOfferButtonPressed(); 
        },
        child:  CommonButtobMain(
          height: 38,
          titleText: 'Save Offer',
        )    
      ) : Center(child: CircularProgressIndicator(color: greenColourAdmin,),)
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
}
