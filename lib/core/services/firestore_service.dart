import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/core/models/user_info_model.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/news/data/models/post_model.dart';

class FirestoreService {
  final String playersCollection = "players";
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference leagues =
      FirebaseFirestore.instance.collection('leagues');
      CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');

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

  Future<List<Post>> getPosts() async {
    List<Post> postsList = [];
    await posts.orderBy('date', descending: true).get().then((post) {
      for (var doc in post.docs) {
        postsList.add(Post.fromJson(doc));
      }
    });
    return postsList;
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
      League league = await getLeague(leagueId);
      int maxRounds =
          (league.totalPlayers - 1) * (league.isHomeAndAway ? 2 : 1);
      for (var i = 1; i <= maxRounds; i++) {
        List<Fixture> fixtures = await getMatches(league.id, i);
        for (var element in fixtures) {
          if (element.homeId == user.id) {
            await leagues
                .doc(league.id)
                .collection('round-$i')
                .doc(element.id)
                .update(
              {
                'homeName': newName,
              },
            );
          } else if (element.awayId == user.id) {
            await leagues
                .doc(league.id)
                .collection('round-$i')
                .doc(element.id)
                .update(
              {
                'awayName': newName,
              },
            );
          }
        }
      }
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

//---------TEST----------
//---------TEST----------
//---------TEST----------
Future<void> deletePasswords() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Get all users from the players collection
  var usersSnapshot = await firestore.collection('users').get();

  for (var doc in usersSnapshot.docs) {
    await firestore
        .collection('users')
        .doc(doc.id)
        .update({'password': FieldValue.delete()});
  }

  // ignore: avoid_print
  print("Complete");
}
