import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/core/models/user_info_model.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';

class FirestoreService {
  final String playersCollection = "players";
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference leagues =
      FirebaseFirestore.instance.collection('leagues');

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

  Future<UserInformation> getUserByEmail(String email) async {
    List<UserInformation> list = [];
    await users.where('email', isEqualTo: email).get().then((user) {
      for (var doc in user.docs) {
        list.add(UserInformation.fromJson(doc));
      }
    });
    return list[0];
  }

  Future<void> updateName(String id, String newName) async {
    await users.doc(id).update({
      'displayName': newName,
    });
  }

  Future<void> updateUserNameInLeagues(
      UserInformation user, String newName) async {
    for (var leagueId in user.participations) {
      await leagues
          .doc(leagueId)
          .collection(playersCollection)
          .doc(user.id)
          .update({
        'displayName': newName,
      });
    }
  }

  Future<void> updateEmail(String id, String newEmail) async {
    await users.doc(id).update({
      'email': newEmail,
    });
  }

  Future<void> updatePassword(String id, String newPassword) async {
    await users.doc(id).update({
      'password': newPassword,
    });
  }

  Future<List<League>> getLeagues() async {
    List<League> leaguesList = [];
    await leagues.orderBy('startDate', descending: true).get().then((league) {
      for (var doc in league.docs) {
        leaguesList.add(League.fromJson(doc));
      }
    });
    return leaguesList;
  }

  Future<List<Fixture>> getMatches(String leagueId, int round) async {
    List<Fixture> fixtures = [];

    var snapshot = await leagues.doc(leagueId).collection('round-$round').get();

    for (var doc in snapshot.docs) {
      fixtures.add(Fixture.fromJson(doc.data()));
    }

    return fixtures;
  }

  Future<League> getLeague(String id) async {
    dynamic data;
    League league;
    await leagues
        .doc(id)
        .get()
        .then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
    league = League.fromJson(data);
    return league;
  }

  Future<List<Player>> getPlayers(String leagueId) async {
    List<Player> playersList = [];

    var snapshot =
        await leagues.doc(leagueId).collection(playersCollection).get();

    for (var doc in snapshot.docs) {
      playersList.add(Player.fromJson(doc.data()));
    }

    return playersList;
  }
}
