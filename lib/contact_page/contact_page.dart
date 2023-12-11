import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:studi_cafe/contact_page/text_fields.dart';
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
  // globaler Key, zur Identifizierung der Form
  final _formKey = GlobalKey<FormState>();
  // damit die Form erst submitted werden kann, wenn alles korrekt ausgefüllt ist
  bool _enableBtn = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    nameController.dispose();
    emailController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: (() {
        // wenn der User Text eingibt/löscht, überprüfe die Validierung der Form
        setState(() {
          _enableBtn = _formKey.currentState!.validate();
        });
      }),
      child: Column(
        children: <Widget> [
          TextFields(
            controller: nameController,
            name: "Vorname und Nachname hier",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Bitte gib deinen vollen Namen an";
              }
              return null;
            },
          ),
          TextFields(
            controller: emailController,
            name: "E-Mail Adresse hier",
            validator: (value) {
              String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = new RegExp(p);
              if (!regExp.hasMatch(value!)) {
                return 'Bitte gib eine gültige E-Mail an';
              }
              return null;
            },
          ),
          TextFields(
            controller: textController,
            name: "Feedback hier",
            minLines: 10,
            maxLines: 15,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Bitte schreibe dein Feedback für uns hier";
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _enableBtn
              ? (() async {
                  final Email email = Email(
                    body: "Dieses Feedback stammt von ${nameController.text} mit E-Mail ${emailController.text}:\n\n\n${textController.text}",
                    subject: "Kontakt-Form Submission von ${nameController.text}",
                    recipients: ['speiervi@hs-albsig.de'],
                    isHTML: false,
                  );
                  await FlutterEmailSender.send(email);
                })
              : null,
            child: const Text('Submit'),
          ),
        ]
      ),
    );
  }

}