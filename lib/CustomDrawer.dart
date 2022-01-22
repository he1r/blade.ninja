import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UIMain.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Gjendja Civile 2008"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => UIMain(0),),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt),
            title: const Text("Patronazhisti 2021"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => UIMain(1),),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.car_repair_rounded),
            title: const Text("Targat 2021"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => UIMain(2),),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_search_sharp),
            title: const Text("Targat + Patronazhisti 2021"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => UIMain(3),),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text("Rrogat Prill"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => UIMain(4),),
              );
            },
          ),
        ],
      ),
    );
  }
}