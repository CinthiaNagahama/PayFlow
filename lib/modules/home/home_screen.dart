import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = HomeController();
  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ];

  Color homeButtonColor = AppColors.primary;
  Color slipButtonColor = AppColors.body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.18),
        child: Container(
          height: size.height * 0.18,
          padding: const EdgeInsets.only(top: 15),
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: "Olá, ",
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(text: "user.username", style: AppTextStyles.titleBoldBackground),
                  ],
                ),
              ),
              subtitle: Text("Mantenha suas contas em dia", style: AppTextStyles.captionShape),
              trailing: Container(
                height: size.height * 0.1,
                width: size.height * 0.1,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: Container(
        height: size.height * 0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: homeButtonColor,
              ),
              onPressed: () {
                homeController.setPage(0);
                homeButtonColor = AppColors.primary;
                slipButtonColor = AppColors.body;
                setState(() {});
              },
            ),
            GestureDetector(
              child: Container(
                height: size.height * 0.08,
                width: size.height * 0.08,
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                  onPressed: () {},
                ),
              ),
              onTap: () {
                print("Click");
              },
            ),
            IconButton(
              icon: Icon(
                Icons.description_outlined,
                color: slipButtonColor,
              ),
              onPressed: () {
                homeController.setPage(1);
                homeButtonColor = AppColors.body;
                slipButtonColor = AppColors.primary;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
