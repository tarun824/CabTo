import 'package:cabto/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final _allPadding = Constants.allPadding;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(builder: (contex, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: _allPadding,
                color: Theme.of(context).primaryColor,
                height: constraints.minHeight * 0.30,
                width: constraints.maxWidth, //i have changed  to maxWidth here
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            splashColor: const Color.fromRGBO(148, 156, 176, 1),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.adaptive.arrow_back_rounded)),
                      ],
                    ),
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              child: ClipOval(
                                child: Image.asset("assets/images/profile.jpg"),
                              ),
                            ),
                          )
                        : Container(),
                    Text(
                      "Other Details",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
