import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/configs/configs.dart';
import 'package:sambaternak_baru_2024/constants/constants.dart';

import '../controllers/chat_controller.dart';

// ignore: must_be_immutable
class DetailChatView extends GetView<ChatController> {
  DetailChatView({super.key});
  final TextEditingController messageController =
      TextEditingController(text: '');

  final _auth = FirebaseAuth.instance;

  final _firestore = FirebaseFirestore.instance;
  String? messageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        toolbarHeight: getProperHeight(100),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                'assets/images/doctor-sample.jpg',
              ),
            ),
            SizedBox(
              width: getProperWidht(18),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Aris',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  'Online',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          StreamBuilder(
            stream: _firestore
                .collection('messages')
                .orderBy('time', descending: false)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final messages = snapshot.data?.docs.reversed;

              // .collection("messages")
              //     .orderBy("", "asc")

              List<MessageBubble> messageBubbles = [];
              for (var message in messages!) {
                final messageText = message.data()['text'];
                final messageSender = message.data()['sender'];

                final currentUser = _auth.currentUser?.email;
                if (currentUser == messageSender) {}
                // final messageWidget = Text(
                //   '$messageText from $messageSender',
                //   style: TextStyle(fontSize: 50.0, color: Colors.red),
                // );
                final messageBubble = MessageBubble(
                  sender: messageSender,
                  text: messageText,
                  isme: currentUser == messageSender,
                );
                messageBubbles.add(messageBubble);
              }
              return Expanded(
                child: ListView(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  children: messageBubbles,
                ),
              );
            },
          ),
          chatInput(),
        ],
      )),
    );
  }

  Widget chatInput() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: getProperWidht(150),
                    minHeight: getProperWidht(45),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.camera_alt,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        width: getProperWidht(10),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: messageController,
                          style: primaryTextStyle,
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: InputDecoration.collapsed(
                            hintText: 'Tulis Pesan...',
                            hintStyle: subtitleTextStyle,
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  //Implement send functionality.
                  _firestore.collection('messages').add({
                    'text': messageText,
                    'sender': _auth.currentUser?.email,
                    'time': DateTime.now()
                  });
                  messageController.clear();
                },
                child: const Icon(Icons.send, color: kPrimaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {super.key,
      required this.sender,
      required this.text,
      required this.isme});

  final String sender;
  final String text;
  final bool isme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            elevation: 3.0,
            borderRadius: isme
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
            color: isme ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isme ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
