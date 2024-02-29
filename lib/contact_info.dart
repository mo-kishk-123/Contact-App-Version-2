import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  String name;
  String phone;
  int index;
  Function delete;

  Contact(
      {super.key,
      required this.name,
      required this.phone,
      required this.delete,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name : $name",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  Text("Phone : $phone",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    delete(index);
                  },
                  icon: Icon(Icons.delete, color: Colors.red, size: 30))
            ],
          ),
        ),
      ),
    );
  }
}
