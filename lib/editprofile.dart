import 'package:app_11/customtextformfield.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditprofileState();
}

class _EditprofileState extends State<EditProfile> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.check),
              color: Colors.green,
              iconSize: 28,
            ),
          )
        ],
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 20),
                width: 90,
                height: 90,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      "images/OIP.webp",
                      fit: BoxFit.cover,
                    )))
          ],
        ),
        SizedBox(height: 40),
        Expanded(
          child: ListView(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              children: [
                CustomTextFormField(labeltext: "Name"),
                SizedBox(height: 12),
                CustomTextFormField(labeltext: "User Name"),
                SizedBox(height: 12),
                CustomTextFormField(labeltext: "Email"),
                SizedBox(height: 12),
                CustomTextFormField(
                  labeltext: "Password",
                  isPassword: isPasswordHidden,
                  iconButton: IconButton(
                      padding: EdgeInsets.only(right: 20),
                      icon: Icon(isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      }),
                ),
                SizedBox(height: 12),
                CustomTextFormField(labeltext: "Phone No"),
              ]),
        )
      ]),
    );
  }
}
