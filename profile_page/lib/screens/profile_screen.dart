import 'package:flutter/material.dart';

import '../components/info_item.dart';
import '../screens/name_screen.dart';
import '../screens/phone_screen.dart';
import '../screens/email_screen.dart';
import '../screens/bio_screen.dart';

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
    phoneNumber: '(555) 555-5555',
    email: 'DonaldMurdockTaylor@gmail.com',
    bio: 'Hello my name is Don. I would love to work for Approachable Geek! Here is more text so that I can test that my bio text is properly wrapping and not overflowing the screen.'
  );

  void updateInfo() {
    setState( () {} );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Empty invisible Appbar
        backgroundColor: Colors.transparent,
        elevation: 0.0
      ),
      body: SingleChildScrollView(        //Need to make scrollable to avoid overflow when returning to screen with keyboard open
        child: Center(
          child: Column(
            children: [
              profileHeader(),
              userPhoto(),
              InfoItem(
                title: 'Name',
                content: currentUser.firstName + ' ' + currentUser.lastName,
                screen: NameScreen()
              ),
              InfoItem(
                title: 'Phone',
                content: currentUser.phoneNumber,
                screen: PhoneScreen(
                  currentUser: currentUser,
                  updateInfo: updateInfo)
              ),
              InfoItem(
                title: 'Email',
                content: currentUser.email,
                screen: EmailScreen()
              ),
              InfoItem(
                title: 'Tell us about yourself',
                content: currentUser.bio,
                screen: BioScreen()
              ),

            ]
          )
        )
      )
    );
  }

  Widget profileHeader(){
    return Padding(padding: EdgeInsets.only(bottom: 20), child: Text(
      'Edit Profile',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.blue[700]
      )
    ));
  }

  Widget userPhoto(){
    return CircleAvatar(
      radius: 105,
      backgroundColor: Colors.blue[700],
      child: CircleAvatar(
        radius: 100.0,
        backgroundImage: AssetImage('assets/images/headshot.png'),
      )
    );
  }
}