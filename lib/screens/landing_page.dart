import 'package:ecommerce/screens/login_page.dart';
import 'package:ecommerce/widgets/button.dart';
import 'package:ecommerce/widgets/transparent_button.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'),
                fit: BoxFit.fitHeight)),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              CustomButton(
                text: 'Login',
                color: Colors.white,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                textColor: Colors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              TransparentButton(
                text: 'Sign Up',
                color: Colors.white,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
