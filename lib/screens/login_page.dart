import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/widgets/button.dart';
import 'package:ecommerce/widgets/button_with_icon.dart';
import 'package:ecommerce/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    void showErrorMessage() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        content: const Text(
          "Please fill required fields",
          style: TextStyle(color: Colors.red),
        ),
        elevation: 10,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.white)),
      ));
    }

    void showEmailErrorMessage() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        content: const Text(
          "Invalid email address!",
          style: TextStyle(color: Colors.red),
        ),
        elevation: 10,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.white)),
      ));
    }

    void showPasswordErrorMessage() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        content: const Text(
          "Password must be at least 8 characters long!",
          style: TextStyle(color: Colors.red),
        ),
        elevation: 10,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.white)),
      ));
    }

    void success() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    }

    bool validEmail() {
      return emailController.text.contains("@gmail.com") ? true : false;
    }

    bool validPassword() {
      return passwordController.text.length >= 8 ? true : false;
    }

    void onTap() {
      if (validEmail() || validPassword()) {
        success();
      } else if (!validEmail()) {
        showEmailErrorMessage();
      } else if (!validPassword()) {
        showPasswordErrorMessage();
      } else {
        showErrorMessage();
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/icon_banner.jpg",
                width: size.width - 200,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Welcome!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Please login or sign up to continue our app",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            const Spacer(),
            const Text(
              "Email",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CustomTextfield(
                obscureText: false,
                normalBorderColor: Colors.white,
                focusedBorderColor: Colors.black12,
                controller: emailController,
                keyboardType: TextInputType.emailAddress),
            const Text(
              "Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CustomTextfield(
                obscureText: true,
                normalBorderColor: Colors.white,
                focusedBorderColor: Colors.black12,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    CustomButton(
                      text: "Login",
                      color: Colors.black,
                      textColor: Colors.white,
                      onTap: onTap,
                    ),
                    const Text(
                      "or",
                      style: TextStyle(color: Colors.grey),
                    ),
                    ButtonWithIcon(
                      text: "Login with FaceBook",
                      color: const Color.fromRGBO(66, 103, 178, 1),
                      textColor: Colors.white,
                      icon: Icons.facebook,
                      iconColor: Colors.white,
                      onTap: onTap,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWithIcon(
                      text: "Continue with Google",
                      color: const Color.fromARGB(255, 239, 239, 239),
                      textColor: Colors.black,
                      icon: Icons.phone_android,
                      iconColor: Colors.black,
                      onTap: onTap,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWithIcon(
                      text: "Continue with Apple",
                      color: const Color.fromARGB(255, 239, 239, 239),
                      textColor: Colors.black,
                      icon: Icons.apple,
                      iconColor: Colors.black,
                      onTap: onTap,
                    )
                  ],
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
