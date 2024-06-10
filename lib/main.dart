import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteits/firebase_options.dart';
import 'package:noteits/views/login_view.dart';
import 'package:noteits/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login/':(context) => const LoginView(),
        '/register/':(context) => const RegisterView(),

      },
    ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page")
        ),

      body:  FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {

          switch (snapshot.connectionState) {
            case ConnectionState.done:
            // final user=FirebaseAuth.instance.currentUser;
            // if(user?.emailVerified ?? false){
            //   return const Text('Done');
            // }else{
              // return const VerifyEmailView();
            // }

            return const LoginView();
        default: 
        return const Text('Loading...');
          }
         
        },
      ),
    );
  }
  }


