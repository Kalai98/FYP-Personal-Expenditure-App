import 'package:fyp/views/First_view.dart';
import 'package:fyp/views/sign_up_View.dart';
import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'widget/providerWidget.dart';
import 'views/navigation_view.dart';

//MAIN PAGE
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final primaryColor = const Color(0xFFCE93D8);

  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: "App",
        color: primaryColor,
        theme: ThemeData(

        ),
        home: HomeController(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => HomeController(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
           return signedIn ? Home() : FirstView();

        }
        return CircularProgressIndicator();
      },
    );
  }

}