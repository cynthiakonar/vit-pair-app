import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  "https://media.istockphoto.com/id/185304274/photo/kitten.jpg?s=2048x2048&w=is&k=20&c=D4pPgqpVMG1xpLxA3qNgdMNn9rxKD0zfpHLZbs7hddg=",
                              height: 325,
                              width: 325,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        height: 2,
                      ),
                      // ListTile(
                      //   onTap: () {},
                      //   selectedColor: Theme.of(context).primaryColor,
                      //   selected: true,
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   // leading: const Icon(Icons.group),
                      //   title: const Text(
                      //     "Registration Number",
                      //     style: TextStyle(color: Colors.black),
                      //   ),
                      // ),
                      itemProfile(
                          'Name', 'Sahil Agrawal', Icons.person_2_outlined),
                      const SizedBox(height: 10),
                      itemProfile('Phone', '9321407297', Icons.phone),
                      const SizedBox(height: 10),
                      itemProfile('Email', 'sahil.agrawal2022@vitstudent.ac.in',
                          Icons.mail_outline),
                      const SizedBox(height: 10),
                      // ListTile(
                      //   onTap: () {
                      //     // nextScreenReplace(
                      //     //     context,
                      //     //     ProfilePage(
                      //     //       userName: userName,
                      //     //       email: email,
                      //     //     ));
                      //   },
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   // leading: const Icon(Icons.group),
                      //   title: const Text(
                      //     "Phone Number",
                      //     style: TextStyle(color: Colors.black),
                      //   ),
                      // ),
                      // ListTile(
                      //   onTap: () {},
                      //   selectedColor: Theme.of(context).primaryColor,
                      //   selected: true,
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 5),
                      //   // leading: const Icon(Icons.group),
                      //   title: const Text(
                      //     "Email ID",
                      //     style: TextStyle(color: Colors.black),
                      //   ),
                      // ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 5),
                                  color: const Color.fromRGBO(169, 151, 252, 1)
                                      .withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10)
                            ]),
                        child: ListTile(
                          onTap: () async {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Logout"),
                                    content: const Text(
                                        "Are you sure you want to logout?"),
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
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          leading: const Icon(Icons.exit_to_app),
                          title: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: const Color.fromRGBO(169, 151, 252, 1).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10)
        ]),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      // trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
      tileColor: Colors.white,
    ),
  );
}
