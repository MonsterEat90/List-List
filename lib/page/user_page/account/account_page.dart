// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_list_2/constants/color_constant.dart';
import 'package:list_list_2/page/user_page/account/reset_password.dart';

class AccountPage extends StatefulWidget {
  final int index;
  AccountPage(this.index);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [kDarkBlue, kModerateCyan],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 110.0,
                      ),
                      CircleAvatar(
                        radius: 65.0,
                        backgroundImage: AssetImage('assets/profil.jpg'),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Tubagus Adam',
                        style: GoogleFonts.dongle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Card(
                      margin: EdgeInsets.fromLTRB(0.0, .0, 0.0, 0.0),
                      child: SizedBox(
                        width: 310.0,
                        height: 290.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Settings",
                                style: GoogleFonts.dongle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Divider(
                                color: Colors.grey[400],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.settings_backup_restore,
                                    color: lightOrange,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ResetPassword(),
                                            ),
                                          ),
                                        },
                                        child: Text(
                                          'Reset Password',
                                          style: TextStyle(color: blackColor),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.auto_awesome,
                                    color: Colors.yellowAccent[400],
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Magic",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(
                                        "Spatial & Sword Magic, Telekinesis",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.pinkAccent[400],
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Loves",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(
                                        "Eating cakes",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.people,
                                    color: Colors.lightGreen[400],
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Team",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(
                                        "Team Natsu",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[400],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            left: 20.0,
            right: 20.0,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Collections',
                          style: GoogleFonts.dongle(
                              color: Colors.grey[400], fontSize: 25),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "$counter",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    VerticalDivider(color: Colors.grey[400]),
                    Column(
                      children: [
                        Text(
                          'Followers',
                          style: GoogleFonts.dongle(
                              color: Colors.grey[400], fontSize: 25),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '50',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    VerticalDivider(color: Colors.grey[400]),
                    Column(
                      children: [
                        Text(
                          'Following',
                          style: GoogleFonts.dongle(
                              color: Colors.grey[400], fontSize: 25),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '50',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
