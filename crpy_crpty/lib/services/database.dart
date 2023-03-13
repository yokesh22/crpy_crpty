import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseConnection {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  saveUser(phoneNo) async {
    await firestore
        .collection('user')
        .doc(phoneNo)
        .set({'phone': phoneNo, 'createdAt': DateTime.now()});
  }

  getUser(String currentuser) async {
    List items = [];
    await firestore
        .collection('user')
        .where('phone', isNotEqualTo: currentuser)
        .get()
        .then((querysnapshots) {
      querysnapshots.docs.forEach((element) {
        items.add(element.data());
      });
    });
    return items;
  }

  createChatRoom(chatRoomID, chatRoomMap) {
    try {
      firestore.collection("chatRoom").doc(chatRoomID).set(chatRoomMap);
    } catch (e) {
      print(e.toString());
    }
  }

  uploadMessage(individualChatId, map) async {
    try {
      await firestore
          .collection('chatRoom')
          .doc(individualChatId)
          .collection('chats')
          .add(map);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getMessages(chatRoomId) async {
    return firestore
        .collection('chatRoom')
        .doc(chatRoomId)
        .collection('chats')
        .orderBy('time', descending: false)
        .snapshots();
  }

  Future usersInChatMenu(username) async {
    return firestore
        .collection('chatRoom')
        .where('users', arrayContains: username)
        .snapshots();
  }
}
