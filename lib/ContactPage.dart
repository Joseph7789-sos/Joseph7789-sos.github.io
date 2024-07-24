import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Adjust the width based on the screen size
    double containerWidth = screenWidth > 600 ? screenWidth / 2 : screenWidth - 40;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: containerWidth,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "At Innovate Mobile, we place immense value on the relationships we build with our clients and anyone interested in exploring our services. Your project visions, challenges, and aspirations matter deeply to us, and we are committed to providing tailored solutions that exceed your expectations. Whether you have questions, need detailed information, or wish to discuss how we can bring your ideas to life, we're here to listen and assist. Please fill out the form below with your inquiry, and a member of our dedicated team will reach out to you promptly. Your success and satisfaction are our top priorities, and we look forward to the opportunity to support your endeavors.",
                    style: TextStyle(fontSize: screenWidth > 600 ? 20 : 16), // Adjust font size based on screen width
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Message'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
                onSaved: (value) {
                  _message = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    FirebaseFirestore.instance.collection('contactSubmissions').add({
                      'name': _name,
                      'email': _email,
                      'phoneNumber': _phoneNumber,
                      'message': _message,
                      'submittedAt': FieldValue.serverTimestamp(),
                    }).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Thank you for contacting us!'), backgroundColor: Colors.green,),
                      );
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('An error occurred. Please try again.'), backgroundColor: Colors.red,),
                      );
                    });
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              _contactBanner(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactBanner(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Logo.jpg',
            height: 60,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook),
                color: Colors.white,
                onPressed: () {
                  // Facebook page logic
                },
              ),
              SocialMediaButton.instagram(
                onTap: () {
                  // Instagram logic
                },
                color: Colors.white,
              ),
              SocialMediaButton.twitter(
                onTap: () {
                  // Twitter logic
                },
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Contact Us\nEmail: joseph@innovate-mobile.com\nPhone: +1 (470) 289-8360',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (await canLaunch("https://calendly.com/joseph-iu8/30min")) {
                await launch("https://calendly.com/joseph-iu8/30min");
              } else {
                throw "Could not launch 'https://calendly.com/joseph-iu8/30min'";
              }
            },
            child: Text('Get in Touch'),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.blueGrey[900],
            ),
          ),
        ],
      ),
    );
  }
}