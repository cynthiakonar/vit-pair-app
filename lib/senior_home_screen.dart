// import 'package:chatapp_firebase/helper/helper_function.dart';
// import 'package:chatapp_firebase/pages/auth/login_page.dart';
// import 'package:chatapp_firebase/pages/profile_page.dart';
// import 'package:chatapp_firebase/pages/search_page.dart';
// import 'package:chatapp_firebase/service/auth_service.dart';
// import 'package:chatapp_firebase/service/database_service.dart';
// import 'package:chatapp_firebase/widgets/group_tile.dart';
// import 'package:chatapp_firebase/widgets/widgets.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vitpair/settings_screen.dart';
import 'package:vitpair/utils/colors.dart';
import 'package:vitpair/widgets/group_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String userName = "";
  String email = "";
  // AuthService authService = AuthService();
  Stream? groups;
  bool _isLoading = false;
  String groupName = "";

  @override
  void initState() {
    super.initState();
    // gettingUserData();
  }

  late List<Widget> _widgetOptions = <Widget>[
    groupList(),
    Text(
      'Search',
    ),
    Text(
      'Info',
    ),
    SettingsPage(),
  ];
  // string manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  // gettingUserData() async {
  //   await HelperFunctions.getUserEmailFromSF().then((value) {
  //     setState(() {
  //       email = value!;
  //     });
  //   });
  //   await HelperFunctions.getUserNameFromSF().then((val) {
  //     setState(() {
  //       userName = val!;
  //     });
  //   });
  //   // getting the list of snapshots in our stream
  //   await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
  //       .getUserGroups()
  //       .then((snapshot) {
  //     setState(() {
  //       groups = snapshot;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              // await authService.signOut();
                              // Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //         builder: (context) => const LoginPage()),
                              //     (route) => false);
                            },
                            icon: const Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.logout_rounded,
              ))
        ],
        elevation: 0,
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 186, 171, 255),
        title: const Text(
          textAlign: TextAlign.left,
          "VIT Pair",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            haptic: true,
            gap: 8,
            // onTabChange: ,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            color: Colors.grey,
            activeColor: darkerpurple,
            tabBackgroundColor:
                Color.fromARGB(255, 186, 171, 255).withOpacity(0.5),
            padding: const EdgeInsets.all(16),

            tabs: const [
              GButton(
                icon: Icons.message_rounded,
                text: "Chats",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.info_outline_rounded,
                text: "Info",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      // drawer: Drawer(
      //     child: ListView(
      //   padding: const EdgeInsets.symmetric(vertical: 50),
      //   children: <Widget>[
      //     Icon(
      //       Icons.account_circle,
      //       size: 150,
      //       color: Colors.grey[700],
      //     ),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     Text(
      //       userName,
      //       textAlign: TextAlign.center,
      //       style: const TextStyle(fontWeight: FontWeight.bold),
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //     const Divider(
      //       height: 2,
      //     ),
      //     ListTile(
      //       onTap: () {},
      //       selectedColor: Theme.of(context).primaryColor,
      //       selected: true,
      //       contentPadding:
      //           const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //       leading: const Icon(Icons.group),
      //       title: const Text(
      //         "Chats",
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     ),
      //     ListTile(
      //       onTap: () {
      //         // nextScreenReplace(
      //         //     context,
      //         //     ProfilePage(
      //         //       userName: userName,
      //         //       email: email,
      //         //     ));
      //       },
      //       contentPadding:
      //           const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //       leading: const Icon(Icons.group),
      //       title: const Text(
      //         "Profile",
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     ),
      //     ListTile(
      //       onTap: () async {
      //         showDialog(
      //             barrierDismissible: false,
      //             context: context,
      //             builder: (context) {
      //               return AlertDialog(
      //                 title: const Text("Logout"),
      //                 content: const Text("Are you sure you want to logout?"),
      //                 actions: [
      //                   IconButton(
      //                     onPressed: () {
      //                       Navigator.pop(context);
      //                     },
      //                     icon: const Icon(
      //                       Icons.cancel,
      //                       color: Colors.red,
      //                     ),
      //                   ),
      //                   IconButton(
      //                     onPressed: () async {
      //                       // await authService.signOut();
      //                       // Navigator.of(context).pushAndRemoveUntil(
      //                       //     MaterialPageRoute(
      //                       //         builder: (context) => const LoginPage()),
      //                       //     (route) => false);
      //                     },
      //                     icon: const Icon(
      //                       Icons.done,
      //                       color: Colors.green,
      //                     ),
      //                   ),
      //                 ],
      //               );
      //             });
      //       },
      //       contentPadding:
      //           const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //       leading: const Icon(Icons.exit_to_app),
      //       title: const Text(
      //         "Logout",
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     )
      //   ],
      // )),
      body: _widgetOptions.elementAt(_selectedIndex),
      // groupList(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     popUpDialog(context);
      //   },
      //   elevation: 0,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 30,
      //   ),
      // ),
    );
  }

  popUpDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((context, setState) {
            return AlertDialog(
              title: const Text(
                "Create a group",
                textAlign: TextAlign.left,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor),
                        )
                      : TextField(
                          onChanged: (val) {
                            setState(() {
                              groupName = val;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(20)),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor),
                  child: const Text("CANCEL"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (groupName != "") {
                      setState(() {
                        _isLoading = true;
                      });
                      //   DatabaseService(
                      //           uid: FirebaseAuth.instance.currentUser!.uid)
                      //       .createGroup(userName,
                      //           FirebaseAuth.instance.currentUser!.uid, groupName)
                      //       .whenComplete(() {
                      //     _isLoading = false;
                      //   });
                      //   Navigator.of(context).pop();
                      //   showSnackbar(
                      //       context, Colors.green, "Group created successfully.");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor),
                  child: const Text("CREATE"),
                )
              ],
            );
          }));
        });
  }

  Widget groupList() {
    return StreamBuilder(
      stream: groups,
      builder: (context, AsyncSnapshot snapshot) {
        // make some checks
        if (snapshot.hasData) {
          if (snapshot.data['groups'] != null) {
            if (snapshot.data['groups'].length != 0) {
              return ListView.builder(
                itemCount: snapshot.data['groups'].length,
                itemBuilder: (context, index) {
                  int reverseIndex = snapshot.data['groups'].length - index - 1;
                  return GroupTile(
                      groupId: getId(snapshot.data['groups'][reverseIndex]),
                      groupName: getName(snapshot.data['groups'][reverseIndex]),
                      userName: snapshot.data['fullName']);
                },
              );
            } else {
              return noGroupWidget();
            }
          } else {
            return noGroupWidget();
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor),
          );
        }
      },
    );
  }

  noGroupWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              popUpDialog(context);
            },
            child: Icon(
              Icons.add_circle,
              color: Colors.grey[700],
              size: 75,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "You've not joined any groups, tap on the add icon to create a group or also search from top search button.",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
