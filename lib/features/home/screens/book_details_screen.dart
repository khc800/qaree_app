import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/home/controllers/home_screen_controller.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/repos/note_repo.dart';
import 'package:Qaree/services/date_time_services.dart';
import 'package:Qaree/widgets/book_image.dart';
import 'package:Qaree/widgets/bounce.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/utils/theme/extensions.dart';

class BookDetailsScreen extends ConsumerStatefulWidget {
  final Book book;
  const BookDetailsScreen({required this.book, super.key});

  @override
  ConsumerState<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends ConsumerState<BookDetailsScreen> {
  late  HomeScreenController _controller;

  @override
  void didChangeDependencies() {
    _controller = HomeScreenController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.veryLightGrey,
      appBar: AppBar(
          backgroundColor: ColorsConst.primaryBlack,
          bottom: PreferredSize(
            preferredSize: Size(1, 250.h),
            child: FadeInUp(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BounceAnimation(
                              onTap: () =>
                                  _controller.navigateToBookScreen(widget.book),
                              child: BookImage(
                                book: widget.book,
                                width: 90,
                                height: 134,
                              ),
                            ),
                            SpacingConst.hSpacing20,
                            Container(
                              width: 230.w,
                              child: Column(
                                children: [
                                  Text(
                                    widget.book.name ?? "Unknown",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: context.textThemes.titleMedium
                                        ?.copyWith(
                                      fontFamily: "Almarai",
                                      color: ColorsConst.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SpacingConst.vSpacing16,
                                  Text(
                                    widget.book.description ?? "Unknown",
                                    style:
                                        context.textThemes.bodyMedium?.copyWith(
                                      fontFamily: "Almarai",
                                      color: ColorsConst.grey,
                                    ),
                                    maxLines: 6,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SpacingConst.vSpacing120,
                      ],
                    ),
                    Positioned(
                      bottom: -50.h,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 330.w,
                            child: Row(
                              children: [
                                BounceAnimation(
                                  onTap: () =>
                                      _controller.onAddReviewTap(widget.book),
                                  child: Container(
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                      color: ColorsConst.grey,
                                      borderRadius: BorderRadiusConst
                                          .verySmallBorderRadius,
                                    ),
                                    child: Icon(
                                      Icons.library_books,
                                      size: 20.sp,
                                      color: ColorsConst.white,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                BounceAnimation(
                                  onTap: () =>
                                      _controller.onAddNoteTap(widget.book),
                                  child: Container(
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                      color: ColorsConst.primaryPurple,
                                      borderRadius: BorderRadiusConst
                                          .verySmallBorderRadius,
                                    ),
                                    child: Icon(
                                      CupertinoIcons.pen,
                                      size: 20.sp,
                                      color: ColorsConst.white,
                                    ),
                                  ),
                                ),
                                SpacingConst.hSpacing20,
                                BounceAnimation(
                                  onTap: () => _controller
                                      .onStartSessionTap(widget.book),
                                  child: Container(
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                      color: ColorsConst.primaryPurple,
                                      borderRadius: BorderRadiusConst
                                          .verySmallBorderRadius,
                                    ),
                                    child: Icon(
                                      Icons.play_circle_outline_rounded,
                                      size: 22.sp,
                                      color: ColorsConst.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SpacingConst.vSpacing16,
                          Container(
                            width: 350.w,
                            height: 92.h,
                            decoration: BoxDecoration(
                              color: ColorsConst.white,
                              borderRadius: BorderRadiusConst.smallBorderRadius,
                              boxShadow: [BoxShadowConst.allSidesBoxShadow],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.h),
                                    decoration: BoxDecoration(
                                      color: ColorsConst.primaryPurple,
                                      borderRadius:
                                          BorderRadiusConst.mediumBorderRadius,
                                    ),
                                    child: Icon(
                                      Icons.group,
                                      size: 30.sp,
                                      color: ColorsConst.white,
                                    ),
                                  ),
                                  SpacingConst.hSpacing16,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SpacingConst.vSpacing16,
                                      Text(
                                        "Authors",
                                        style: context.textThemes.bodySmall
                                            ?.copyWith(
                                          fontFamily: "Almarai",
                                          color: ColorsConst.grey,
                                        ),
                                      ),
                                      SpacingConst.vSpacing8,
                                      SizedBox(
                                        height: 30.h,
                                        width: 200.w,
                                        child: widget.book.authors?.length !=
                                                null
                                            ? ListView.separated(
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SpacingConst.vSpacing8,
                                                itemCount: widget
                                                        .book.authors?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  return Text(
                                                    widget.book.authors![index],
                                                    style: context
                                                        .textThemes.bodyLarge
                                                        ?.copyWith(
                                                      fontFamily: "Almarai",
                                                      color: ColorsConst
                                                          .primaryBlack,
                                                    ),
                                                  );
                                                },
                                              )
                                            : Text(
                                                "Unknown",
                                                style: context
                                                    .textThemes.bodyLarge
                                                    ?.copyWith(
                                                  fontFamily: "Almarai",
                                                  color:
                                                      ColorsConst.primaryBlack,
                                                ),
                                              ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
      body: Consumer(builder: (context, ref, child) {
        final notes = ref
            .watch(NoteRepo.getNotesByBookIdAndUserIdProvider(widget.book.id!));
        return notes.when(
            data: (notes) {
              return notes.isNotEmpty
                  ? SafeArea(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 60.h, bottom: 20.h, left: 20.w, right: 20.w),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: notes.length,
                            separatorBuilder: ((context, index) =>
                                SpacingConst.vSpacing20),
                            itemBuilder: (context, index) => FadeInUp(
                              child: Container(
                                height: 150.h,
                                decoration: BoxDecoration(
                                  color: ColorsConst.white.withOpacity(0.80),
                                  borderRadius:
                                      BorderRadiusConst.smallBorderRadius,
                                  boxShadow: [BoxShadowConst.allSidesBoxShadow],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 12.h),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: List.generate(
                                            4,
                                            (index) => Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          Colors.grey.shade400,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 6.h),
                                        child: Text(
                                          notes[index].noteContent.toString(),
                                          style: context.textThemes.bodyLarge
                                              ?.copyWith(
                                            fontFamily: "Almarai",
                                            color: ColorsConst.primaryBlack,
                                            height: 2.1.h,
                                          ),
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            DateTimeServices
                                                .getFullDateAsLetterMonth(
                                                    dateTime:
                                                        notes[index].date),
                                            style: context.textThemes.bodyMedium
                                                ?.copyWith(
                                              fontFamily: "Almarai",
                                              color: ColorsConst.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : FadeInUp(
                      child: Center(
                          child: Text(
                        "لم تقيّد فوائد إلى الآن",
                        style: context.textThemes.titleLarge?.copyWith(
                          fontFamily: "Almarai",
                          color: ColorsConst.primaryBlack,
                        ),
                      )),
                    );
            },
            error: (error, stackTrace) =>
                Center(child: Text("There is an Error")),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ));
      }),
    );
  }
}
