import 'package:bigmart_admin/controller/const/color/admin_color.dart';
import 'package:bigmart_admin/controller/const/size/style_admin.dart';
import 'package:bigmart_admin/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:bigmart_admin/view/login%20screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SlideBarMenu extends StatelessWidget {
  const SlideBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: greenColourAdmin,
      width: 220,
      child: Column(
        children: [
          Column(
            children: [
              constHeight10,
              constHeight10,
              constHeight10,
              constHeight10,
              Text(
                'BigMart',
                style: mainMenuText(),
              ),
              constHeight10,
              constHeight10,
              Divider(
                thickness: 1.5,
                color: blackColourAdmin,
              )
            ],
          ),
          Column(
            children: [
              constHeight10,
              constHeight10,
              constHeight10,
              constHeight10,
              Image.asset(
                'assets/image/image 43.png',
              ),
              constHeight10,
              Text(
                'Admin BigMart',
                style: cardCurrencyTextStyle(),
              )
            ],
          ),
          Column(
            children: [
              constHeight10,
              constHeight10,
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const SliderBarMenuItemsList(
                      icon: Icons.home, data: 'Home')),
              constHeight10,
              constHeight10,
              const SliderBarMenuItemsList(
                  icon: Icons.shopping_bag_rounded, data: 'My Orders'),
              constHeight10,
              constHeight10,
              Divider(
                thickness: 1.5,
                color: blackColourAdmin,
              ),
              constHeight10,
              constHeight10,
              GestureDetector(
                  onTap: () async {
                    final sharedPref = await SharedPreferences.getInstance();
                    await sharedPref.clear();

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return LoginUserScreen();
                      },
                    ));
                  },
                  child: const SliderBarMenuItemsList(
                      icon: Icons.logout, data: 'Logout'))
            ],
          )
        ],
      ),
    );
  }
}

class SliderBarMenuItemsList extends StatelessWidget {
  const SliderBarMenuItemsList({
    Key? key,
    required this.icon,
    required this.data,
  }) : super(key: key);

  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        constWidth10,
        constWidth10,
        constWidth5,
        Icon(icon),
        constWidth10,
        constWidth5,
        Text(
          data,
          style: cardCurrencyTextStyle(),
        )
      ],
    );
  }
}
