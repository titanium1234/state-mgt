import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_mgt/body_view.dart';
import 'package:state_mgt/custom_card.dart';
import 'package:state_mgt/student.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key? key }) : super(key: key);
  Student profile = Student();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Student profile = widget.profile;
    bool isNss = false;
    GlobalKey<FormState> formKey = GlobalKey<FormState>(); 
    TextEditingController courseController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController levelController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController idController = TextEditingController();
    String age = '';

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.blue,
            )
          ],
        ),
      ),
      endDrawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (context){
              return Form(
                key: formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    TextFormField(
                      controller: idController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Student ID',
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'ID is required';
                        }else if(value.length != 13){
                          return 'Should be exactly 13 characters';
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Student name',
                        border: OutlineInputBorder()
                      ),
                      validator: (text){
                        if(text!.isEmpty){
                          return 'Name is required';
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: courseController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Student course',
                        border: OutlineInputBorder()
                      ), 
                      validator: (userInput){
                        if(userInput!.isEmpty){
                          return 'Course is required';
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Student age',
                        border: OutlineInputBorder()
                      ),
                      validator: (data){
                        if(data!.isEmpty){
                          return 'Name is required';
                        }else if(int.tryParse(data) != null){
                          return 'Age shouldnt be a number';
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: levelController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Student Level',
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Name is required';
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Student email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Email is required';
                        }
                      },
                      onChanged: (data){
                        age = data;
                      },
                    ),
                    const SizedBox(height: 10),
                    StatefulBuilder(
                      builder: (context, setState) {
                      return Center(
                        child: CheckboxListTile(
                          title: const Text('Are you Nss'),
                          value: isNss,
                          onChanged: (bool? value) {
                            setState(() {
                              isNss = value!;
                            });
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    CustomCard(),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          setState(() {
                            profile.setStudentCourse = courseController.text;
                            profile.setStudentAge = int.parse(ageController.text);
                            profile.setStudentId = idController.text;
                            profile.setStudentLevel = levelController.text;
                            profile.setStudentName = nameController.text;
                          });
                        }
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(16)
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue[900]
                        ),
                        elevation: MaterialStateProperty.all(30)
                      ),
                      child: const Text(
                        'SUBMIT',
                        style: TextStyle(color: Colors.white),
                      )
                    )
                  ],
                )
              );
            }
          );
        },
        child: const Icon(Icons.edit),
        backgroundColor: Colors.blue[900],
      ),
      appBar: AppBar(
        centerTitle: true,
        // leading: const Icon(
        //   Icons.arrow_back,
        // ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20
          ),
        ),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        // actions:  const [
        //   IconButton(
        //     icon: Icon(Icons.settings, color: Colors.white), 
        //     onPressed: null,
        //   )
        // ],
      ),
      body: BodyView(
        name: profile.getStudentName, 
        course: profile.getStudentCourse,
        age: profile.getStudentAge,
        nss: profile.getStudentIsNss,
        level: profile.getStudentLevel, 
        id: profile.getStudentID, 
        email: profile.getStudentEmail,
      )
    );
  }
}