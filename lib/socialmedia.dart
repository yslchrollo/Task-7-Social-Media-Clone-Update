import 'package:flutter/material.dart';
import 'package:flutter_application_7/model/userdata.dart';
import 'package:flutter_application_7/views/friendlist.dart';
import 'package:flutter_application_7/views/infoheader.dart';
import 'package:flutter_application_7/views/mainheader.dart';
import 'package:flutter_application_7/views/postlist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
  Userdata userdata = Userdata();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ), // IconButton
      ), // AppBar
      // FIX: Use SingleChildScrollView instead of nested ListViews to fix the list view bug.
      // The original code used a ListView with shrinkWrap: true containing another ListView
      // (Postlist) which caused scroll conflicts on physical devices.
      body: SingleChildScrollView(
        child: Column(
          children: [
            Mainheader(userdata: userdata),
            Infoheader(userdata: userdata),
            Friendlist(userdata: userdata),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(children: [Text('Posts', style: followTxtStyle)]),
            ), // Padding
            const SizedBox(height: 20),
            Postlist(userdata: userdata),
          ],
        ),
      ),
    ); // Scaffold
  }
}

