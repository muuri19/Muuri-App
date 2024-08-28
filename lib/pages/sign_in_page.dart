import 'package:flutter/material.dart';
import 'package:muuri_app/components/form_signin.dart';

class SignInPage extends StatelessWidget {
  static const routeName = 'signin';
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffD1D4C9),
        surfaceTintColor: const Color(0xffD1D4C9),
        title: const Text('SIGNIN'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xff1E5128),
          ),
        ),
      ),
      backgroundColor: const Color(0xffD1D4C9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg-top-login.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Welcome Muuri',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(
                "Code is not just a job, it's the canvas where I turn ideas into reality, solving problems and building a better future one line at a time.",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
              const FormSignin(),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Term and privacy policy',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
