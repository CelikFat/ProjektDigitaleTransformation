import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:studi_cafe/contact_page/text_fields.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/navbar_desktop.dart';

class ContactPageDesktop extends StatelessWidget {
  const ContactPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyNavbarDelegate(
              child: const NavbarDesktop(),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: contactPageBuilder(),
        ),
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }

  SingleChildScrollView contactPageBuilder() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 75),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD98E44),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.white,
                width: 8.0,
              ),
            ),
            width: double.infinity,
            child: const Center(
              child: Text(
                'Möglichkeiten uns zu erreichen:'
                '\n\nUnsere E-Mail: info@StudiCafe-albsig.de'
                '\nUnsere Telefon-Nr: 0000 0000'
                '\n\nOder über unser Formular:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 75),
          const _ContactForm(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final textController = TextEditingController();

  @override
  void dispose() {
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
        setState(() {
          _enableBtn = _formKey.currentState!.validate();
        });
      }),
      child: Column(
        children: <Widget>[
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
              RegExp regExp = RegExp(p);
              if (!regExp.hasMatch(value!)) {
                return 'Bitte gib eine gültige E-Mail an';
              }
              return null;
            },
          ),
          TextFields(
            controller: textController,
            name: "Feedback hier",
            minLines: 5,
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
                      body:
                          "Dieses Feedback stammt von ${nameController.text} mit E-Mail ${emailController.text}:\n\n\n${textController.text}",
                      subject:
                          "Kontakt-Form Submission von ${nameController.text}",
                      recipients: [emailController.text],
                      isHTML: false,
                    );

                    String platformResponse;

                    try {
                      await FlutterEmailSender.send(email);
                      platformResponse = 'success';
                      print(platformResponse);
                    } catch (error) {
                      print(error);
                      platformResponse = error.toString();
                    }
                    if (!mounted) {
                      print("Oops");
                      return;
                    }
                  })
                : null,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}