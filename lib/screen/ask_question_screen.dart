import 'package:astrodemo/customwidgets/custombottomnavigation.dart';
import 'package:astrodemo/model/ask_question_model.dart';
import 'package:astrodemo/provider/askquestionprovider.dart';
import 'package:astrodemo/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customwidgets/colorconstant.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  dynamic h, w;

  List<Data>? askData;
  var reportValue;
  List<Map<String, dynamic>>? categoryList = [];
  int textCount = 0;

  var questionController = TextEditingController();
  List<String>? ideasList = [];

  @override
  void initState() {
    super.initState();
    getAskData();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    AskQuestionProvider askQuestionProvider =
        Provider.of(context, listen: false);
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/icon.png",
          width: 80,
        ),
        centerTitle: true,
        leading: Image.asset(
          "assets/hamburger.png",
          width: 30,
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: Image.asset(
              "assets/profile.png",
              width: 30,
            ),
          ),
        ],
      ),
      body: askData != null
          ? SizedBox(
              // height: h,
              width: w,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: h * 0.10),
                      child: Column(
                        children: [
                          Container(
                            width: w,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Ask a Question",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do provide personalized responses along with remedies.",
                                    style: TextStyle(
                                        color: ColorConstant.bottomGrey,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: w,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: w * 0.05),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text("Choose Category",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        value: reportValue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.black),
                                        hint: const Text(
                                          "Select",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        items: categoryList!.map((items) {
                                          return DropdownMenuItem(
                                            value: items["id"],
                                            child: Text(items["name"]),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) async {
                                          setState(() {
                                            reportValue = newValue;
                                            print(reportValue);
                                          });
                                          await askQuestionProvider.categoryId(
                                              int.parse(newValue.toString()));
                                        },
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Column(
                            children: [
                              Container(
                                width: w,
                                height: h * 0.15,
                                margin: EdgeInsets.symmetric(
                                    horizontal: w * 0.05, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstant.bottomGrey,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  controller: questionController,
                                  maxLines: null,
                                  onChanged: (value) {
                                    setState(() {
                                      textCount = value.length;
                                    });
                                  },
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  decoration: const InputDecoration(
                                    hintText: "Type a question here",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 5, bottom: 5, right: 10),
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: ColorConstant.bottomGrey),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: w * 0.05),
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.05),
                                child: Text(
                                  "$textCount/150",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ),
                            ],
                          ),
                          askQuestionProvider.suggestionList != null
                              ? Container(
                                  width: w,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: w * 0.05),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          "Ideas what to ask(Select Any)",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      Container(
                                        // height: h * 0.25,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: ListView.builder(
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      ". ${askQuestionProvider.suggestionList![index]}"),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 5),
                                                    child: Divider(
                                                      color:
                                                          Colors.grey.shade300,
                                                      thickness: 1.5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          itemCount: askQuestionProvider
                                              .suggestionList!.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                          Container(
                            width: w,
                            margin: EdgeInsets.symmetric(horizontal: w * 0.05),
                            padding: EdgeInsets.only(
                                bottom: h * 0.02),
                            child: const Text(
                                "Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorConstant.bottomGrey)),
                          ),

                          Container(
                            width: w,
                            margin: EdgeInsets.symmetric( horizontal: w * 0.05),
                            padding: EdgeInsets.symmetric(vertical: h * 0.02,horizontal: w * 0.03),
                            decoration: BoxDecoration(
                            color: Colors.pinkAccent.shade100
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 05,
                                    backgroundColor: Colors.red.shade500,
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: w *0.75,
                                    child: Text("Personilized response provided by our team of Vedic astrology within 24 hours",
                                        style:TextStyle(
                                          color: Colors.red.shade500
                                        )),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 05,
                                    backgroundColor: Colors.red.shade500,
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: w *0.75,
                                    child: Text("Personilized response provided by our team of Vedic astrology within 24 hours",
                                        style:TextStyle(
                                            color: Colors.red.shade500
                                        )),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 05,
                                    backgroundColor: Colors.red.shade500,
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: w *0.75,
                                    child: Text("Personilized response provided by our team of Vedic astrology within 24 hours",
                                        style:TextStyle(
                                            color: Colors.red.shade500
                                        )),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 05,
                                    backgroundColor: Colors.red.shade500,
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: w *0.75,
                                    child: Text("Personilized response provided by our team of Vedic astrology within 24 hours",
                                        style:TextStyle(
                                            color: Colors.red.shade500
                                        )),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 05,
                                    backgroundColor: Colors.red.shade500,
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    width: w *0.75,
                                    child: Text("Personilized response provided by our team of Vedic astrology within 24 hours",
                                        style:TextStyle(
                                            color: Colors.red.shade500
                                        )),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: w,
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: w * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Wallet Balance:\u{20B9}0",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              child: const Text(
                                "Add Money",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    child: Container(
                      width: w,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: w * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\u{20B9} 150 (1 question on Love )",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 1.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                "Ask Now",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void getAskData() async {
    AskQuestionProvider askQuestionProvider =
        Provider.of(context, listen: false);
    await askQuestionProvider.getAskQuestionData();
    if (askQuestionProvider.dataList != null) {
      setState(() {
        askData = askQuestionProvider.dataList;
        for (int i = 0; i < askQuestionProvider.dataList!.length; i++) {
          categoryList!.add({
            "name": askQuestionProvider.dataList![i].name,
            "id": askQuestionProvider.dataList![i].id,
          });
          print(categoryList);
        }
      });
    }
  }
}
