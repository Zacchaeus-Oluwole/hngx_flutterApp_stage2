// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CVEditPage extends StatefulWidget {
  final String fullName;
  final String slackUsername;
  final String githubHandle;
  final String personalBio;

  const CVEditPage({super.key, required this.fullName, required this.slackUsername, required this.githubHandle, required this.personalBio});

  @override
  State<CVEditPage> createState() => _CVEditPageState();
}

class _CVEditPageState extends State<CVEditPage> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController slackUsernameController= TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController personalBioController = TextEditingController();

  @override
  void initState(){
    super.initState();
    fullNameController.text = widget.fullName;
    slackUsernameController.text = widget.slackUsername;
    githubHandleController.text = widget.githubHandle;
    personalBioController.text = widget.personalBio;
  }

  Widget editArea(String title, TextEditingController body){
    return Container(
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: TextField(
            // maxLines: null,
            // keyboardType: TextInputType.multiline,
            cursorColor: Colors.black, // Set the vertical pointer color to black
            controller: body,
            decoration: InputDecoration(
              labelText: '$title:',
              labelStyle: TextStyle(color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            )
          ),
        ),
      );
  }

  Widget editBio(String title, TextEditingController body){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            cursorColor: Colors.black, // Set the vertical pointer color to black
            controller: body,
            decoration: InputDecoration(
              labelText: '$title:',
              labelStyle: TextStyle(color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            )
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal[600],
        body: SafeArea(
          child: Column(
            children: [
              Text(
                'Edit CV',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Opensans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              editArea('Full Name', fullNameController),
              
              editArea('Slack Username', slackUsernameController),
              
              editArea('GitHub Handle', githubHandleController),
              
              editBio('Bio', personalBioController),
              // const Spacer(),
              
              ElevatedButton.icon(
                icon: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
                onPressed: (){
                  final response = {
                    'fullName': fullNameController.text,
                    'slackUsername': slackUsernameController.text,
                    'githubHandle': githubHandleController.text,
                    'personalBio': personalBioController.text
                  };
                  Navigator.pop(context,response);
                },
                label: Text(
                      'Submit',
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Opensans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal[800]),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                )
            ],
          )
        ),
      ),
    );
  }
}