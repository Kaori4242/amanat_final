import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text(
          "Azattyq",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/chat_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            child: Image.asset("assets/stories/one.png", width: MediaQuery.of(context).size.width / 2.5,),
                          ),),

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(

                            child: Image.asset("assets/stories/two.png", width: MediaQuery.of(context).size.width / 2.5,),
                          ),),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        //   child: Container(
                        //     child: Image.asset("assets/stories/three.png"),
                        //   ),),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            child: Image.asset("assets/stories/four.png", width: MediaQuery.of(context).size.width / 2.5,),
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            child: Image.asset("assets/stories/five.png", width: MediaQuery.of(context).size.width / 2.5,),
                          ),),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        //   child: Container(
                        //     child: Image.asset("assets/stories/six.png"),
                        //   ),),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            child: Image.asset("assets/stories/seven.png", width: MediaQuery.of(context).size.width / 2.5,),
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            child: Image.asset("assets/stories/eight.png", width: MediaQuery.of(context).size.width / 2.5,),
                          ),),
                        // Padding(
                        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        // child: Container(
                        //   child: Image.asset("assets/stories/nine.png"),
                        // ),),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            child: Image.asset("assets/stories/three.png", width: MediaQuery.of(context).size.width / 2.5,),
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Container(
                            child: Image.asset("assets/stories/six.png", width: MediaQuery.of(context).size.width / 2.5,),
                          ),),

                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 56),
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add_box_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      Text(
                        "Новый момент",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}