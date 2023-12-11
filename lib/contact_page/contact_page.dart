import 'package:flutter/material.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';

import 'package:email_validator/email_validator.dart';


class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      body: contactPageBuilder(),
      bottomNavigationBar: const FooterBar(),
    );
  }

  Column contactPageBuilder() {
    return Column(
      children: [
        SizedBox(height: 75),
        Center(
          child: Text(
            'Möglichkeiten uns zu erreichen:'
            '\n\nUnsere E-Mail: info@StudiCafe-albsig.de'
            '\nUnsere Telefon-Nr: 0000 0000'
            '\n\nOder über unser Formular:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(height: 75),
        ContactForm(),
      ],
    );
  }
}


class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  //globaler Key, zur Identifizierung der Form
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.fromLTRB(150,0,150,10),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your full name',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(150,0,150,10),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(150,0,150,10),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your feedback here',
              ),
              minLines: 10,
              maxLines: 15,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text that the user has entered by using the
                    // TextEditingController.
                    content: Text(nameController.text + " \n" + emailController.text),
                  );
                },
              );
            },
            child: const Text('Submit'),
          ),
        ]
      ),
    );
  }

}