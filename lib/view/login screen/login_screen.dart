






import 'dart:developer';

import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/const%20admin%20value/admin_const.dart';
import 'package:bigmart_admin/controller/const/size/style_admin.dart';
import 'package:bigmart_admin/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:bigmart_admin/controller/const/style/text_style.dart';
import 'package:bigmart_admin/view/common%20screens/tab%20widget/tab_screen_widget.dart';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUserScreen extends StatelessWidget {
  static const namedRoute = "/LoginUserScreen";
  LoginUserScreen({Key? key}) : super(key: key);

  final double height = 45;

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void clearFieldFunction() {
    _emailTextController.clear();
    _passwordTextController.clear();
  }

  // Future onSignUpButtonPressed(context) async {
  //   try {
  //     await authInstance.signInWithEmailAndPassword(
  //         email: _emailTextController.text.toLowerCase().trim(),
  //         password: _passwordTextController.text.trim());
  //     Navigator.of(context).pushReplacementNamed(BottomBarScreen.namedRoute);
  //     clearFieldFunction();
  //   } on FirebaseException catch (error) {
  //     log(error.toString());
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }


 Future validateAdminId(context)async{

final userName = _emailTextController.text;
final password = _passwordTextController.text;

if(userName == 'admin325' && password == '123456789'){  

   final sharedPref = await SharedPreferences.getInstance();
     await sharedPref.setBool(SAVE_KEY, true);

     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
  return const AdminTabScreen();
},));
}else{
  log('No value');  
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    constHeight10,
                    constHeight10,
                    constHeight10,
                    constHeight10,
                    Text(
                      'WELCOME BACK!',
                      style: productRsTextStyle(),
                    ),
                    constHeight5,
                    Text(
                      'Sign in to Continue',
                      style: loginUserScreenSecondaryCardTextStyle(),
                    ),
                  ],
                ),
              ),
              constHeight10,
              constHeight10,
              constHeight10,
              Column(  
children: [
  EmailLoginPageControllers(  
                mainemail: 'USER NAME',
                labelEmail: 'User Name',
                textController: _emailTextController,
              ),
              constHeight5,
              EmailLoginPageControllers(
                mainemail: 'PASSWORD',
                labelEmail: 'Password',
                textController: _passwordTextController,
              ),
],
              ),
              Column(
                children: [
                  constHeight10,
                  constHeight10,
                  constHeight10,
                  GestureDetector(
                      onTap: () async {
                       // await onSignUpButtonPressed(context);
await validateAdminId(context);


                        // _emailTextController.clear();
                        // _passwordTextController.clear();
                      },
                      child: CommonButtobMain(height: height)),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                  //   child: Container(
                  //     width: double.infinity,
                  //     height: 40,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(1),
                  //         image: const DecorationImage(
                  //             image: NetworkImage(
                  //               'https://d172mw7nx82lso.cloudfront.net/assets/landing/auth/google-d33f9eb20af60f124ea3de0def9116700064e558db8a63275354162d46ae09cb.png',
                  //             ),
                  //             fit: BoxFit.fill),
                  //         color: greenColourAdmin),
                  //   ),
                  // ),
                  // Text(
                  //   'or',
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 19,
                  //       color: blackColourAdmin),
                  // ),
                  // GestureDetector(
                  //     onTap: () {
                  //     //  Navigator.of(context).pushNamedAndRemoveUntil(BottomBarScreen.namedRoute, (route) => false); 
                  //       // Navigator.of(context)
                  //       //     .pushReplacementNamed(BottomBarScreen.namedRoute);
                  //     },
                  //     child: CommonButtobMain(
                  //       height: height,
                  //       colours: blackColourAdmin,
                  //       titleText: 'Continue as a guest',
                  //     )),
                ],
              ),
              constHeight5,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       'Don’t have an account?',
              //       style: cardTextStyle(),
              //     ),
              //     constWidth5,
              //     GestureDetector(
              //         onTap: () {
              //           // Navigator.of(context)
              //           //     .pushNamed(SignUpUserScreen.namedRoute);
              //         },
              //         child: Text(
              //           'Sign up',
              //           style: userLoginTextStyle(),
              //         )),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class CommonButtobMain extends StatelessWidget {
  const CommonButtobMain(
      {Key? key, required this.height, this.titleText, this.colours})
      : super(key: key);

  final double height;
  final Color? colours;
  final String? titleText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            color: colours ?? greenColourAdmin,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          titleText ?? 'SIGN IN',
          style: addTextStyle(),
        )),
      ),
    );
  }
}

class EmailLoginPageControllers extends StatelessWidget {
  const EmailLoginPageControllers(
      {Key? key,
      required this.mainemail,
      required this.labelEmail,
      required this.textController,
      this.obscureText})
      : super(key: key);
  final bool? obscureText;
  final String mainemail;
  final String labelEmail;
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainemail,
            style: cardRsTextStyle(),
          ),
          TextField(
              obscureText: obscureText == null ? false : true,
              controller: textController,
              decoration: InputDecoration(
                  labelText: labelEmail,
                  labelStyle: loginUserScreenSecondaryCardTextStyle())),
        ],
      ),
    );
  }
}
