import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ict_family_demo/widgets/header.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  String username,session,role;

  submit() {
    final form = _fbKey.currentState;

    if (form.validate()) {
      form.save();
      SnackBar snackbar = SnackBar(content: Text("Welcome $username!"));
      _scaffoldKey.currentState.showSnackBar(snackbar);
      Timer(Duration(seconds: 2), () {
        Navigator.pop(context, username);
      });
    }
  }

  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: header(context,
          titleText: "Set up your profile", removeBackButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
//                  SizedBox(
//                    height: 15.0,
//                  ),
//                Padding(
//                  padding: EdgeInsets.all(16.0),
//                  child: Container(
//                    child: Form(
//                      key: _userNameKey,
//                      autovalidate: true,
//                      child: TextFormField(
//                        validator: (val) {
//                          if (val.trim().length < 3 || val.isEmpty) {
//                            return "Username too short";
//                          } else if (val.trim().length > 12) {
//                            return "Username too long";
//                          } else {
//                            return null;
//                          }
//                        },
//                        onSaved: (val) => username = val,
//                        decoration: InputDecoration(
//                          border: OutlineInputBorder(),
//                          labelText: "Username",
//                          labelStyle: TextStyle(fontSize: 15.0),
//                          hintText: "Must be at least 3 characters",
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
                FormBuilder(
                  key: _fbKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: FormBuilderTextField(
                            attribute: "name",
                            validators: [
                              FormBuilderValidators.minLength(3),
                              FormBuilderValidators.maxLength(20),
                              FormBuilderValidators.required(),
                            ],
                            onChanged: (val) => username = val,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(fontSize: 22.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                gapPadding: 5.0,
                              ),
                              contentPadding: EdgeInsets.all(15.0),
                              hintText: "Must be at least 3 characters",
                              hintStyle: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: FormBuilderTextField(
                            attribute: "session",
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.maxLength(7),
                              FormBuilderValidators.minLength(7),
                            ],
                            onChanged: (val) => session = val,
                            decoration: InputDecoration(
                              labelText: 'Session',
                              labelStyle: TextStyle(fontSize: 22.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                gapPadding: 5.0,
                              ),
                              contentPadding: EdgeInsets.all(15.0),
                              hintText: "Example: 2014-15",
                              hintStyle: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FormBuilderDropdown(
                          attribute: "gender",
                          decoration: InputDecoration(
                            labelText: "Gender",
                            labelStyle: TextStyle(fontSize: 22.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              gapPadding: 5.0,
                            ),
                            contentPadding: EdgeInsets.all(15.0),
                          ),
                          initialValue: 'Male',
                          hint: Text('Select Gender'),
                          validators: [FormBuilderValidators.required()],
                          items: ['Male', 'Female', 'Other']
                              .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text("$gender")
                          )).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FormBuilderDropdown(
                          attribute: "role",
                          decoration: InputDecoration(
                            labelText: "You are a ",
                            labelStyle: TextStyle(fontSize: 22.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              gapPadding: 5.0,
                            ),
                            contentPadding: EdgeInsets.all(15.0),
                          ),
                          //initialValue: 'Male',
                          hint: Text('Select what you are'),
                          validators: [FormBuilderValidators.required()],
                          items: ['Student', 'Teacher', 'Alumni','Staff']
                              .map((role) => DropdownMenuItem(
                              value: role,
                              child: Text("$role")
                          )).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FormBuilderDropdown(
                          attribute: "bloodGroup",
                          decoration: InputDecoration(
                            labelText: "Blood Group",
                            labelStyle: TextStyle(fontSize: 22.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              gapPadding: 5.0,
                            ),
                            contentPadding: EdgeInsets.all(15.0),
                          ),
                          initialValue: 'A(+)ve',
                          hint: Text('Select Gender'),
                          validators: [FormBuilderValidators.required()],
                          items: ['A(+)ve', 'A(-)ve', 'B(+)ve','B(-)ve','AB(+)ve','AB(-)ve','O(+)ve','O(-)ve']
                              .map((bg) => DropdownMenuItem(
                              value: bg,
                              child: Text("$bg")
                          )).toList(),
                        ),
                      ),

                    ],
                  ),
                ),
                GestureDetector(
                  onTap: submit,
                  child: Container(
                    height: 50.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
