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
            '\nUnsere E-Mail: info@StudiCafe-albsig.de'
            '\nUnsere Telefon-Nr: 0000 0000'
            '\nOder über unser Formular:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(height: 75),
        ContactForm(
          
        ),
      ],
    );
  }
}


class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}