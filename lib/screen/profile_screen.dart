import 'package:astrodemo/provider/cprofile_provider.dart';
import 'package:astrodemo/screen/basic_profile_screen.dart';
import 'package:astrodemo/screen/orderscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  var tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Image.asset(
            "assets/icon.png",
            width: 80,
          ),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700)),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orange.shade700, width: 1),
                color: Colors.white,
              ),
              child: Center(
                  child: Text(
                "Logout",
                style: TextStyle(color: Colors.orange.shade700),
              )),
            )
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          profileProvider.defaultTab(0);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("My Profile",
                                style: TextStyle(
                                    color: profileProvider.currentTab == 0
                                        ? Colors.orange.shade700
                                        : Colors.black,
                                    fontSize: 18)),
                            // SizedBox(height: 10,),
                            Divider(
                              height: 1,
                              color: profileProvider.currentTab == 0
                                  ? Colors.orange.shade700
                                  : Colors.transparent,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          profileProvider.defaultTab(1);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order History",
                                style: TextStyle(
                                    color: profileProvider.currentTab == 1
                                        ? Colors.orange.shade700
                                        : Colors.black,
                                    fontSize: 18)),
                            // SizedBox(height: 10,),
                            Divider(
                              height: 1,
                              color: profileProvider.currentTab == 1
                                  ? Colors.orange.shade700
                                  : Colors.transparent,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                profileProvider.currentTab == 0
                    ? const BasicProfileScreen()
                    : const OrderScreen()
              ],
            ),
          ),
        )

        /*TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          BasicProfileScreen(),
          OrderScreen(),
        ],
      ),*/
        );
  }
}
