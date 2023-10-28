import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/main.dart';
import 'package:project/contact.dart';

class NewContact extends StatefulWidget {
   const NewContact({super.key});
  @override

  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {


  File? _image;
  Future getImage() async{
    final image = await ImagePicker().pickImage(source:ImageSource.gallery);
    if(image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {
    var nameController;
    var phoneController;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            GoRouter.of(context).go('/');
          },
        ),
        title: Text('New Contact'),
        centerTitle: true,
      ),

      body: Column(
        children: [
          CustomButton(icon: Icons.image, onClick:getImage),
          Container(
              child: TextField(
                controller: nameController,
            decoration:const InputDecoration(
              icon: Icon(Icons.account_circle),
                border: OutlineInputBorder(
                ),
                hintText: 'Name',
            ),
          )),
          Container(child: new TextField(
            decoration:new InputDecoration(
              icon: new Icon(Icons.account_circle),
              border: OutlineInputBorder(
              ),
              hintText: 'Last Name',
            ),
          )),
          Container(child: TextField(
            decoration:new InputDecoration(
              icon: new Icon(Icons.work_rounded),
              border: OutlineInputBorder(),
              hintText: 'Work',
            ),
          )),
          Container(child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            maxLength: 11,
            decoration:const InputDecoration(
              icon: Icon(Icons.phone),
              border: OutlineInputBorder(),
              hintText: 'Telephone',
            ),
          )),
          Container(child: TextField(
            decoration:new InputDecoration(
              icon: new Icon(Icons.email),
              border: OutlineInputBorder(),
              hintText: 'Email',
            ),
          )),
          Container(child: TextField(
            decoration:new InputDecoration(
              icon: new Icon(Icons.web),
              border: OutlineInputBorder(),
              hintText: 'Web',
            ),
          )),
          Center(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  // list.add(Contact(nameController.text, phoneController.text),);
                  GoRouter.of(context).go('/');
                },
                  child: Text('Save'),
                ),

                ElevatedButton(onPressed: (){
                  GoRouter.of(context).go('/editcaontact');
                  Navigator.push;
                },
                  child: Text('Edit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


Widget CustomButton({
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Center(
    child: Container(
      margin: EdgeInsets.all(30.0),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            )
          ),
        ),
        onPressed: onClick,
        child: Center(
          child: Icon(icon),
        ),
      ),
    ),
  );
}
