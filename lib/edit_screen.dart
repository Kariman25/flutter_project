import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class EditContact extends StatefulWidget {
  const EditContact({super.key});

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  @override
  Widget build(BuildContext context) {
    var nameController;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            GoRouter.of(context).go('/');
          },
        ),
        title: Text('Edit Contact'),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
          ElevatedButton(onPressed: (){
            // list.add(Contact(nameController.text, phoneController.text),);
            GoRouter.of(context).go('/');
          },
            child: Text('Save'),
          ),

        ],
      ),
    );
  }
}
