import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pmf_website/core/models/user_model.dart';

class FirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserInformation userInfo) async {
    await users.doc(userInfo.id).set(userInfo.toJson());
  }

  Future<UserInformation> getUser(String id) async {
    dynamic data;
    UserInformation user;
    final DocumentReference document = users.doc(id);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
    user = UserInformation.fromJson(data);
    return user;
  }

  Future<void> deleteUser(String id) async {
    await users.doc(id).delete();
  }

  Future<void> updatePassword(String id,String newPassword) async {
    await users.doc(id).update({
      'password': newPassword,
    });
  }

  // Future<List<Event>> getEvents() async {
  //   List<Event> eventsList = [];
  //   await events.orderBy('date', descending: true).get().then((event) {
  //     for (var doc in event.docs) {
  //       eventsList.add(Event.fromJson(doc));
  //     }
  //   });
  //   return eventsList;
  // }

  // Future<Event> getEvent(String id) async {
  //   dynamic data;
  //   Event event;
  //   await events.doc(id).get().then<dynamic>((DocumentSnapshot snapshot) async {
  //     data = snapshot.data();
  //   });
  //   event = Event.fromJson(data);
  //   return event;
  // }

  // Future<Event> getInitialEvent() async {
  //   dynamic data;
  //   Event event;
  //   await initialEvent
  //       .doc('Initial_event')
  //       .get()
  //       .then<dynamic>((DocumentSnapshot snapshot) async {
  //     data = snapshot.data();
  //   });
  //   event = Event.fromJson(data);
  //   return event;
  // }
}
