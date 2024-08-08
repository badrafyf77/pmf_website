import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pmf_website/core/models/event_model.dart';

class FirestoreService {
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  CollectionReference initialEvent =
      FirebaseFirestore.instance.collection('initialEvent');

  Future<List<Event>> getEvents() async {
    List<Event> eventsList = [];
    await events.orderBy('date', descending: true).get().then((event) {
      for (var doc in event.docs) {
        eventsList.add(Event.fromJson(doc));
      }
    });
    return eventsList;
  }

  Future<Event> getEvent(String id) async {
    dynamic data;
    Event event;
    await events.doc(id).get().then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
    event = Event.fromJson(data);
    return event;
  }

  Future<Event> getInitialEvent() async {
    dynamic data;
    Event event;
    await initialEvent
        .doc('Initial_event')
        .get()
        .then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
    event = Event.fromJson(data);
    return event;
  }
}
