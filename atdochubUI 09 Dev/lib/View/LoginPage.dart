// import 'package:AtDocHUB/Controller/LoginController.dart';
// import 'package:AtDocHUB/Model/User.dart';
// import 'package:AtDocHUB/View/homePageAdmin.dart';
// import 'package:flutter/material.dart';

// import 'package:AtDocHUB/View/BottomNavigationBar.dart';
// import 'package:email_validator/email_validator.dart';

// class LoginPage extends StatefulWidget {
//   final String email = '';
//   final String password = '';
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
//   TextEditingController emailController = TextEditingController();
//   TextEditingController pwController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   final String email = '';
//   final String password = '';

//   String useremail = '';
//   String userpassword = '';

//   List<UserLogin> logs = [];

//   Future init() async {
//     final logs = await LoginController.login(email, password);
//     setState(() => this.logs = logs);
//     print(logs[0].userEmail);
//     print(logs[0].userPassword);
//   }

//   void loginAdmin(email, password) {
//     if (logs[0].userEmail == emailController.text &&
//         logs[0].userPassword == password) {
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (_) => homePageAdmin()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final emailField = TextFormField(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       controller: emailController,
//       validator: (email) {
//         if (email == null || email.isEmpty) {
//           return 'Please enter Email';
//         }
//         return null;
//       },
//       obscureText: false,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Email",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//     );

//     final passwordField = TextFormField(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       validator: (password) {
//         if (password == null || password.isEmpty) {
//           return 'Please Enter Password';
//         }
//         return null;
//       },
//       obscureText: true,
//       controller: pwController,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Password",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//     );

//     final loginButon = Material(
//         elevation: 5.0,
//         borderRadius: BorderRadius.circular(30.0),
//         color: Color.fromARGB(255, 3, 89, 168),
//         child: MaterialButton(
//             minWidth: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             onPressed: () {
//               loginAdmin(useremail, userpassword);
//               //  final isValidForm = _formKey.currentState!.validate();

//               //  print('respone email ${logs[0].userEmail}');
//               //  if (isValidForm) {
//               //if (eml == email && psw == pasw) {

//               // }
//               // }
//             },
//             child: Text("Login",
//                 textAlign: TextAlign.center,
//                 style: style.copyWith(
//                     color: Colors.white, fontWeight: FontWeight.bold))));

//     const buttonForgotPassword = TextButton(
//         child: Text(
//           'Forgot Password',
//           style: TextStyle(color: Colors.grey, fontSize: 16),
//         ),
//         onPressed: null);

//     return Scaffold(
//         body: Form(
//       key: _formKey,
//       child: SingleChildScrollView(
//         child: Center(
//           child: Container(
//             margin: EdgeInsets.all(30),
//             // color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 130,
//                   ),
//                   SizedBox(
//                     height: 155.0,
//                     child: Image.asset(
//                       "assets/AtDocHublogo.png",
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   const SizedBox(height: 45.0),
//                   emailField,
//                   const SizedBox(height: 25.0),
//                   passwordField,
//                   const SizedBox(
//                     height: 35.0,
//                   ),
//                   loginButon,
//                   const SizedBox(
//                     height: 15.0,
//                   ),
//                   buttonForgotPassword,
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }

import 'dart:async';
import 'package:AtDocHUB/Model/User.dart';
import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:AtDocHUB/View/homePageAdmin.dart';
import 'package:flutter/material.dart';
import 'package:AtDocHUB/Controller/LoginController.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ForgotPassword.dart';
//import 'package:flutter_inappwebview';

class LoginPage extends StatelessWidget {
  static String userRole = '';
  @override
  Widget build(BuildContext context) {
    const appTitle = 'User Login';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text(appTitle),
        // ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // String? validateEmail(String? value) {
  //   String pattern =
  //       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  //       r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
  //       r"{0,253}[a-zA-Z0-9])?)*$";
  //   RegExp regex = RegExp(pattern);
  //   if ( //value == null || value.isEmpty ||
  //       regex.hasMatch(value!))
  //     return 'Enter a valid email address';
  //   else
  //     return null;
  // }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  late Future<UserLogin> futureLogin;

  static var role;

  late Future _futureAuth;
  final _formKey = GlobalKey<FormState>();
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  List<UserLogin> logs = [];
  List<UserLogin> userRole = [];
  String email = '';

  String pass = '';

  // LoginController loginController = Get.put(LoginController());

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  String playerid = '';
  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId('e89acaa4-5388-4e3a-bd69-44d197bdcbd7');
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    print('The player id from main.dart ...........${osUserID}');
    setState(() {
      this.playerid = osUserID!;
    });
    print('this.playerid from main.dart ${this.playerid}');
    //  Preferences.setOnesignalUserId(osUserID);
    //OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      debugPrint('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
      // setState(() {
      //   // Navigator.of(context).pushAndRemoveUntil(
      //   //     MaterialPageRoute(
      //   //         builder: (BuildContext context) => AddNewDocument()),
      //   //     (Route<dynamic> route) => false);
      // });
    });
  }
  // Future init() async {
  //   //_futureAuth = loginController.login(email, pass);
  //   //var response = LoginController.login(email, pass);
  //   // final logs = await LoginController.login(email, pass);
  //   setState(() => this.logs = logs);
  //   print(logs[0].useremail);
  //   print(logs[0].userpassword);
  // }

  // void loginAdmin(String email, String pass) {
  //   //print(email);
  //   // print(pass);
  //   if (email == logs[0].userEmail && pass == logs[0].userPassword) {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (_) => homePageAdmin()));
  //  // }
  // }

  @override
  Widget build(BuildContext context) {
    //String email = emailController.text;
    //String pasw = pwController.text;
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      child: Form(
          //  autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 130,
                        ),
                        Center(
                          child: SizedBox(
                              height: 155,
                              child: Image.asset(
                                "assets/image/AtDocHublogo.png",
                                fit: BoxFit.contain,
                              )),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        TextFormField(
                          controller: emailController,
                          style: style,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(height: 25.0),
                        TextFormField(
                          obscureText: true,
                          controller: pwController,
                          style: style,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Password is required*'),
                          ]),
                          decoration: InputDecoration(

                              //isDense: true,
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(height: 35.0),
                        MaterialButton(
                            height: 55,
                            child: Text("Login",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            minWidth: MediaQuery.of(context).size.width,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            color: Color.fromARGB(255, 3, 89, 168),
                            // padding:
                            //     const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () async {
                              _formKey.currentState?.validate();
                              final isValidForm =
                                  _formKey.currentState!.validate();
                              if (isValidForm) {
                                final String email = emailController.text;

                                final String pass = pwController.text;
                                final pid = this.playerid.toString();
                                List<UserLogin> res =
                                    await LoginController.login(
                                        email, pass, pid);
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('email', emailController.text);
                                prefs.setString('uRole', res[0].role);

                                // if (res != null) {
                                // final SharedPreferences sharedPreferences =
                                //     await SharedPreferences.getInstance();
                                // sharedPreferences.setString(
                                //     'email', emailController.text);
                                // Get.to(homePageAdmin());
                                // }
                                // window.localStorage
                                //     .setItem("Role", "${res[0].role}");
                                role == res[0].role;
                                print(res[0].role);
                                if (email != res[0].userEmail ||
                                    pass != res[0].userPassword) {
                                  // Fluttertoast.showToast(
                                  //     msg: "Invalid Login Details",
                                  //     toastLength: Toast.LENGTH_LONG,
                                  //     gravity: ToastGravity.CENTER,
                                  //     timeInSecForIosWeb: 2,
                                  //     backgroundColor:
                                  //         Color.fromARGB(255, 3, 87, 156),
                                  //     textColor: Colors.white,
                                  //     fontSize: 12.0);
                                } else {
                                  if (res[0].role == 'ADMIN') {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => homePageAdmin()));
                                  } else {
                                    if (res[0].role == 'SUPPORTEXCUTIVE') {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => homePageAdmin()));
                                    } else {
                                      if (res[0].role == 'FIELDEXCUTIVE') {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    AppointmentPageFE()));
                                      }
                                    }

                                    // print(email);
                                    // List<UserLogin> res =
                                    //     LoginController.login(email, pass)
                                    //         as List<UserLogin>;
                                    // print(res[0].role);
                                    // //userRole.add(res);
                                    // print(res[0].role);

                                    // if (res != []) {
                                    // if (email != res[0].userEmail) {

                                    //   } else {
                                    //     if (res[0].role == 'ADMIN') {
                                    //       Navigator.of(context).push(
                                    //           MaterialPageRoute(
                                    //               builder: (_) => homePageAdmin()));
                                    //     }
                                    //   }
                                    // }

                                    //var request = LoginController.login(email, pasw);

                                    // String eml = logs[0].userEmail;
                                    // String psw = logs[0].userPassword;
                                    // print('response++++ ${response.runtimeType}');
                                    //  print(' email +++++ ${logs[0].userEmail}');
                                    // final isValidForm =
                                    //     _formKey.currentState!.validate();
                                    //  print('respone email ${logs[1].userEmail}');
                                    //    if (isValidForm) {

                                    // if (logs != []) {
                                    //   String userRole = logs[0].role;
                                    //   print('The Role ${logs[0].role}');
                                    //   if (logs[0].role.toUpperCase() == 'ADMIN') {
                                    //   Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (_) => homePageAdmin()));
                                    //   } else {
                                    //     if (logs[0].role.toUpperCase() ==
                                    //         'SUPPORT EXCECUTIVE') {
                                    //       Navigator.of(context).push(MaterialPageRoute(
                                    //           builder: (_) => homePageAdmin()));
                                    //     } else {
                                    //       if (logs[0].role.toUpperCase() ==
                                    //           'FIELDEXCECUTIVE') {
                                    //         Navigator.of(context).push(
                                    //             MaterialPageRoute(
                                    //                 builder: (_) =>
                                    //                     AppointmentPageFE()));

                                    //   Fluttertoast.showToast(
                                    //       msg: "Enter Valid Email",
                                    //       toastLength: Toast.LENGTH_LONG,
                                    //       gravity: ToastGravity.CENTER,
                                    //       timeInSecForIosWeb: 1,
                                    //       backgroundColor: Color.fromARGB(255, 3, 87, 156),
                                    //       textColor: Colors.white,
                                    //       fontSize: 12.0);
                                    // } else {
                                    //   if (logs[0].userPassword != pwController.text) {
                                    //     Fluttertoast.showToast(
                                    //         msg: "Enter Valid Password",
                                    //         toastLength: Toast.LENGTH_LONG,
                                    //         gravity: ToastGravity.CENTER,
                                    //         timeInSecForIosWeb: 1,
                                    //         backgroundColor: Color.fromARGB(255, 3, 87, 156),
                                    //         textColor: Colors.white,
                                    //         fontSize: 12.0);
                                    //   } else {
                                    //     if (logs[0].userEmail != emailController.text &&
                                    //         logs[0].userPassword != pwController.text) {
                                    //       Fluttertoast.showToast(
                                    //           msg: "Enter Valid Credentials",
                                    //           toastLength: Toast.LENGTH_LONG,
                                    //           gravity: ToastGravity.CENTER,
                                    //           timeInSecForIosWeb: 1,
                                    //           backgroundColor: Color.fromARGB(255, 3, 87, 156),
                                    //           textColor: Colors.white,
                                    //           fontSize: 12.0);
                                    //     }
                                    //   }
                                    // }
                                    //   } else {
                                    //     if (logs == []) {
                                    //       Fluttertoast.showToast(
                                    //           msg: "User Doesn't Exists",
                                    //           toastLength: Toast.LENGTH_LONG,
                                    //           gravity: ToastGravity.CENTER,
                                    //           timeInSecForIosWeb: 1,
                                    //           backgroundColor:
                                    //               Color.fromARGB(255, 3, 87, 156),
                                    //           textColor: Colors.white,
                                    //           fontSize: 12.0);
                                    //     }
                                    //   }
                                    // }
                                    // ;

                                    // Card(
                                    //         //color: Color.fromARGB(255, 233, 246, 252),
                                    //         elevation: 3,
                                    //         child: ListTile(
                                    //           title: Text(
                                    //             doc.docTitle,
                                    //             style: const TextStyle(
                                    //               fontSize: 12.0,
                                    //               fontWeight: FontWeight.bold,
                                    //             ),
                                    //           ),
                                    //           subtitle: Text(
                                    //             doc.tokenNo,
                                    //           ),
                                    //           trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                                    //           onTap: () {
                                    //             Navigator.push(
                                    //                 context,
                                    //                 MaterialPageRoute(
                                    //                     builder: (context) => DocumentsDetails((doc.docId))));
                                    //           },
                                    //         ),

                                    //   }
                                    // })
                                    //  ]))

                                    //   print('response ++++ ${response}');

                                    // if (response.)
                                    // else {
                                    //   print('ERROR');
                                    // } else {

                                    // loginAdmin(email, pass);
                                    // Fluttertoast.showToast(
                                    //     msg: "Login Failed",
                                    //     toastLength: Toast.LENGTH_LONG,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIosWeb: 1,
                                    //     backgroundColor:
                                    //         Color.fromARGB(255, 3, 87, 156),
                                    //     textColor: Colors.white,

                                    // else {
                                    //   Navigator.of(context).push(MaterialPageRoute(
                                    //       builder: (_) => homePageAdmin()));
                                    // }
                                  }
                                }
                              }
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ForgotPassword()));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 58, 57, 57),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ])))),
    );
  }

  // login(email, pasw);
  // loginAdmin(email, pass);
  // {
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (_) => homePageAdmin()));
  // }
  //  loginAdmin(email, pasw);
  //  login(email,pasw);

  // if (res != null) {
  //   print("under if");
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (_) => homePageAdmin()));
  // } else {
  //   print("else box");
  // }

  // If the form is valid, display a snackbar. In the real world,
  // you'd often call a server or save the information in a database.

  // Navigator.push(
  //     context, MaterialPaNavigator.of(context).push(MaterialPageRoute(
  //     builder: (_) => homePageAdmin()));
  // child:

  // ),

  // Center(
  //   child: TextButton(
  //       child: Text(
  //         'Forgot Password',
  //         style:
  //             TextStyle(color: Colors.grey, fontSize: 16),
  //       ),
  //       onPressed: null),
  // ),

  // Widget buildLogin(UserLogin user) => Container(
  //         child: Column(children: [
  //       TextFormField(
  //         controller: emailController,
  //         style: style,

  //         decoration: InputDecoration(
  //             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
  //             hintText: "Email",
  //             border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(32.0))),

  //         // The validator receives the text that the user has entered.
  //         // validator: (email) {
  //         //   if (email == null || email.isEmpty) {
  //         //     return 'Please enter Email';
  //         //   }
  //         //   return null;
  //         // }
  //       ),
  //       SizedBox(height: 25.0),
  //       TextFormField(
  //         controller: pwController,
  //         style: style,
  //         decoration: InputDecoration(
  //             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
  //             hintText: "Password",
  //             border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(32.0))),

  //         // The validator receives the text that the user has entered.
  //         // validator: (pw) {
  //         //   if (pw == null || pw.isEmpty) {
  //         //     return 'Please enter Password';
  //         //   }
  //         //   return null;
  //         // },
  //       ),
}
