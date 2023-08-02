import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {




  @override
  Widget build(BuildContext context) {
Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height*1,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.fill,

        ),


      ),
      child: Column(
        children:  [
          Container(
            height: size.height*0.3,

            decoration:  const BoxDecoration(
              gradient: LinearGradient(

                begin: Alignment.topRight,

                end: Alignment.bottomLeft,
                  colors: [
                    Colors.black,

                    Colors.blueAccent,
                    Colors.purple,



                  ],

              ),
            ),
          ),
        ],
      ),
    );

  }
}