import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Edit Profile',
          style: TextStyle(
            color: Colors.white
          ),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {Navigator.pushReplacementNamed(context, "/home");},
            color: Colors.white,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1))
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/icons/avatar1.png'))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Colors.blueAccent,
                              ),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.blue,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Nama",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7)
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Nama",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.5)
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: .5,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)))),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("SAVE",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2,
                            color: Colors.white,
                          )),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}