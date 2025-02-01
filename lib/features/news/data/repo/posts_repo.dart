import 'package:dartz/dartz.dart';
import 'package:pmf_website/core/utils/failures.dart';
import 'package:pmf_website/features/news/data/models/post_model.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<Post>>> getPosts();
}
