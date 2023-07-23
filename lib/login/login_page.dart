import 'package:flutter/material.dart';
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
  final dateOfBirthController = TextEditingController();
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                                  controller: lastNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                                  controller: emailAddressController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                                  "Date of Birth*",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextFormField(
                                  controller: dateOfBirthController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                                  "Nationality*",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is required";
                                    }
                                  },
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
                                  controller: countryOfResidenceController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                                  controller: mobileController,
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
    if (_formKey.currentState!.validate()) {}
  }
}
