import 'package:flutter/material.dart';
import 'package:machine_test/design/login/login_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        child: Consumer<LoginProvider>(builder: (context, data, _) {
          return SafeAria(
            child : Scaffold(
            body: ListView(
              padding: const EdgeInsets.all(30),
              children: [
                const Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF312782),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ).paddingSymmetric(vertical: 10),
                CusTextField(
                        hint: 'Enter email address',
                        controller: data.email,
                        prefixIcon: Icons.mail)
                    .paddingSymmetric(vertical: 10),
                CusTextField(
                  hint: 'Enter password',
                  controller: data.password,
                  prefixIcon: Icons.key,
                  suffixIcon: Icons.remove_red_eye,
                ).paddingSymmetric(vertical: 10),
                TextButton(
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Color(0xff007AFF)),
                  ),
                  onPressed: () {},
                ).paddingSymmetric(vertical: 10),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      data.login(context);
                      data.refresh();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF312782))),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ).paddingSymmetric(vertical: 10),
                ),

                Row(
                  children: [
                    const Expanded(child: Divider()),
                    const Text('Design in with')
                        .paddingSymmetric(horizontal: 5),
                    const Expanded(child: Divider()),
                  ],
                ).paddingSymmetric(vertical: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CusCard(icon: Icons.fingerprint_rounded),
                    CusCard(icon: Icons.qr_code_scanner_outlined),
                  ],
                ).paddingSymmetric(vertical: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t Have An Account?',
                      style: TextStyle(fontSize: 12),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Color(0xff007AFF)),
                        )),
                  ],
                ),
                Center(
                  child: Container(
                    width: 115,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      
                      color: const Color(0xFF312782),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.add,color: Colors.white,),
                        Text('English',style: TextStyle(color: Colors.white),),
                        Icon(Icons.arrow_drop_down,color: Colors.white,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
        }));
  }
}

class CusCard extends StatelessWidget {
  final IconData icon;

  const CusCard({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Center(
        child: Icon(
          icon,
          size: 25,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class CusTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;

  const CusTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
