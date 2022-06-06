import 'package:astrodemo/provider/cprofile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicProfileScreen extends StatefulWidget {
  const BasicProfileScreen({Key? key}) : super(key: key);

  @override
  State<BasicProfileScreen> createState() => _BasicProfileScreenState();
}

class _BasicProfileScreenState extends State<BasicProfileScreen> {
  dynamic h,w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context,listen:false);
    return Container(
      height: h,
      width: w,
      margin: EdgeInsets.symmetric(horizontal: w * 0.05),
      child:Column(
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
                  onTap:(){
                    setState((){
                      profileProvider.setTab(0);
                    });
                  },
                  child: Container(
                    width: w * 0.45,
                    padding: EdgeInsets.symmetric(horizontal: w * 0.02,vertical: h * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: profileProvider.profileTab == 0?Colors.orange.shade700:Colors.white,
                    ),
                    child:  Text("Basic Profile",style: TextStyle(color: profileProvider.profileTab == 0?Colors.white: Colors.black),),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState((){
                      profileProvider.setTab(1);
                    });
                  },
                  child: Container(
                    width: w * 0.45,
                    padding: EdgeInsets.symmetric(horizontal: w * 0.02,vertical: h * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: profileProvider.profileTab == 1?Colors.orange.shade700:Colors.white,
                    ),
                    child: Text("Friends and Family Profile",style: TextStyle(color: profileProvider.profileTab == 1?Colors.white: Colors.black),),
                  ),
                ),
              ],
            ),
          ),
          profileProvider.profileTab == 0
          ? Container(
            child: Center(
              child: Text("Basic Profile"),
            ),
            )
              :Container(
            margin: EdgeInsets.symmetric(vertical: h * 0.01),
            child: SingleChildScrollView(
              child: Column(
                children: [
                        Container(
                          width:w,
                          padding: EdgeInsets.symmetric(vertical: h * 0.02,horizontal: w * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.shade100,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.account_balance_wallet,color: Colors.blue.shade700,),
                              SizedBox(width: w * 0.02,),
                              Text("Wallet Balance: \u{20B9} 0",style: TextStyle(color: Colors.blue.shade700,fontSize: 16),),
                              SizedBox(width: w * 0.01,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: w * 0.04,vertical: h * 0.01),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black,width: 1),
                                ),
                                child: Text("Add Money",style: TextStyle(color: Colors.blue.shade700,fontSize: 14,fontWeight: FontWeight.bold),),
                              )

                            ],
                          ),
                        )
                ],
              ),
            ),
          ),

        ],
      )
    );
  }
}
