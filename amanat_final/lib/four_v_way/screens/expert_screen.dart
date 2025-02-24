import 'package:amanat_final/four_v_way/constants/constants.dart';
import 'package:amanat_final/four_v_way/providers/chats_provider.dart';
import 'package:amanat_final/four_v_way/providers/models_provider.dart';
import 'package:amanat_final/four_v_way/widgets/chat_widget.dart';
import 'package:amanat_final/four_v_way/widgets/text_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:developer';

import '../widgets/start_button.dart';

class ExpertScreen extends StatefulWidget {
  const ExpertScreen({super.key});

  @override
  State<ExpertScreen> createState() => _ExpertScreenState();
}

class _ExpertScreenState extends State<ExpertScreen> {
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;

  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  // String _text = 'Press the button and start speaking';
  // double _confidence = 1.0;

  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    _speech = stt.SpeechToText();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  // void _listen() async {
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //       onStatus: (val) => print('onStatus: $val'),
  //       onError: (val) => print('onError: $val'),
  //     );
  //     if (available) {
  //       setState(() => _isListening = true);
  //       _speech.listen(
  //         onResult: (val) => setState(() {
  //           _text = val.recognizedWords;
  //           if (val.hasConfidenceRating && val.confidence > 0) {
  //             _confidence = val.confidence;
  //           }
  //         }),
  //       );
  //     }
  //   } else {
  //     setState(() => _isListening = false);
  //     _speech.stop();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text("Azattyq", style: TextStyle(color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          StartButton(
            isTyping: _isTyping,
            textEditingController: textEditingController,
            focusNode: focusNode,
          ),
        ],
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
              Flexible(
                child: ListView.builder(
                  controller: _listScrollController,
                  itemCount: chatProvider.getChatList.length,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      msg: chatProvider.getChatList[index].msg,
                      chatIndex: chatProvider.getChatList[index].chatIndex,
                      shouldAnimate: chatProvider.getChatList.length - 1 == index,
                    );
                  },
                ),
              ),
              if (_isTyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                ),
              ],
              const SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: focusNode,
                          style: const TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) async {
                            await sendMessageFCT(
                                modelsProvider: modelsProvider,
                                chatProvider: chatProvider);
                          },
                          decoration: const InputDecoration.collapsed(
                              hintText: "Напишите Сообщение",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await sendMessageFCT(
                            modelsProvider: modelsProvider,
                            chatProvider: chatProvider,
                          );
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                      // StartButton(
                      //   isTyping: _isTyping,
                      //   textEditingController: textEditingController,
                      //   focusNode: focusNode,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "You cant send multiple messages at a time",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;
        // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        chatProvider.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
          msg: msg, chosenModelId: modelsProvider.getCurrentModel);
      setState(() {});
    } catch (error) {
      log("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}