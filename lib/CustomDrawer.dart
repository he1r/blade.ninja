import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UIMain.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.indigo[900],
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              color: Colors.indigo[900],
              padding: const EdgeInsets.all(20),
              child: Text(
                "DataBaza",
                style: GoogleFonts.bebasNeue(
                  color: Colors.white,
                  letterSpacing: 6,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text("Gjendja Civile 2008",
                style:
                    GoogleFonts.josefinSans(color: Colors.white, fontSize: 15)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UIMain(0),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.person_add_alt,
              color: Colors.white,
            ),
            title: Text("Patronazhisti 2021",
                style:
                    GoogleFonts.josefinSans(color: Colors.white, fontSize: 15)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UIMain(1),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.car_repair_rounded,
              color: Colors.white,
            ),
            title: Text("Targat 2021",
                style:
                    GoogleFonts.josefinSans(color: Colors.white, fontSize: 15)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UIMain(2),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.person_search_sharp,
              color: Colors.white,
            ),
            title: Text("Targat + Patronazhisti",
                style:
                    GoogleFonts.josefinSans(color: Colors.white, fontSize: 15)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UIMain(3),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.money,
              color: Colors.white,
            ),
            title: Text("Rrogat Prill",
                style:
                    GoogleFonts.josefinSans(color: Colors.white, fontSize: 15)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UIMain(4),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
