// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:app_11/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditprofileState();
}

class _EditprofileState extends State<EditProfile> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isPasswordHidden = true;
  final url = "http://10.0.2.2:8000/api/account/users/5/";
  Future<void> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      "accept": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzYzMzA1MTc3LCJpYXQiOjE3NjMyMTg3NzcsImp0aSI6IjE0MTQyNDk2MTRiNTQyZGQ4YTc1OTI0N2QwYThlNGQ4IiwidXNlcl9pZCI6IjUifQ.xut-tRY2pO6hmNcBYMkYCqi--dP-cX9q5-vP_AtT-I0",
    });
    print("status: ${response.statusCode}");
    print("body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        usernameController.text = data["username"] ?? "";
        emailController.text = data["email"] ?? "";
        phoneNoController.text = data["phone"] ?? "";
        addressController.text = data["address"] ?? "";
      });
    } else {
      print("Error: ${response.statusCode}");
    }
  }

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
                CustomTextFormField(
                  labeltext: "User Name",
                  mycontroller: usernameController,
                ),
                SizedBox(height: 12),
                CustomTextFormField(
                  labeltext: "Email",
                  mycontroller: emailController,
                ),
                SizedBox(height: 12),
                CustomTextFormField(
                  labeltext: "Address",
                  mycontroller: addressController,
                ),
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
                CustomTextFormField(
                  labeltext: "Phone No",
                  mycontroller: phoneNoController,
                ),
              ]),
        )
      ]),
    );
  }
}
