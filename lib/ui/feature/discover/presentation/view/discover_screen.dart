import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_art/ui/feature/discover/presentation/bloc/discover_bloc.dart';
import 'package:open_art/ui/feature/discover/presentation/view/state_view/discover_loaded_state.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DiscoverBloc dashboardBloc = BlocProvider.of<DiscoverBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 26.w),
          child: Transform.scale(
            scale: 2.9,
            child: SvgPicture.asset(
              'assets/svgs/Logo.svg',
            ),
          ),
        ),
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: SvgPicture.asset('assets/svgs/Menu.svg'),
          ),
        ],
      ),
      // backgroundColor: Colors.grey[100],
      body: BlocBuilder(
          bloc: dashboardBloc,
          builder: (context, state) {
            return const DiscoverLoadedStateView();
          }),
    );
  }
}
