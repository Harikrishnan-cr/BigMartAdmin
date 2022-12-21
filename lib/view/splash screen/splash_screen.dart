
import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/const%20admin%20value/admin_const.dart';
import 'package:bigmart_admin/controller/order%20provider/orders_provider.dart';

import 'package:bigmart_admin/view/common%20screens/tab%20widget/tab_screen_widget.dart';
import 'package:bigmart_admin/view/login%20screen/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) { 
//      checkUserLogedIn();  
//     return AnimatedSplashScreen(
//       backgroundColor: greenColourAdmin,
//       splash: Text(
//         'BigMart\n Admin',
//         style: TextStyle(
//             fontWeight: FontWeight.bold, color: whiteColourAdmin, fontSize: 35),
//      ),
// //       nextScreen: userLogedIn == null || userLogedIn == false
//           ? LoginUserScreen()
//           : const AdminTabScreen(),
//       duration: 3000,
//       splashTransition: SplashTransition.fadeTransition,
//     );
//   }

  // Future<void> checkUserLogedIn() async {
  //   final sharedPref = await SharedPreferences.getInstance();
  //  userLogedIn = sharedPref.getBool(SAVE_KEY);
  // }
// }


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
checkUserLogedIn(); 
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
          final orderProvider = Provider.of<OrderProvider>(context,listen: false);  
    orderProvider.fetchProducts(); 
    return Scaffold(
      backgroundColor: greenColourAdmin,
      body: Center(
        child: Text(
        'BigMart\n Admin',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: whiteColourAdmin, fontSize: 35),
     ),
      ),
    );
  }


  Future<void>goLoginScreen()async{
    
await Future.delayed(const Duration(seconds: 3));
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
  return LoginUserScreen(); 
},));
  }


    Future<void> checkUserLogedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
  final userLogedIn = sharedPref.getBool(SAVE_KEY);

  if(userLogedIn == null || userLogedIn == false){
    goLoginScreen();
  }else{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
  return AdminTabScreen(); 
},));
  }
  }
}