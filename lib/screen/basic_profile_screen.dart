import 'package:astrodemo/customwidgets/custom_text_field.dart';
import 'package:astrodemo/customwidgets/custom_widget.dart';
import 'package:astrodemo/provider/cprofile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class BasicProfileScreen extends StatefulWidget {
  const BasicProfileScreen({Key? key}) : super(key: key);

  @override
  State<BasicProfileScreen> createState() => _BasicProfileScreenState();
}

class _BasicProfileScreenState extends State<BasicProfileScreen> {
  dynamic h, w;

  final _formKey = GlobalKey<FormState>();
  bool showAddRelative = false;
  var nameController = TextEditingController();
  var ddController = TextEditingController();
  var mmController = TextEditingController();
  var yearController = TextEditingController();
  var hhController = TextEditingController();
  var minController = TextEditingController();
  var placeController = TextEditingController();

  var genderList = ["MALE", "FEMALE"];

  var selectGender ;
  var selectRelation ;

  var RelationList = [
    "Father",
    "Mother",
    "Brother",
    "Sister",
    "Spouse",
    "Son",
    "Daughter",
    "Father in law",
    "Mother in law",
    "Brother in law",
    "Sister in law",
    "Daughter in law",
    "Uncle",
    "Aunt",
    "Friend",
    "Fiance",
  ];

  int relationId = 0;

  String placeId = "";

  bool showRelativeDetails = false;

  @override
  void initState() {
    super.initState();
    getAllRelativeData();
    // getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return Container(
        width: w,
        margin: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                padding: EdgeInsets.symmetric(vertical: h * 0.02),
                margin: EdgeInsets.symmetric(vertical: h * 0.01),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          profileProvider.setTab(0);
                        });
                      },
                      child: Container(
                        width: w * 0.45,
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.02, vertical: h * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: profileProvider.profileTab == 0
                              ? Colors.orange.shade700
                              : Colors.white,
                        ),
                        child: Text(
                          "Basic Profile",
                          style: TextStyle(
                              color: profileProvider.profileTab == 0
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          profileProvider.setTab(1);
                        });
                      },
                      child: Container(
                        width: w * 0.45,
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.02, vertical: h * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: profileProvider.profileTab == 1
                              ? Colors.orange.shade700
                              : Colors.white,
                        ),
                        child: Text(
                          "Friends and Family Profile",
                          style: TextStyle(
                              color: profileProvider.profileTab == 1
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              profileProvider.profileTab == 0
                  ? Container(
                      child:  Center(
                        child: Column(
                          children: [
                            const Text("Basic Profile"),
                           /* GestureDetector(
                              onTap: () {
                                setState(() {
                                  showAddRelative = true;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: h * 0.03),
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.02,
                                    horizontal: w * 0.04),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange.shade700,
                                ),
                                child: const Text(
                                  "+ Add New Profile",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    )
                  : showAddRelative == true
                      ? addNewProfile()
                      /*: showRelativeDetails == true
                      ? showRelativeDetails()*/:
              Consumer<ProfileProvider>(
                          builder: (context, value, _) {
                            if(value.relativeData != null ){
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: h * 0.01),
                                child: Column(
                                  children: [
                                    Container(
                                      width: w,
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.02,
                                          horizontal: w * 0.02),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue.shade100,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.account_balance_wallet,
                                            color: Colors.blue.shade700,
                                          ),
                                          SizedBox(
                                            width: w * 0.02,
                                          ),
                                          Text(
                                            "Wallet Balance: \u{20B9} 0",
                                            style: TextStyle(
                                                color: Colors.blue.shade700,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            width: w * 0.01,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.04,
                                                vertical: h * 0.01),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black, width: 1),
                                            ),
                                            child: Text(
                                              "Add Money",
                                              style: TextStyle(
                                                  color: Colors.blue.shade700,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: h * 0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: w * 0.20,
                                            child: Text(
                                              "Name",
                                              style: TextStyle(
                                                  color: Colors.blue.shade700,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.20,
                                            child: Text(
                                              "DOB",
                                              style: TextStyle(
                                                  color: Colors.blue.shade700,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.15,
                                            child: Text(
                                              "TOB",
                                              style: TextStyle(
                                                  color: Colors.blue.shade700,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          SizedBox(
                                            width: w * 0.20,
                                            child: Text(
                                              "Relation",
                                              style: TextStyle(
                                                  color: Colors.blue.shade700,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade400,
                                                blurRadius: 1.5,
                                                spreadRadius: 1,
                                              )
                                            ],
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 1),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.02,
                                              vertical: h * 0.03),
                                          margin:
                                          EdgeInsets.only(bottom: h * 0.015),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: w * 0.01),
                                                width: w * 0.15,
                                                child: Text(
                                                  "${value.relativeData!.allRelatives![index].fullName}",
                                                  style: TextStyle(
                                                      color: Colors.grey.shade400,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              SizedBox(
                                                width: w * 0.20,
                                                child: Text(
                                                  "${value.relativeData!.allRelatives![index].birthDetails!.dobDay}-${value.relativeData!.allRelatives![index].birthDetails!.dobMonth}-${value.relativeData!.allRelatives![index].birthDetails!.dobYear}",
                                                  style: TextStyle(
                                                      color: Colors.grey.shade400,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              SizedBox(
                                                width: w * 0.15,
                                                child: Text(
                                                  "${value.relativeData!.allRelatives![index].birthDetails!.tobHour}:${value.relativeData!.allRelatives![index].birthDetails!.tobMin}",
                                                  style: TextStyle(
                                                      color: Colors.grey.shade400,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              SizedBox(
                                                width: w * 0.15,
                                                child: Text(
                                                  "${value.relativeData!.allRelatives![index].relation}",
                                                  style: TextStyle(
                                                      color: Colors.blue.shade700,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async{
                                                  setState(() {

                                                    value.updateProfile(
                                                        true,
                                                        value.relativeData!.allRelatives![index].uuid.toString());
                                                    showAddRelative = true;
                                                    // showRelativeDetails = true;

                                                  });
                                                },
                                                child: Container(
                                                  // margin: EdgeInsets.only(
                                                  //     left: w * 0.1),
                                                  width: w * 0.05,
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.orange.shade700,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  deleteRelative(value
                                                      .relativeData!
                                                      .allRelatives![index]
                                                      .uuid.toString());
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: w * 0.05),
                                                  width: w * 0.05,
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      itemCount: value
                                          .relativeData!.allRelatives!.length,
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showAddRelative = true;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: h * 0.03),
                                        padding: EdgeInsets.symmetric(
                                            vertical: h * 0.02,
                                            horizontal: w * 0.04),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.orange.shade700,
                                        ),
                                        child: const Text(
                                          "+ Add New Profile",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            else{
                              return const Center(
                                child: Text("No Relatives Added"),
                              );
                            }

                          },
                        )
            ],
          ),
        ));
  }

  void getAllRelativeData() async {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    await profileProvider.getAllRelativeData();
  }

  deleteRelative(String s) async {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: const Text("Do you really want to delete?"),
              actions: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await profileProvider.deleteRelative(s);
                          Navigator.pop(context);
                          if (profileProvider.deleteMessage.isNotEmpty) {
                            Fluttertoast.showToast(
                                msg: profileProvider.deleteMessage,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            await profileProvider.getAllRelativeData();
                          }
                        },
                        child: Container(
                          width: w * 0.30,
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.02, vertical: h * 0.02),
                          margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.shade700,
                          ),
                          child: const Center(
                              child: Text(
                            "Yes",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(ctx);
                        },
                        child: Container(
                          width: w * 0.30,
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.02, vertical: h * 0.02),
                          margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.shade700,
                          ),
                          child: const Center(
                              child: Text(
                            "No",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          )),
                        ),
                      ),
                    ]),
              ],
            ));
  }

  addNewProfile()  {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    if(profileProvider.updateStatus == true){
     getUserDetails();
    }

    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          showAddRelative = false;
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  SizedBox(
                    width: w * 0.1,
                  ),
                  Text(
                    profileProvider.updateStatus == true
                        ? "Update Profile"
                        : "Add New Profile",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              CustomWidget().textWidget("Name", Colors.grey.shade500, 16),
              CustomTextField(
                hint: "",
                inputType: TextInputType.name,
                validText: "Enter Valid Name",
                controller: nameController,
                textLen: 50,
                width: w,
                onChangedFunc: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      nameController.text = value;
                      nameController.selection = TextSelection.fromPosition(
                          TextPosition(offset: nameController.text.length));
                    });
                  }
                },
              ),
              SizedBox(
                height: h * 0.03,
              ),
              CustomWidget()
                  .textWidget("Date of Birth", Colors.grey.shade500, 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextField(
                        hint: "DD",
                        inputType: TextInputType.name,
                        validText: "Invalid DD",
                        controller: ddController,
                        textLen: 2,
                        width: w * 0.25,
                        onChangedFunc: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              ddController.text = value;
                              ddController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: ddController.text.length));
                            });
                          }
                        },
                      ),
                      Text(
                        "${ddController.text.length}/2",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextField(
                        hint: "MM",
                        inputType: TextInputType.name,
                        validText: "Invalid MM",
                        controller: mmController,
                        textLen: 2,
                        width: w * 0.25,
                        onChangedFunc: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              mmController.text = value;
                              mmController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: mmController.text.length));
                            });
                          }
                        },
                      ),
                      Text(
                        "${mmController.text.length}/2",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextField(
                        hint: "YYYY",
                        inputType: TextInputType.name,
                        validText: "Invalid YYYY",
                        textLen: 4,
                        controller: yearController,
                        width: w * 0.25,
                        onChangedFunc: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              yearController.text = value;
                              yearController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: yearController.text.length));
                            });
                          }
                        },
                      ),
                      Text(
                        "${yearController.text.length}/4",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              CustomWidget()
                  .textWidget("Time of Birth", Colors.grey.shade500, 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextField(
                        hint: "HH",
                        inputType: TextInputType.name,
                        validText: "Invalid DD",
                        controller: hhController,
                        textLen: 2,
                        width: w * 0.25,
                        onChangedFunc: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              hhController.text = value;
                              hhController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: hhController.text.length));
                            });
                          }
                        },
                      ),
                      Text(
                        "${hhController.text.length}/2",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextField(
                        hint: "MM",
                        inputType: TextInputType.name,
                        validText: "Invalid MM",
                        controller: minController,
                        textLen: 2,
                        width: w * 0.25,
                        onChangedFunc: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              minController.text = value;
                              minController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: minController.text.length));
                            });
                          }
                        },
                      ),
                      Text(
                        "${minController.text.length}/2",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  Container(
                    width: w * 0.25,
                    margin: EdgeInsets.only(top: h * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(0, 1),
                        )
                      ],
                    ),
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: w * 0.02, vertical: h * 0.025),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              profileProvider.setAmPm("AM");
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.02, vertical: h * 0.025),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: profileProvider.amPm == "AM"
                                  ? Colors.blueAccent.shade400
                                  : Colors.white,
                            ),
                            width: w * 0.125,
                            child: Center(
                                child: Text(
                              "AM",
                              style: TextStyle(
                                  color: profileProvider.amPm == "AM"
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              profileProvider.setAmPm("PM");
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.02, vertical: h * 0.025),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: profileProvider.amPm == "PM"
                                  ? Colors.blueAccent.shade400
                                  : Colors.white,
                            ),
                            width: w * 0.125,
                            child: Center(
                                child: Text(
                              "PM",
                              style: TextStyle(
                                  color: profileProvider.amPm == "PM"
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              CustomWidget()
                  .textWidget("Place of Birth", Colors.grey.shade500, 16),
              Container(
                // height: 50,
                width: w,
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: TextFormField(
                  controller: placeController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Enter Place of Birth",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      )),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  onFieldSubmitted: (value) async {
                    if (value.isNotEmpty) {
                      await profileProvider.getCity(value);
                      if (profileProvider.cityDetailList != null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Select City"),
                                content: setupAlertDialoadContainer(),
                              );
                            });
                      }
                      setState(() {
                        placeController.text = value;
                        placeController.selection = TextSelection.fromPosition(
                            TextPosition(offset: placeController.text.length));
                      });
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select a city';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomWidget()
                          .textWidget("Gender", Colors.grey.shade500, 16),
                      Container(
                          height: 50,
                          width: w * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          alignment: AlignmentDirectional.centerStart,
                          margin: EdgeInsets.symmetric(vertical: h * 0.01),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                isExpanded: true,
                                value: selectGender,
                                hint: const Text(
                                  "Gender",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                items: genderList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                                iconSize: 28,
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectGender = value.toString();
                                  });
                                },
                              ))))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomWidget()
                          .textWidget("Relation", Colors.grey.shade500, 16),
                      Container(
                          height: 50,
                          width: w * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          alignment: AlignmentDirectional.centerStart,
                          margin: EdgeInsets.symmetric(vertical: h * 0.01),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                isExpanded: true,
                                value: selectRelation,
                                hint: const Text(
                                  "Relation",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                items: RelationList.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                                iconSize: 28,
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                ),
                                onChanged: (value) {
                                  for (int i = 0;
                                      i < RelationList.length;
                                      i++) {
                                    if (RelationList[i] == value) {
                                      relationId = i + 1;
                                      print("relation id: $relationId");
                                    }
                                  }
                                  setState(() {
                                    selectRelation = value.toString();
                                  });
                                },
                              ))))
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate() &&
                      profileProvider.amPm.isNotEmpty) {
                    await profileProvider.addNewRelative(
                        nameController.text,
                        ddController.text,
                        mmController.text,
                        yearController.text,
                        hhController.text,
                        minController.text,
                        profileProvider.amPm,
                        relationId,
                        placeController.text,
                        selectGender,
                        selectRelation,
                        placeId);

                    if (profileProvider.successMsg.isNotEmpty) {
                      setState(() {
                        showAddRelative = false;
                        getAllRelativeData();
                      });
                    }
                  }
                },
                child: Container(
                  width: w * 0.4,
                  margin: EdgeInsets.symmetric(
                      vertical: h * 0.03, horizontal: w * 0.25),
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.02, horizontal: w * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange.shade700,
                  ),
                  child: Center(
                    child: const Text(
                      "Save Changes",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setupAlertDialoadContainer() {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    return Container(
      height: h * 0.40,
      width: w * 0.90,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: profileProvider.cityDetailList!.length,
        itemBuilder: (context, item) {
          return ListTile(
            title: Text(
                profileProvider.cityDetailList![item].placeName!.toString()),
            onTap: () {
              setState(() {
                placeController.text =
                    profileProvider.cityDetailList![item].placeName!.toString();
                placeId = profileProvider.cityDetailList![item].placeId!;
                print("placeId: $placeId");
                Navigator.pop(context);
              });
            },
          );
        },
      ),
    );
  }

   getUserDetails() {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    for (int i = 0;
        i < profileProvider.relativeData!.allRelatives!.length;
        i++) {
      if (profileProvider.userUid ==
          profileProvider.relativeData!.allRelatives![i].uuid) {
        setState(() {
          nameController.text =
              profileProvider.relativeData!.allRelatives![i].fullName!;
          ddController.text = profileProvider
              .relativeData!.allRelatives![i].birthDetails!.dobDay
              .toString();
          mmController.text = profileProvider
              .relativeData!.allRelatives![i].birthDetails!.dobMonth
              .toString();
          yearController.text = profileProvider
              .relativeData!.allRelatives![i].birthDetails!.dobYear
              .toString();
          hhController.text = profileProvider
              .relativeData!.allRelatives![i].birthDetails!.tobHour
              .toString();
          minController.text = profileProvider
              .relativeData!.allRelatives![i].birthDetails!.tobMin
              .toString();
          placeController.text = profileProvider
              .relativeData!.allRelatives![i].birthPlace!.placeName.toString();
          // selectGender = profileProvider.relativeData!.allRelatives![i].gender;
          selectRelation =
              profileProvider.relativeData!.allRelatives![i].relation;
          relationId = profileProvider.relativeData!.allRelatives![i].relationId!;
          placeId = profileProvider.relativeData!.allRelatives![i].birthPlace!.placeId.toString();
          profileProvider.amPm = profileProvider
              .relativeData!.allRelatives![i].birthDetails!.meridiem
              .toString();
        });
      }
    }
  }
}
