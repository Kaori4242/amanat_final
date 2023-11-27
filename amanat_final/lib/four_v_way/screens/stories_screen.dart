import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  // final ImagePicker imagePicker = ImagePicker();

  // List<XFile>? imageFileList = [];

  // Future getGall() async {
  //   var img = await image.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     file = File(img!.path);
  //   });
  // }

  // void selectImages() async {
  //   final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
  //   if (selectedImages!.isNotEmpty) {
  //     imageFileList!.addAll(selectedImages);
  //   }
  //   setState(() {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AzattyQ"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  // Container(
                  //   height: 140,
                  //   width: 140,
                  //   color: Colors.black,
                  //   child: file == null
                  //       ? Icon(
                  //           Icons.image,
                  //           size: 50,
                  //         )
                  //       : Image.file(
                  //           file!,
                  //           fit: BoxFit.fill,
                  //         ),
                  // ),

                  // ],
                  // ),
                  //     Expanded(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: GridView.builder(
                  //           itemCount: imageFileList!.length,
                  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 3
                  //           ),
                  //           itemBuilder: (BuildContext context, int index) {
                  //             return Image.file(File(imageFileList![index].path), fit: BoxFit.cover);
                  //           }
                  //       ),
                  //     )
                  // )
                ],
              ),
            ),
            ElevatedButton(
              child: const Row(
                children: [
                  Icon(
                    Icons.add_box_outlined,
                    color: Colors.white,
                    size: 32,
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
                // selectImages();
              },
            ),
          ],
        ),
      ),
    );
  }
}
