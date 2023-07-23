import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:state_management_test/app/view/app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final dateOfBirthController = TextEditingController(text: "DD/MM/YYYY");
  final nationalityController = TextEditingController();
  final countryOfResidenceController = TextEditingController();
  final mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black, size: 18),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 10 + 75,
                  color: const Color(0xFFF5F5F5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Almost there!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Chivo",
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Complete the form below to create your Ready To Travel account.",
                          style: TextStyle(
                            fontFamily: "Chivo",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "* Mandatory",
                          style: TextStyle(
                              color: Colors.grey, fontFamily: "Chivo"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "First Name*",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  validator: (firstName) {
                                    if (firstName!.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                  controller: firstNameController,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Last Name*",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  controller: lastNameController,
                                  validator: (lastName) {
                                    if (lastName!.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Email Address*",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  controller: emailAddressController,
                                  validator: (email) {
                                    final bool emailReg = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(email ?? "");
                                    if (email!.isEmpty) {
                                      return "This field is required";
                                    }
                                    if (emailReg != true) {
                                      return "Invalid Format";
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Date of Birth*",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                        inputFormatters: [
                                          _DateFormatter(),
                                          FilteringTextInputFormatter(
                                              RegExp("[0-9]"),
                                              allow: true),
                                          LengthLimitingTextInputFormatter(10),
                                        ],
                                        controller: dateOfBirthController,
                                        decoration: InputDecoration(
                                            suffixIcon: Image.asset(
                                          "assets/images/dob/dob1.png",
                                          height: 12,
                                          width: 12,
                                        )),
                                        validator: (dob) {
                                          if (dob!.isEmpty) {
                                            return "This field is required";
                                          }
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Nationality*",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  validator: (nationality) {
                                    if (nationality!.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: nationalityController,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Country of Residence*",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  controller: countryOfResidenceController,
                                  validator: (countryOfResidence) {
                                    if (countryOfResidence!.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mobile Number*",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.search,
                                  controller: mobileController,
                                  decoration: InputDecoration(
                                    prefixIcon: SizedBox(
                                      width: 50,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            const Text(
                                              "+95",
                                              textAlign: TextAlign.center,
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Container(
                                                  width: 1,
                                                  color: Colors.black,
                                                  height: 20,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  validator: (mobileNumber) {
                                    if (mobileNumber!.isEmpty) {
                                      return "This field is required";
                                    }
                                    if (mobileNumber.length < 6 ||
                                        mobileNumber.length > 11) {
                                      return "Invalid Number";
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 20,
              top: MediaQuery.of(context).size.height / 10,
              child: Image.asset(
                "assets/images/guitar/guitar2.png",
                height: 120,
              )),
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                _createAccount();
              },
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Center(
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Create my account now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _createAccount() {
    if (_formKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: "Success");
      FocusScope.of(context).unfocus();
    }
  }
}

class _DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue prevText, TextEditingValue currText) {
    int selectionIndex;

    // Get the previous and current input strings
    String pText = prevText.text;
    String cText = currText.text;
    // Abbreviate lengths
    int cLen = cText.length;
    int pLen = pText.length;

    if (cLen == 1) {
      // Can only be 0, 1, 2 or 3
      if (int.parse(cText) > 3) {
        // Remove char
        cText = '';
      }
    } else if (cLen == 2 && pLen == 1) {
      // Days cannot be greater than 31
      int dd = int.parse(cText.substring(0, 2));
      if (dd == 0 || dd > 31) {
        // Remove char
        cText = cText.substring(0, 1);
      } else {
        // Add a / char
        cText += '/';
      }
    } else if (cLen == 4) {
      // Can only be 0 or 1
      if (int.parse(cText.substring(3, 4)) > 1) {
        // Remove char
        cText = cText.substring(0, 3);
      }
    } else if (cLen == 5 && pLen == 4) {
      // Month cannot be greater than 12
      int mm = int.parse(cText.substring(3, 5));
      if (mm == 0 || mm > 12) {
        // Remove char
        cText = cText.substring(0, 4);
      } else {
        // Add a / char
        cText += '/';
      }
    } else if ((cLen == 3 && pLen == 4) || (cLen == 6 && pLen == 7)) {
      // Remove / char
      cText = cText.substring(0, cText.length - 1);
    } else if (cLen == 3 && pLen == 2) {
      if (int.parse(cText.substring(2, 3)) > 1) {
        // Replace char
        cText = '${cText.substring(0, 2)}/';
      } else {
        // Insert / char
        cText =
            '${cText.substring(0, pLen)}/${cText.substring(pLen, pLen + 1)}';
      }
    } else if (cLen == 6 && pLen == 5) {
      // Can only be 1 or 2 - if so insert a / char
      int y1 = int.parse(cText.substring(5, 6));
      if (y1 < 1 || y1 > 2) {
        // Replace char
        cText = '${cText.substring(0, 5)}/';
      } else {
        // Insert / char
        cText = '${cText.substring(0, 5)}/${cText.substring(5, 6)}';
      }
    } else if (cLen == 7) {
      // Can only be 1 or 2
      int y1 = int.parse(cText.substring(6, 7));
      if (y1 < 1 || y1 > 2) {
        // Remove char
        cText = cText.substring(0, 6);
      }
    } else if (cLen == 8) {
      // Can only be 19 or 20
      int y2 = int.parse(cText.substring(6, 8));
      if (y2 < 19 || y2 > 20) {
        // Remove char
        cText = cText.substring(0, 7);
      }
    }

    selectionIndex = cText.length;
    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
