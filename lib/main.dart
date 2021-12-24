import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          
        ),
        body: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: SingleChildScrollView(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child:  PersonCards()),
            )));
  }
}
class PersonCards extends StatelessWidget {
  const PersonCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {        
    return Wrap(
      children: <Widget>[PersonCard()],
            
    );
    
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 110, vertical: 25),
      child: Card(
          child: SizedBox(
        width: 700,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Expanded(
            child: IntrinsicHeight(
                child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('profilPicture'),
                    radius: 70,
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: Container(                    
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Uid: 123'),
                          const Divider(
                            height: 30,
                          ),
                          Text('Name: Placeholder'),
                          const Divider(
                            height: 30,
                          ),
                          Text("Email: Placeholder"),
                          const Divider(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      )),
    );
  }
}
