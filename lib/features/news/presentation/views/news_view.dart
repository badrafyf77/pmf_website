import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/features/news/presentation/manager/cubit/posts_cubit.dart';
import 'package:pmf_website/features/news/presentation/views/widgets/news_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    BlocProvider.of<PostsCubit>(context).getPosts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isNewsSelected: true,
      desktopBody: NewsBody(),
      tabletBody: NewsBody(),
      mobileBody: NewsBody(),
    );
  }
}
