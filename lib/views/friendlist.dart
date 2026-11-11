import 'package:flutter/material.dart';
import 'package:flutter_application_7/model/friend.dart';

import '../model/userdata.dart';

// ignore: must_be_immutable
class Friendlist extends StatelessWidget {
  Friendlist({super.key, required this.userdata});

  final Userdata userdata;

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Image.asset(
            friend.img,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: Text(
            friend.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ), // Column
  ); // Card

  Widget friendsListGrid() => GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 0.82,
    ), // SliverGridDelegateWithFixedCrossAxisCount
    itemCount: userdata.friendList.length,
    itemBuilder: (BuildContext ctx, index) {
      return friend(userdata.friendList[index]);
    },
  ); // GridView.builder

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(children: [Text('Friends', style: followTxtStyle)]),
        ), // Padding
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(children: [Text('${userdata.friendList.length} Friends')]),
        ), // Padding
        const SizedBox(height: 10),
        friendsListGrid(),
        const SizedBox(height: 15),
        const Divider(color: Colors.grey, thickness: 1),
      ],
    ); // Column
  }
}

