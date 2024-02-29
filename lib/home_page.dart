import 'package:contact_edit/contact_info.dart';
import 'package:contact_edit/text_field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = "Home";

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  List<Contact> contacts = [];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            "Contacts Screen",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Field(
                    hint: "Enter Name",
                    icon: Icon(Icons.edit, color: Colors.blueAccent),
                    type: TextInputType.text,
                    validator: validName,
                    controller: name),
                Field(
                    hint: "Enter Phone",
                    icon: Icon(Icons.phone, color: Colors.blueAccent),
                    type: TextInputType.phone,
                    validator: validPhone,
                    controller: phone),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10, top: 20, left: 10, bottom: 30),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: add,
                      child: Text(
                        "ADD",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                for (Widget item in contacts) item,
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    super.dispose();
  }

  String? validName(String? name) {
    if (name!.isNotEmpty) {
      return null;
    } else {
      String val = "Valid Name Please Enter Name Again";
      return val;
    }
  }

  String? validPhone(String? phone) {
    if (phone!.isNotEmpty) {
      return null;
    } else {
      String val = "Valid Name Please Enter Phone Again";
      return val;
    }
  }

  void add() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        contacts.add(Contact(
            name: name.text,
            phone: phone.text,
            delete: delete,
            index: contacts.length));
        name.clear();
        phone.clear();
      });
    }
  }

  void delete(int index) {
    setState(() {
      contacts.removeAt(index);
      for (int i = index; i < contacts.length; i++) {
        contacts[i].index = i;
      }
    });
  }
}
