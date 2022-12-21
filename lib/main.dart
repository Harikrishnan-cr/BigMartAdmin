import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/order%20provider/orders_provider.dart';
import 'package:bigmart_admin/view/Home/home_screen.dart';
import 'package:bigmart_admin/view/add%20product%20screen/add_product_screen.dart';
import 'package:bigmart_admin/view/common%20screens/tab%20widget/tab_screen_widget.dart';
import 'package:bigmart_admin/view/login%20screen/login_screen.dart';
import 'package:bigmart_admin/view/splash%20screen/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

    final Future<FirebaseApp> _fireBaseInitization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fireBaseInitization,
      builder:(context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: greenColourAdmin,
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('has error'),
                ),
              ),
            );
          }
        return MultiProvider(
          providers: [
             ChangeNotifierProvider(create: (_) => OrderProvider()), 
          ],
          child: MaterialApp(
           debugShowCheckedModeBanner: false,
            theme: ThemeData(
           canvasColor: appCanvasColourAdmin
            ),
           home: SplashScreen(), 
           //LoginUserScreen(),  
           
           //const AdminTabScreen(),   
        
           
        routes: {
           
           AddProductScreen.routName:(ctx) =>  AddProductScreen(),
           HomeScreenAdmin.routName:(ctx) => HomeScreenAdmin(),  
           AdminTabScreen.routName:(ctx) => AdminTabScreen(),    
          
        },
        
          
           
          ),
        );
      }
    );
  }
}


