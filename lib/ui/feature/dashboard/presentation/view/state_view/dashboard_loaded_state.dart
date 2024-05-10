import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_art/ui/feature/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:open_art/ui/feature/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:open_art/ui/feature/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/dashboard_card.dart';
import 'package:open_art/ui/feature/dashboard/presentation/view/widget/dashboard_tab.dart';
import 'package:open_art/utils/app_constants/app_color.dart';

class DashboardLoadedStateView extends StatefulWidget {
  const DashboardLoadedStateView({super.key});

  @override
  State<DashboardLoadedStateView> createState() =>
      _DashboardLoadedStateViewState();
}

class _DashboardLoadedStateViewState extends State<DashboardLoadedStateView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final DashboardBloc dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: dashboardBloc,
      builder: (context, state) => SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'Discover creator',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: AppColors.textColor),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Follow at least five creators \n to build your feed…',
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.textColor),
                    ),
                    SizedBox(height: 25.h),
                  ],
                ),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      onTap: (value) {
                        dashboardBloc
                            .add(SwitchDasbboardTab(selectedIndex: value));
                      },
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        dashboardTab(context,
                            title: 'Feature Creator',
                            textbg: state.tabIndex == 0
                                ? Colors.white
                                : Colors.black,
                            color:
                                state.tabIndex == 0 ? null : AppColors.tabColor,
                            gradient: state.tabIndex == 0
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF0038F5),
                                      Color(0xFF9F03FF),
                                    ],
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp,
                                  )
                                : null),
                        dashboardTab(context,
                            title: 'All Creator',
                            textbg: state.tabIndex == 1
                                ? Colors.white
                                : Colors.black,
                            color:
                                state.tabIndex == 1 ? null : AppColors.tabColor,
                            gradient: state.tabIndex == 1
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF0038F5),
                                      Color(0xFF9F03FF),
                                    ],
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp,
                                  )
                                : null),
                      ],
                      controller: controller,
                    ),
                  )),
              SliverToBoxAdapter(child: SizedBox(height: 15.h))
            ];
          },
          body: TabBarView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListView.separated(
                itemBuilder: (context, index) => DashboardCard(),
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    Padding(padding: EdgeInsets.all(10.h)),
              ),
              ListView.separated(
                itemBuilder: (context, index) => DashboardCard(),
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    Padding(padding: EdgeInsets.all(10.h)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
