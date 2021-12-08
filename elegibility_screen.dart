import 'package:flutter/material.dart';
import 'package:flutter_practice/State%20Management/eligibility_screen_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Eligibility extends StatefulWidget {
  @override
  _EligibilityState createState() => _EligibilityState();
}

class _EligibilityState extends State<Eligibility> {
  TextEditingController agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityProvider>(
      create: (context) {
        return EligibilityProvider();
      },
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(child: Consumer<EligibilityProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 120.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor:
                                value.isEligable ? Colors.green : Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: agecontroller,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Age',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            animationDuration: Duration(seconds: 5),
                            disabledColor: Colors.grey.shade100,
                            elevation: 0.0,
                            height: 40,
                            child: Text(
                              'Check',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                            color: Colors.blue,
                            onPressed: () {
                              int age = int.parse(agecontroller.text.trim());
                              value.checkeligibility(age);
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Text(value.message),
                      ],
                    );
                  },
                ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
