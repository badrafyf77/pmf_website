import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/core/utils/failures.dart';
import 'package:pmf_website/features/news/data/models/post_model.dart';
import 'package:pmf_website/features/news/data/repo/posts_repo.dart';

class PostsRepoImplementation implements PostsRepo {
  final FirestoreService _firestoreService;

  PostsRepoImplementation(this._firestoreService);

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      List<Post> postsList = await _firestoreService.getPosts();
      return right(postsList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(errMessage: e.toString()));
    }
  }
}
