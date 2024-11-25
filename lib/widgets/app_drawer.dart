import 'package:flutter/material.dart';
import 'package:tourism_app/screens/tabs_screen.dart';
import '../screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget bulidListTile(String title, IconData icon, Function() onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          bulidListTile("Trips", Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.mtk);
          }),
          bulidListTile("Filtering", Icons.filter_list, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.mtk);
          }),
        ],
      ),
    );
  }
}
