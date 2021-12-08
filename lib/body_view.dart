import 'package:flutter/material.dart';

class BodyView extends StatefulWidget {
  String name, course, nss, level, email, id;
  int age;
  BodyView({ 
    Key? key, 
    required this.name, 
    required this.course,
    required this.age,
    required this.email,
    required this.id,
    required this.level,
    required this.nss
  }) : super(key: key);

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {  
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              )
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage('assets/Images/user.jpeg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 18
                    ),
                  ),
                ),
                Text(
                  widget.course,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15
                  ),
                ),
              ],
            )
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Is NSS'),
            subtitle: Text(widget.nss),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Level'),
            subtitle: Text(widget.level),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Age'),
            subtitle: Text(widget.age.toString()),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Email'),
            subtitle: Text(widget.email),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('ID'),
            subtitle: Text(widget.id),
          ),
        ], 
      );
  }
}