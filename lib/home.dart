import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // ignore: avoid_types_as_parameter_names
  aboutAchivements(num, type) {
    return Row(
      children: [
        Text(num,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Soho",
            )),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              type,
              style: const TextStyle(
                fontFamily: "Soho",
              ),
            ))
      ],
    );
  }

  mySpec(icon, text) {
    return SizedBox(
      child: Card(
        margin: const EdgeInsets.all(0),
        color: const Color(0xff252525),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 16, fontFamily: "Soho", color: Colors.white),
            ),
          ],
        ),
      ),
      height: 115,
      width: 105,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: PopupMenuButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton(
                        child: const Text(
                          'Projects',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/project');
                        }),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: TextButton(
                        child: const Text(
                          'About Me',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/about');
                        }),
                    value: 2,
                  ),
                ]),
      ),

      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assests/bnw.png',
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.49),
              child: const Column(
                children: [
                  Text('Rudra Malvankar',
                      style: TextStyle(
                          fontFamily: "Soho",
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Software Developer (Learner)',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Soho", fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    aboutAchivements('5 ', 'Projects'),
                    aboutAchivements(' 3 ', 'Hackathon'),
                    aboutAchivements(' 30+', 'Hrs of Code'),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Specialized In',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Soho",
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(FontAwesomeIcons.android, 'Android'),
                        mySpec(FontAwesomeIcons.html5, 'Html'),
                        mySpec(FontAwesomeIcons.figma, 'Figma'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(FontAwesomeIcons.github, 'GitHub'),
                        mySpec(FontAwesomeIcons.java, 'Java'),
                        mySpec(FontAwesomeIcons.wordpress, 'WordPress'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(FontAwesomeIcons.googlePlay, 'Flutter'),
                        mySpec(FontAwesomeIcons.code, 'Dart'),
                        mySpec(FontAwesomeIcons.gamepad, 'Gamer'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),

      // body: Container(
      //   child: Stack(
      //     children: [
      //       Container(
      //         margin: EdgeInsets.only(top: 35),
      //         child: ShaderMask(
      //           shaderCallback: (rect) {
      //             return LinearGradient(
      //               begin: Alignment.center,
      //               end: Alignment.bottomCenter,
      //               colors: [Colors.black, Colors.transparent],
      //             ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      //           },
      //           blendMode: BlendMode.dstIn,
      //           child: Image.asset(
      //             'assests/bnw.png',
      //             height: 400,
      //             fit: BoxFit.contain,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         alignment: Alignment.center,
      //         margin: EdgeInsets.only(
      //             top: MediaQuery.of(context).size.height * 0.49),
      //         child: Column(
      //           children: [
      //             Text('Rudra Malvankar',
      //                 style: TextStyle(color: Colors.white, fontSize: 40)),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Text(
      //               'Software Developer',
      //               style: TextStyle(color: Colors.white, fontSize: 20),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
