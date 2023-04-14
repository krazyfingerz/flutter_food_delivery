import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../sharedcomponents/changelanguage.dart';
import '../../../sharedcomponents/input.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool editmode = false;
  void fetchProfile() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return editmode == false
        ? RefreshIndicator(
            onRefresh: () async {
              setState(() {
                fetchProfile();
              });
            },
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                children: [
                  SizedBox(
                      height: 56,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                ChangeLanguage(),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.notifications,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            InkWell(
                              child: const Icon(
                                Icons.edit,
                                size: 28,
                                color: Colors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  editmode = !editmode;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green, width: 3)),
                            child: Text(
                              "€ 100.00",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.greenAccent[400],
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green, width: 3)),
                              child: const Icon(
                                Icons.add,
                                size: 28,
                                color: Colors.green,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.red[50],
                        child: const Icon(Icons.person),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(AppLocalizations.of(context)!.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 1),
                            Text(AppLocalizations.of(context)!.phone1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 1),
                            Text(AppLocalizations.of(context)!.phone2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 3),
                            Text(AppLocalizations.of(context)!.email,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.home, size: 30, color: Colors.blue),
                      Expanded(
                          child: Text(
                              AppLocalizations.of(context)!.deliveryaddress1,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold))),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.business, size: 30, color: Colors.blue),
                      Expanded(
                          child: Text(
                              AppLocalizations.of(context)!.deliveryaddress2,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold))),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(AppLocalizations.of(context)!.history,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  // SizedBox(
                  //   height: 200,
                  //   child: ListView.builder(
                  //     physics: const BouncingScrollPhysics(),
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: List.from(snapshot.data!["orderhistory"]).length,
                  //     itemBuilder: ((context, i){
                  //       return SizedBox(
                  //         height: 100,
                  //         width: 200,
                  //         child: Center(child: Text(List.from(snapshot.data!["orderhistory"])[i], style: const TextStyle(fontSize: 12),)),
                  //       );
                  //     }),
                  //   ),
                  // ),
                  const SizedBox(height: 240),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            child: const Icon(Icons.logout,
                                size: 20, color: Colors.red),
                            onTap: () {
                              // Auth().signOut();
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          )
        : ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.edit_off,
                        color: Colors.black54,
                      ),
                      onTap: () {
                        setState(() {
                          editmode = !editmode;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.red[50],
                  child: const Icon(Icons.person),
                ),
                const SizedBox(height: 10),
                Input(
                  prefixicon: Icons.person,
                  color: Colors.red,
                  label: AppLocalizations.of(context)!.name,
                  onchanged: (name) {},
                ),
                Input(
                  isphone: true,
                  color: Colors.red,
                  prefixicon: Icons.phone,
                  label: AppLocalizations.of(context)!.phone1,
                  onchanged: (p1) {},
                ),
                Input(
                  isphone: true,
                  color: Colors.red,
                  prefixicon: Icons.phone_android,
                  label: AppLocalizations.of(context)!.phone2,
                  onchanged: (p2) {},
                ),
                Input(
                  isemail: true,
                  color: Colors.red,
                  prefixicon: Icons.email,
                  label: AppLocalizations.of(context)!.email,
                  onchanged: (email) {},
                ),
                Input(
                  color: Colors.red,
                  prefixicon: Icons.home,
                  label: AppLocalizations.of(context)!.deliveryaddress1,
                  onchanged: (add1) {},
                ),
                Input(
                  color: Colors.red,
                  prefixicon: Icons.business,
                  label: AppLocalizations.of(context)!.deliveryaddress2,
                  onchanged: (add2) {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
  }
}
