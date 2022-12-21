import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/view/Home/home_screen.dart';
import 'package:bigmart_admin/view/offers/category_screen.dart';
import 'package:bigmart_admin/view/orders/order_screen.dart';
import 'package:bigmart_admin/view/slide%20bar/slidebar.dart';
import 'package:flutter/material.dart';

class AdminTabScreen extends StatelessWidget {
  static const routName = "/AdminTabScreen";
  const AdminTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 85,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.5),
              child: Text('BigMart'),
            ),
            titleTextStyle:
                const TextStyle(fontWeight: FontWeight.w900, fontSize: 27),
            leadingWidth: 18,
            backgroundColor: greenColourAdmin,
            elevation: 0,
            bottom: const TabBar(
                indicatorColor: Colors.transparent,
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                unselectedLabelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                tabs: [
                  Tab(
                    text: 'Product',
                  ),
                  Tab(
                    text: 'Offers',
                  ),
                  Tab(
                    text: 'Orders',
                  ),
                ]),
          ),
          drawer: SlideBarMenu(),
          body: const TabBarView(children: [
            HomeScreenAdmin(),
            OffersScreenAdmin(),
            OrderScreenAdmin()
          ]),
        ),
      ),
    );
  }
}
