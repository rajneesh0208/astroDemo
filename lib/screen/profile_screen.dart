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

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin{
  var tabController ;
@override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context,listen:false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Image.asset(
              "assets/icon.png",
              width: 80,
            ),
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700),
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: const EdgeInsets.symmetric( horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange.shade700, width: 1),
                  color: Colors.white,
                ),
                child: Center(child: Text("Logout",style: TextStyle(color: Colors.orange.shade700),)),
              )
            ],
            bottom: TabBar(
              indicatorColor: Colors.orange.shade700,
                tabs: [
              Tab(
                child: GestureDetector(
                  onTap: (){
                    setState((){
                      profileProvider.defaultTab(0);
                    });
                  },
                  child: Text("My Profile",style: TextStyle(color: profileProvider.currentTab == 0
                      ? Colors.orange.shade700:Colors.black,fontSize: 18)),
                ),
              ),
              Tab(
                child: GestureDetector(
                  onTap: (){
                    setState((){
                       profileProvider.defaultTab(1);
                    });
                  },
                  child: Text("Order History",style: TextStyle(color: profileProvider.currentTab == 1
                      ? Colors.orange.shade700:Colors.black,fontSize: 18)),
                ),
              ),

            ]),
          ),
        ),
        body: const TabBarView(
          children: [
             BasicProfileScreen(),
             OrderScreen(),
          ],
        ),
      ),
    );
  }
}
