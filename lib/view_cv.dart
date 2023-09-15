// import 'package:cv_app/edit_cv.dart';
// ignore_for_file: prefer_const_constructors

import 'package:cv_app/edit_cv.dart';
import 'package:flutter/material.dart';

class CVViewPage extends StatefulWidget {
  const CVViewPage({super.key});

  @override
  State<CVViewPage> createState() => _CVViewPageState();
}

class _CVViewPageState extends State<CVViewPage> {

  String fullName = 'Zacchaeus Oluwole';
  String slackUsername = 'Zacchaeus Oluwole';
  String githubHandle = 'Zacchaeus-Oluwole';
  String personalBio = "I'm Zacchaeus Oluwole, a Mechatronics Engineering graduate from Federal University Oye-Ekiti, Nigeria. My expertise spans embedded systems, software development, AI implementation, and specialization in Robotics and IoT. I am proficient in Python, Rust, C++ and JavaScript. I've also contributed as a researcher and assistant for final year projects in Mechatronics, Computer and Electrical/electronics Engineering. Now, I'm eager to make my mark in mobile development, channeling my skills and passion into innovative advancements. Joining the flutter community is my next exciting venture.";

  Widget createBody(String title, String body){
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Opensans',
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            body,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Opensans',
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }

  Widget createBio(String title, String body){
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Opensans',
              fontWeight: FontWeight.bold,
            ),
          ),
          SafeArea(
            child: Text(
              body,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Opensans',
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
  

  Widget Divide(){
    return Container(
      margin: EdgeInsets.only(left: 20.0,right: 20.0),
      // padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Divider( thickness: 1.0, color: Colors.black)
    );
  }

  Future<void> navPage(BuildContext context) async {
    final response = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CVEditPage(
          fullName: fullName, slackUsername: slackUsername, githubHandle: githubHandle, personalBio: personalBio,
        )
      )
    );

    if(response != null){
      setState(() {
        fullName = response['fullName'] ?? fullName;
        slackUsername = response['slackUsername'] ?? slackUsername;
        githubHandle = response['githubHandle'] ?? githubHandle;
        personalBio = response['personalBio'] ?? personalBio;
      });
    }
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
                'CV App',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Opensans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              createBody('Full Name', fullName),
              Divide(),
              createBody('Slack Username', slackUsername),
              Divide(),
              createBody('GitHub Handle', githubHandle),
              Divide(),
              createBio('Bio', personalBio),
              const Spacer(),
              Divide(),
              ElevatedButton.icon(
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
                onPressed: (){
                  navPage(context);
                },
                label: Text(
                      'Edit CV',
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