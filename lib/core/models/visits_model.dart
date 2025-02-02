import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/core/utils/service_locator.dart';

increaseVisits() {
  getIt.get<FirestoreService>().increaseVisits();
}

class Visits {
  List visits = [];

  Visits({
    required this.visits,
  });

  Visits.fromJson(json)
      : this(
          visits: json['visits'] as List,
        );

  Map<String, dynamic> toJson() {
    return {
      'visits': visits,
    };
  }

  Map<String, dynamic> ifNotExiststoJson() {
    int month = DateTime.now().month;
    switch (month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return {
          'visits': [
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0
          ],
        };
      case 4:
      case 6:
      case 9:
      case 11:
        return {
          'visits': [
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
          ],
        };
      case 2:
        return {
          'visits': [
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0
          ],
        };
      default:
        return {};
    }
  }
}
