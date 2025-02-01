import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pmf_website/core/utils/customs/custom_listview_animation_config.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/features/news/presentation/manager/cubit/posts_cubit.dart';
import 'package:pmf_website/features/news/presentation/views/widgets/news_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> enabled = ValueNotifier<bool>(true);
    return Column(
      children: [
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: Padding(
        //     padding: EdgeInsets.only(
        //       left: MediaQuery.of(context).size.width * .05,
        //     ),
        //     child: AutoSizeText(
        //       "NEWS:",
        //       style: Styles.normal24.copyWith(fontWeight: FontWeight.bold),
        //       maxLines: 1,
        //     ),
        //   ),
        // ),
        Expanded(
          child: BlocConsumer<PostsCubit, PostsState>(
            listener: (context, state) {
              if (state is Postslaoding) {
                enabled.value = true;
              }
              if (state is GetPostsSuccess) {
                enabled.value = false;
              }
            },
            builder: (context, state) {
              if (state is PostsFailure) {
                return IconButton(
                  onPressed: () {
                    BlocProvider.of<PostsCubit>(context).getPosts();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                );
              }
              return ValueListenableBuilder<bool>(
                valueListenable: enabled,
                builder: (context, value, child) {
                  return (state is GetPostsSuccess && state.postsList.isEmpty)
                      ? Center(child: AutoSizeText("No News",style: Styles.normal14.copyWith(color: Colors.grey),))
                      : Skeletonizer(
                          enabled: value,
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(scrollbars: false),
                            child: AnimationLimiter(
                              child: ListView.builder(
                                itemCount: (state is GetPostsSuccess)
                                    ? state.postsList.length
                                    : 1,
                                itemBuilder: (context, index) {
                                  return CustomListviewAnimationConfig(
                                    index: index,
                                    child: (state is GetPostsSuccess)
                                        ? Column(
                                            children: [
                                              NewsCard(
                                                post: state.postsList[index],
                                              ),
                                              const SizedBox(height: 30),
                                              // const AppFooter(),
                                            ],
                                          )
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            decoration: const BoxDecoration(
                                                color: Colors.white),
                                          ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
