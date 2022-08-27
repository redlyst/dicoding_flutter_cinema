import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(30)),
                const Text(
                  'Hello again,\nBuddy!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 150,
                  child: Image.asset('assets/logo.jpg'),
                ),
                const Padding(padding: EdgeInsets.all(15)),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Email address',
                      hintText: 'Your email address'),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Password',
                      hintText: 'Your password'),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 40, bottom: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          }));
                        },
                        child: const Text('Sign In')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
