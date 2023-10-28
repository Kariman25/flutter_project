import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/addcontact.dart';
import 'package:project/edit_screen.dart';

import 'contact.dart';

void main() {
  runApp(MyApp());
}

GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: '/newcontact',
    builder: (context, state) => NewContact(),
  ),
  GoRoute(
    path: '/editcaontact',
    builder: (context, state) => EditContact(),
  ),
]);
List<Contact> list = [];
class MyApp extends StatelessWidget {
   MyApp({super.key});

   TextEditingController nameController = TextEditingController();
   TextEditingController phoneController = TextEditingController();

   @override


  Widget build(BuildContext context) {
    return MaterialApp.router(

      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts'),
        centerTitle: true,
      ),
      body:
      list.isEmpty ?
      Text('No Contact Yet..',style: TextStyle(fontSize: 22),):
      Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => Column(
            children: [
              Text(list[index].name!),
              Text(list[index].phone!),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: Text("Edit")),
                  ElevatedButton(
                      onPressed: () {}, child: Text("Delete"))
                ],
              )
            ],
          ),
          itemCount: list.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go('/newcontact');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
