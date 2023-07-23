import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

enum Gender { male, female }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final nationalityController = TextEditingController();
  final countryOfResidenceController = TextEditingController();
  final mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Gender defaultGender = Gender.male;

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
                                      child: GestureDetector(
                                        onTap: () async {
                                          final dateOfBirth =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1920),
                                                  lastDate: DateTime(2050));
                                          if (dateOfBirth != null) {
                                            String formattedDate =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(dateOfBirth);
                                            setState(() {
                                              dateOfBirthController.text =
                                                  formattedDate; //set output date to TextField value.
                                            });
                                          }
                                        },
                                        child: TextFormField(
                                          enabled: false,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          controller: dateOfBirthController,
                                          decoration: InputDecoration(
                                              disabledBorder:
                                                  const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey)),
                                              hintText: "DD/MM/YYYY",
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
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      defaultGender =
                                                          Gender.female;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: double.infinity,
                                                    decoration: defaultGender ==
                                                            Gender.female
                                                        ? BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .blueGrey))
                                                        : const BoxDecoration(),
                                                    child: const Center(
                                                      child: Text(
                                                        "Female",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      defaultGender =
                                                          Gender.male;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: double.infinity,
                                                    decoration: defaultGender ==
                                                            Gender.male
                                                        ? BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .blueGrey))
                                                        : const BoxDecoration(),
                                                    child: const Center(
                                                      child: Text(
                                                        "Male",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
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
