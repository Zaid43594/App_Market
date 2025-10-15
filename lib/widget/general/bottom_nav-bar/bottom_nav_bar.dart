import 'package:flutter/material.dart';
import 'package:market/core/constans/app_colors.dart';
import 'package:market/core/constans/app_images.dart';
import 'package:market/core/services/bottom_nav_bar_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market/view/home/home_screen/home_screen.dart';
import 'package:market/view/market/market_screen/market_screen.dart';
import 'package:market/view/portfolio/portfolio_screen/portfolio_screen.dart';
import 'package:market/view/profile/profile_screen/profile_screen.dart';
import 'package:market/view/rewards/rewards_screen/rewards_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final BottomNavBarController controller = Get.find();

  final List<Widget> _pages = const [
    HomeScreen(),
    PortfolioScreen(),
    RewardsScreen(),
    MarketScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: _pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          width: double.infinity.w,
          height: 88.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.35),
                blurRadius: 30,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: BottomAppBar(
            color: AppColors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildNavItem(AppImages.home, "Home", 0),
                  _buildNavItem(AppImages.portfolio, "Portfolio", 1),
                  _buildNavItem(AppImages.rewards, "Rewards", 2),
                  _buildNavItem(AppImages.market, "Market", 3),
                  _buildNavItem(AppImages.profile, "Profile", 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    final bool isActive = controller.currentIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 22.w,
            height: 22.h,
            color: isActive ? AppColors.primary : AppColors.grey,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              color: isActive ? AppColors.primary : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
