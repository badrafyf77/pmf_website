import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/features/news/data/models/post_model.dart';
import 'package:pmf_website/features/news/data/repo/posts_repo.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo _postsRepo;
  PostsCubit(this._postsRepo) : super(PostsInitial());

  Future<void> getPosts() async {
    emit(Postslaoding());
    var result = await _postsRepo.getPosts();
    result.fold((left) {
      emit(PostsFailure(err: left.errMessage));
    }, (right) {
      emit(GetPostsSuccess(postsList: right));
    });
  }
}
