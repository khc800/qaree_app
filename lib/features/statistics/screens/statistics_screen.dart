import 'dart:developer';

import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/statistics/controllers/statistics_controller.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/session_repo.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/custom_app_bar.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../personal_information/screens/personal_information.dart';

class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({super.key});

  @override
  ConsumerState<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  late StatisticsController _controller;

  @override
  void didChangeDependencies() {
    _controller = StatisticsController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(readerProvider);

    return user.when(
      data: (user) => Scaffold(
        backgroundColor: ColorsConst.veryLightGrey,
        // appBar: CustomAppBar(context: context, title: 'إحصائيات'),
        appBar: CustomAppBar(
          context: context,
          title: 'إحصائياتي',
          rightButtonIcon: Icons.person, // Icon for the button on the right
          onRightButtonPressed: () {
            // Define what happens when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PersonalInformation()),
            );
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SpacingConst.vSpacing16,
                ListView(
                  shrinkWrap: true,
                  children: [
                    // SpacingConst.vSpacing20,
                    // Text(
                    //   'اليومي',
                    //   style: context.textThemes.displaySmall?.copyWith(
                    //     color: ColorsConst.darkGrey,
                    //   ),
                    // ),
                    SpacingConst.vSpacing16,
                    Consumer(builder: (context, ref, child) {
                      final session = ref.watch(
                          SessionRepo.getTodaySessionByUserIdProvider(user.id));

                      return session.when(
                        data: (sessions) {
                          return Column(
                            children: [
                              InfoItem(
                                title: "عدد أيام القراءة بدون انقطاع",
                                subtitle: "أيام",
                                value: "6",
                                average: "",
                                icon: Icons.local_fire_department,
                              ),
                              // SpacingConst.vSpacing20,
                              // InfoItem(
                              //   title: 'Read Pages',
                              //   value: _controller
                              //       .getNumberOfPages(sessions)
                              //       .toString(),
                              //   average:
                              //       _controller.getFormattedAverageTimePerPage(
                              //               sessions) +
                              //           " - Page",
                              //   icon: Icons.menu_book_rounded,
                              // ),
                              SpacingConst.vSpacing20,
                              InfoItem(
                                title: "متوسط القراءة اليومية",
                                subtitle: "دقيقة / يوم",
                                // value: sessions.length.toString(),
                                value: "02:31:15",
                                average:
                                    "${_controller.getFormattedAverageReadingTime(sessions)}",
                                icon: Icons.timer,
                              ),
                              SpacingConst.vSpacing20,
                              InfoItem(
                                title: "أعلى وقت قراءة",
                                subtitle: "دقيقة / يوم",
                                // value: sessions.length.toString(),
                                value: "06:21:05",
                                average:
                                    "${_controller.getFormattedAverageReadingTime(sessions)}",
                                icon: Icons.star,
                              ),
                            ],
                          );
                        },
                        error: (error, stack) =>
                            Center(child: Text("An error Ocurred")),
                        loading: () => Column(
                          children: [
                            LoadingContainer(
                              height: 161.h,
                              width: 340.w,
                            ),
                            SpacingConst.vSpacing20,
                            LoadingContainer(
                              height: 161.h,
                              width: 340.w,
                            ),
                            SpacingConst.vSpacing20,
                            LoadingContainer(
                              height: 161.h,
                              width: 340.w,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Text("An error Ocurred"),
      loading: () => LoadingContainer(),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final String average;
  final IconData icon;
  final String subtitle;

  const InfoItem({
    Key? key,
    required this.title,
    required this.value,
    required this.average,
    required this.icon,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161.h,
      decoration: BoxDecoration(
        color: ColorsConst.white,
        borderRadius: BorderRadiusConst.smallBorderRadius,
        boxShadow: [BoxShadowConst.allSidesBoxShadow],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 35.sp,
                ),
                Text(
                  title,
                  style: context.textThemes.bodyMedium?.copyWith(
                      fontFamily: "Almarai",
                      color: ColorsConst.grey,
                      fontSize: 20),
                ),
              ],
            ),
            SpacingConst.vSpacing8,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: context.textThemes.displayLarge?.copyWith(
                      fontFamily: "Almarai",
                      color: ColorsConst.primaryBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // CircularPercentIndicator(
                  //   restartAnimation: true,
                  //   animation: true,
                  //   animationDuration: 2000,
                  //   radius: 27.w,
                  //   lineWidth: 10.w,
                  //   percent: 0.3,
                  //   circularStrokeCap: CircularStrokeCap.round,
                  //   progressColor: ColorsConst.primaryPurple,
                  //   backgroundColor: ColorsConst.primaryBlack,
                  // ),
                ],
              ),
            ),
            Divider(color: ColorsConst.grey, thickness: 0.5.sp),
            SpacingConst.vSpacing6,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: subtitle,
                        style: context.textThemes.titleMedium?.copyWith(
                          color: ColorsConst.primaryPurple,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Almarai",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
