import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:jiffy/jiffy.dart';

import './DocumentsDetails.dart';

import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:AtDocHUB/Model/Document.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DocumentDetialEditPage extends StatefulWidget {
  late final int docId;
  final String userName;
  final String createdBY;
  DocumentDetialEditPage(this.docId, this.userName, this.createdBY);
  @override
  _DocumentDetialEditPageState createState() =>
      _DocumentDetialEditPageState(this.docId, this.userName, this.createdBY);
}

class _DocumentDetialEditPageState extends State<DocumentDetialEditPage> {
  DocumentController documentController = Get.put(DocumentController());
  // late final int docId;
  late Future<Document> futureDocuments;
  late final int docId;
  final String userName;
  final String createdBY;
  _DocumentDetialEditPageState(this.docId, this.userName, this.createdBY);
  @override
  void initState() {
    @override
    void initState() {
      super.initState();
      futureDocuments = fetchDocument(docId);
    }

    futureDocuments = DocumentController.fetchDocumentsByID(this.docId);
  }

  final List<String> items1 = ["Open", "Closed", "Cancel", "Submitted"];
  String? selectedItem;

  late TextEditingController docTitleController = TextEditingController();
  late TextEditingController tokenNoController = TextEditingController();
  late TextEditingController addressController = TextEditingController();

  late TextEditingController cityController = TextEditingController();
  late TextEditingController docIdController = TextEditingController();
  late TextEditingController partyNameController = TextEditingController();
  late TextEditingController docTypeController = TextEditingController();
  late TextEditingController pinCodeController = TextEditingController();

  late TextEditingController durationController = TextEditingController();

  late TextEditingController rentDescController = TextEditingController();
  late TextEditingController startDateController = TextEditingController();
  late TextEditingController endDateController = TextEditingController();

  late TextEditingController docstatusController = TextEditingController();
  final List<String> items = [
    "Residential",
    "Commercial",
  ];
  String? selectedValue;

  // List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
  //   List<DropdownMenuItem<String>> _menuItems = [];
  //   for (var item in items) {
  //     _menuItems.addAll(
  //       [
  //         DropdownMenuItem<String>(
  //           value: item,
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //             child: Text(
  //               item,
  //               style: const TextStyle(
  //                 fontSize: 14,
  //               ),
  //             ),
  //           ),
  //         ),
  //         //If it's last item, we will not add Divider after it.
  //         if (item != items.last)
  //           const DropdownMenuItem<String>(
  //             enabled: false,
  //             child: Divider(),
  //           ),
  //       ],
  //     );
  //   }
  //   return _menuItems;
  // }

  // List<int> _getDividersIndexes() {
  //   List<int> _dividersIndexes = [];
  //   for (var i = 0; i < (items.length * 2) - 1; i++) {
  //     //Dividers indexes will be the odd indexes
  //     if (i.isOdd) {
  //       _dividersIndexes.add(i);
  //     }
  //   }
  //   return _dividersIndexes;
  // }

  @override
  void dispose() {
    docstatusController.dispose();
    docTypeController.dispose();
    super.dispose();
  }
//}

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        title: Text('Edit Document'),
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    DocumentsDetails(docId, this.userName)))),
      ),

      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder<Document>(
            future: futureDocuments,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Center(
                    child: SelectionArea(
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              // SizedBox(
                              //   // height:
                              //   //     MediaQuery.of(context).size.height * 0.05,
                              //   // height: 40.0,
                              //   child: TextFormField(
                              //     //  autovalidateMode:
                              //     //  AutovalidateMode.onUserInteraction,
                              //     inputFormatters: [
                              //       FilteringTextInputFormatter.digitsOnly,
                              //       LengthLimitingTextInputFormatter(10)
                              //     ],

                              //     readOnly: true,
                              //     enabled: true,
                              //     style: TextStyle(fontSize: 12),
                              //     keyboardType: TextInputType.name,
                              //     controller: docIdController =
                              //         TextEditingController(
                              //             text: '${snapshot.data!.docId}'), //,
                              //     decoration: const InputDecoration(
                              //       border: OutlineInputBorder(),
                              //       labelText: 'Document Id',
                              //       // hintText: 'Enter the  docId',
                              //     ),
                              //     validator: MultiValidator([
                              //       RequiredValidator(errorText: 'Required*')
                              //     ]),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20.0,
                              // ),
                              SizedBox(
                                // height:
                                //     MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 4,
                                  //autovalidateMode:
                                  //     AutovalidateMode.onUserInteraction,
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.allow(
                                  //       RegExp("[,-/ a-z A-Z á-ú Á-Ú 0-9]")),
                                  //   LengthLimitingTextInputFormatter(100)
                                  // ],

                                  style: TextStyle(fontSize: 12),
                                  keyboardType: TextInputType.name,
                                  controller: docTitleController =
                                      TextEditingController(
                                          text:
                                              '${snapshot.data!.docTitle}'), //,
                                  decoration: const InputDecoration(
                                    errorStyle: const TextStyle(fontSize: 0.05),
                                    border: OutlineInputBorder(),
                                    labelText: 'Document Title',
                                    hintText: 'Document Title required',
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: 'Required*')
                                  ]),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      // 0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        minLines: 1,
                                        readOnly: true,
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(14)
                                        ],
                                        // readOnly: true,
                                        // enabled: true,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.name,
                                        controller: tokenNoController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.tokenNo}'),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Token No',
                                          hintText: 'Enter the Token No',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter token No';
                                          } else if (value.length < 14) {
                                            return 'Please enter 14 digits number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        minLines: 1,
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(2)
                                        ],
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.number,
                                        controller: durationController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.duration}'),
                                        decoration: const InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          border: OutlineInputBorder(),
                                          labelText: 'Duration(M)',
                                          hintText: 'Duration required',
                                        ),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required*')
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                // height:
                                //     MediaQuery.of(context).size.height * 0.05,
                                child: TextFormField(
                                  minLines: 1,
                                  // autovalidateMode:
                                  //     AutovalidateMode.onUserInteraction,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[a-z A-Z ]")),
                                    // LengthLimitingTextInputFormatter(50)
                                  ],
                                  style: TextStyle(fontSize: 12),
                                  // textCapitalization:
                                  //     TextCapitalization.characters,

                                  keyboardType: TextInputType.name,
                                  controller: partyNameController =
                                      TextEditingController(
                                          text: '${snapshot.data!.partyName}'),
                                  decoration: const InputDecoration(
                                    errorStyle: const TextStyle(fontSize: 0.05),
                                    border: OutlineInputBorder(),
                                    labelText: 'Party Name',
                                    hintText: 'Party Name Required',
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: 'Required*')
                                  ]),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              //Container(
                              // child: Row(
                              //  child: Column(
                              // children: <Widget>[
                              //const Align(
                              //  alignment: Alignment.center,
                              //   child: SizedBox(
                              //    width: 50,
                              //  )),
                              //      vaishanvi@gmail.com

                              SizedBox(
                                // height:
                                //     MediaQuery.of(context).size.height * 0.05,
                                child: TextFormField(
                                  // cursorColor: Colors.yellow,
                                  minLines: 1,
                                  //  autovalidateMode:
                                  //  AutovalidateMode.onUserInteraction,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[,-/: a-z A-Z á-ú Á-Ú 0-9]")),
                                    LengthLimitingTextInputFormatter(100)
                                  ],
                                  style: TextStyle(fontSize: 12),
                                  keyboardType: TextInputType.name,
                                  controller: addressController =
                                      TextEditingController(
                                          text: '${snapshot.data!.address}'),
                                  decoration: const InputDecoration(
                                    errorStyle: const TextStyle(fontSize: 0.05),
                                    border: OutlineInputBorder(),
                                    labelText: 'Address',
                                    hintText: 'Address Required',
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: 'Required*')
                                  ]),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        minLines: 1,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[a-z A-Z 0-9]")),
                                          LengthLimitingTextInputFormatter(50)
                                        ],
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.name,
                                        controller: cityController =
                                            TextEditingController(
                                                text: '${snapshot.data!.city}'),
                                        decoration: const InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          border: OutlineInputBorder(),
                                          labelText: 'City',
                                          hintText: 'City Required',
                                        ),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required*')
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14.0,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      // width: ,
                                      child: TextFormField(
                                        minLines: 1,
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(6)
                                        ],
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.number,
                                        controller: pinCodeController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.pinCode}'),
                                        decoration: const InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          border: OutlineInputBorder(),
                                          labelText: 'PinCode',
                                          hintText: 'Pin Code Required',
                                        ),
                                        // validator: MultiValidator([
                                        //   RequiredValidator(
                                        //       errorText: 'Required*')
                                        // ]),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter Pin Code';
                                          } else if (value.length < 6) {
                                            return 'Please enter 6 digits number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 14.0,
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        minLines: 1,
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[- 0-9]")),
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.datetime,
                                        controller: startDateController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.startDate}'),
                                        decoration: const InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          prefixIcon:
                                              Icon(Icons.calendar_month),
                                          border: OutlineInputBorder(),
                                          labelText: 'Start Date',
                                          hintText: 'Start Date required',
                                        ),
                                        onTap: () async {
                                          await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1999),
                                            lastDate: DateTime(2101),
                                          ).then((selectedDate) {
                                            if (selectedDate != null) {
                                              startDateController.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(selectedDate);
                                            }
                                            setState(() {
                                              snapshot.data!.startDate =
                                                  startDateController.text;
                                            });
                                          });
                                          final int dur = int.parse(
                                              durationController.text);
                                          var stDate = DateTime.parse(
                                              startDateController.text);

                                          var jiffy = Jiffy(stDate)
                                              .add(months: dur, days: -1);

                                          //DateTime d = jiffy.dateTime;
                                          String s = jiffy.format('yyyy-MM-dd');
                                          // await showDatePicker(
                                          //   context: context,
                                          //   initialDate: DateTime.now(),
                                          //   firstDate: DateTime(1999),
                                          //   lastDate: DateTime(2101),
                                          // ).then((selectedDate) {
                                          //   if (selectedDate != null) {
                                          //     endDateController.text =
                                          //         DateFormat('yyyy-MM-dd')
                                          //             .format(selectedDate);
                                          //   }
                                          setState(() {
                                            snapshot.data!.duration =
                                                dur.toString();
                                            snapshot.data!.endDate =
                                                s.toString();
                                            //formatter
                                            //   //     .format(DateTime.parse(
                                            //   //         thirtyDaysFromNow
                                            //   //             .toString()));

                                            //   //   //set output date to TextField value.
                                            //  });
                                          });
                                        },
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required*')
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        minLines: 1,
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[- 0-9]")),
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.datetime,
                                        controller: endDateController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.endDate}'),
                                        decoration: const InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          // prefixIcon:
                                          //   Icon(Icons.calendar_month),
                                          border: OutlineInputBorder(),
                                          labelText: 'End Date',
                                          hintText: 'End date required',
                                        ),
                                        // onTap: () async {
                                        //   await showDatePicker(
                                        //     context: context,
                                        //     initialDate: DateTime.now(),
                                        //     firstDate: DateTime(1999),
                                        //     lastDate: DateTime(2101),
                                        //   ).then((selectedDate) {
                                        //     if (selectedDate != null) {
                                        //       endDateController.text =
                                        //           DateFormat('yyyy-MM-dd')
                                        //               .format(selectedDate);
                                        //     }
                                        //   });
                                        //},
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required*')
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 20.0,
                              ),
                              FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 12),
                                        minLines: 1,
                                        keyboardType: TextInputType.name,
                                        controller: docstatusController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.docStatus}'),
                                        decoration: InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          suffixIcon: PopupMenuButton<String>(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onSelected: (String value) {
                                              docstatusController.text = value;
                                            },

                                            // child: DropdownButton2(
                                            itemBuilder:
                                                (BuildContext context) {
                                              // PopupMenuItem(child: Text('data'));
                                              // Padding(
                                              //     padding: const EdgeInsets.only(
                                              //         top: 50, bottom: 50));

                                              return items1
                                                  .map<PopupMenuItem<String>>(
                                                      (String value) {
                                                return new PopupMenuItem(
                                                    // height: 40,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 50,
                                                      vertical: 5,
                                                    ),
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10),
                                                    child: new Text(value),
                                                    value: value);
                                              }).toList();
                                            },
                                          ),
                                          border: OutlineInputBorder(),
                                          labelText: 'Document Status',
                                          hintText: 'Document Status required',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 12),
                                        minLines: 1,
                                        controller: docTypeController =
                                            TextEditingController(
                                          text: '${snapshot.data!.docType}',
                                        ),
                                        decoration: InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          suffixIcon: PopupMenuButton<String>(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onSelected: (String value) {
                                              docTypeController.text = value;
                                            },

                                            // child: DropdownButton2(
                                            itemBuilder:
                                                (BuildContext context) {
                                              // PopupMenuItem(child: Text(''));
                                              // Padding(
                                              //     padding: const EdgeInsets.only(
                                              //         top: 50, bottom: 50));

                                              return items
                                                  .map<PopupMenuItem<String>>(
                                                      (String value) {
                                                return new PopupMenuItem(
                                                    // height: 40,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 45,
                                                      vertical: 5,
                                                    ),
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10),
                                                    child: new Text(value),
                                                    value: value);
                                              }).toList();
                                            },
                                          ),
                                          border: OutlineInputBorder(),
                                          labelText: 'Document Type',
                                          hintText: 'Document Type required',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height:
                              //       MediaQuery.of(context).size.height * 0.05,
                              //   width:
                              //       MediaQuery.of(context).size.width * 0.4,
                              //   child: TextFormField(
                              //     controller: docTypeController =
                              //         TextEditingController(
                              //       text: '${snapshot.data!.docType}',
                              //     ),
                              //     decoration: InputDecoration(
                              //       border: OutlineInputBorder(),
                              //       labelText: 'Document Type',
                              //       suffixIcon: PopupMenuButton<String>(
                              //         icon: Icon(Icons.arrow_drop_down),
                              //         onSelected: (String value) {
                              //           docTypeController.text = value;
                              //         },

                              //         // child: DropdownButton2(
                              //         itemBuilder: (BuildContext context) {
                              //           // PopupMenuItem(child: Text(''));
                              //           // Padding(
                              //           //     padding: const EdgeInsets.only(
                              //           //         top: 50, bottom: 50));

                              //           return items
                              //               .map<PopupMenuItem<String>>(
                              //                   (String value) {
                              //             return new PopupMenuItem(
                              //                 // height: 40,
                              //                 padding: EdgeInsets.symmetric(
                              //                   horizontal: 50,
                              //                   vertical: 5,
                              //                 ),
                              //                 textStyle: TextStyle(
                              //                     color: Colors.black,
                              //                     fontSize: 11),
                              //                 child: new Text(value),
                              //                 value: value);
                              //           }).toList();
                              //         },
                              //       ),

                              //       //  hintText: 'Enter the docType',
                              //     ),
                              //   ),
                              // ),

                              SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                // height:
                                //     MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  minLines: 1,
                                  //  autovalidateMode:
                                  //  AutovalidateMode.onUserInteraction,
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.allow(
                                  //       RegExp("[a-z A-Z 0-9]")),
                                  //   LengthLimitingTextInputFormatter(50)
                                  // ],
                                  style: TextStyle(fontSize: 12),
                                  keyboardType: TextInputType.text,
                                  controller: rentDescController =
                                      TextEditingController(
                                          text: '${snapshot.data!.rentDesc}'),
                                  decoration: const InputDecoration(
                                    errorStyle: const TextStyle(fontSize: 0.05),
                                    border: OutlineInputBorder(),
                                    labelText: 'Rent Description',
                                    hintText: 'Rent Description required',
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: 'Required*')
                                  ]),
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              Container(

                                  //alignment: Alignment.center,
                                  height: 35,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 3, 89, 168),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      final isValidForm =
                                          _formKey.currentState!.validate();
                                      if (isValidForm) {
                                        final int docId = this.docId;
                                        // int.parse(docIdController.text)
                                        //     .toInt();

                                        final String docTitle =
                                            docTitleController.text;
                                        final int tokenNo =
                                            int.parse(tokenNoController.text)
                                                .toInt();
                                        final String partyName =
                                            partyNameController.text;
                                        final String docType =
                                            docTypeController.text;
                                        final String city = cityController.text;
                                        final String address =
                                            addressController.text;
                                        final String pinCode =
                                            pinCodeController.text;

                                        final String duration =
                                            durationController.text;

                                        final String rentDesc =
                                            rentDescController.text;
                                        final String docStatus =
                                            docstatusController.text;

                                        final String startDate =
                                            startDateController.text;
                                        final String endDate =
                                            endDateController.text;

                                        // if (Response != true) {
                                        //   Fluttertoast.showToast(
                                        //       msg: "Data Updated Sucessfully",
                                        //       toastLength: Toast.LENGTH_LONG,
                                        //       gravity: ToastGravity.CENTER,
                                        //       timeInSecForIosWeb: 1,
                                        //       backgroundColor: Color.fromARGB(
                                        //           255, 3, 87, 156),
                                        //       textColor: Colors.white,
                                        //       fontSize: 12.0);
                                        // } else {
                                        //   Fluttertoast.showToast(
                                        //       msg:
                                        //           "Data Not Updated Sucessfully",
                                        //       toastLength: Toast.LENGTH_LONG,
                                        //       gravity: ToastGravity.CENTER,
                                        //       timeInSecForIosWeb: 1,
                                        //       backgroundColor: Color.fromARGB(
                                        //           255, 3, 87, 156),
                                        //       textColor: Colors.white,
                                        //       fontSize: 12.0);
                                        // }
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        DocumentsDetails(docId,
                                                            this.userName)));

                                        setState(() {
                                          futureDocuments = updateDocument(
                                            docId,
                                            docTitle,
                                            tokenNo,
                                            partyName,
                                            docType,
                                            address,
                                            city,
                                            pinCode,
                                            duration,
                                            rentDesc,
                                            docStatus,
                                            startDate,
                                            endDate,
                                          );
                                        });
                                        //}
                                      }
                                    },
                                    child: const Text("Save"),
                                    style: ButtonStyle(

                                        // fontWeight: FontWeight.bold,
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 3, 89, 168))),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  // ])));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }

              return Center(child: const CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
