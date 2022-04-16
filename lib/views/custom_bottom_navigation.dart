import 'package:ecommerce_template/controllers/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key, required this.onSelectTab})
      : super(key: key);
  final Function(int index) onSelectTab;

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  final MainScreenController _mainScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Get.size.height * 0.015,
        bottom: Get.size.height * 0.01,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              homeButton(),
              exploreButton(),
              addButton(),
              inboxButton(),
              shopButton(),
            ],
          ),
        ],
      ),
    );
  }

  bottomNavigationItem({
    required IconData icon,
    required String text,
    required Function() onTap,
    required int tabIndex,
  }) {
    return InkWell(
      onTap: () {
        widget.onSelectTab(tabIndex);
        onTap();
      },
      child: Obx(() {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.size.width / 2)),
          child: Column(
            children: [
              Icon(
                icon,
                color: _mainScreenController.currentTab.value == tabIndex
                    ? const Color.fromRGBO(241, 82, 35, 1)
                    : Colors.grey,
              ),
              Text(
                text,
                style: TextStyle(
                  color: _mainScreenController.currentTab.value == tabIndex
                      ? const Color.fromRGBO(241, 82, 35, 1)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget homeButton() {
    return bottomNavigationItem(
      icon: Icons.home,
      text: "Home",
      onTap: () {},
      tabIndex: 0,
    );
  }

  Widget exploreButton() {
    return bottomNavigationItem(
      icon: Icons.explore,
      text: "Explore",
      onTap: () {
        showExploreDialog();
      },
      tabIndex: 1,
    );
  }

  showExploreDialog() {
    Get.dialog(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Get.size.width * 0.05,
              horizontal: Get.size.width * 0.05,
            ),
            width: Get.size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("resources/avatar.png"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Saber Ali",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Dhaka, Bangladesh",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    followButton(),
                  ],
                ),
                SizedBox(
                  height: Get.size.height * 0.02,
                ),
                Image.asset(
                  "resources/image.png",
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: Get.size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Get.size.height * 0.02,
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 245, 247, 1),
                      borderRadius: BorderRadius.circular(15)),
                  width: double.infinity,
                  child: const Text(
                    "View Post",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  followButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Get.size.width * 0.03,
        vertical: Get.size.height * 0.007,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 82, 35, 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.userPlus,
            color: Color.fromRGBO(241, 82, 35, 1),
          ),
          SizedBox(
            width: Get.size.width * 0.02,
          ),
          const Text(
            "Follow",
            style: TextStyle(
              color: Color.fromRGBO(241, 82, 35, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget inboxButton() {
    return bottomNavigationItem(
      icon: Icons.inbox,
      text: "Inbox",
      onTap: () {},
      tabIndex: 2,
    );
  }

  Widget shopButton() {
    return bottomNavigationItem(
      icon: Icons.shop,
      text: "Shop",
      onTap: () {},
      tabIndex: 3,
    );
  }

  addButton() {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          elevation: 0,
          child: const Icon(Icons.add),
        ),
        SizedBox(
          height: Get.size.height * 0.03,
        ),
      ],
    );
  }
}
