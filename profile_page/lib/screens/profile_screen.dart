import 'package:flutter/material.dart';

import '../components/info_item.dart';
import '../models/user.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User currentUser = User(
    firstName: 'Donald',
    lastName: 'Taylor',
    phoneNumber: '555-555-5555',
    email: 'DonaldMurdockTaylor@gmail.com',
    bio: 'Hello my name is Don. I would love to work for Approachable Geek! Here is more text so that I can test that my bio text is properly wrapping and not overflowing the screen.'
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Empty invisible Appbar
        backgroundColor: Colors.transparent,
        elevation: 0.0
      ),
      body: Center(
        child: Column(
          children: [
            profileHeader(),
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/images/headshot.png'),
            ),
            InfoItem(
              title: 'Name',
              content: currentUser.firstName + ' ' + currentUser.lastName
            ),
            InfoItem(
              title: 'Phone',
              content: currentUser.phoneNumber
            ),
            InfoItem(
              title: 'Email',
              content: currentUser.email
            ),
            InfoItem(
              title: 'Tell us about yourself',
              content: currentUser.bio
            ),

          ]
        )
      )
    );
  }

  Widget profileHeader(){
    return Text(
      'Edit Profile',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.blue[700]
      )
    );
  }
}