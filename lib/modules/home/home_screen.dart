import 'package:flutter/material.dart';
import 'package:payflow/modules/bank_statements_screen/bank_statement_screen.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/my_bank_slips/my_bank_slips_screen.dart';
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
    Container(
      child: MyBankSlipsScreen(),
    ),
    Container(
      child: BankStatementScreen(),
    ),
  ];

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
                color: homeController.currentPage == 0 ? AppColors.primary : AppColors.body,
              ),
              onPressed: () {
                homeController.setPage(0);
                setState(() {});
              },
            ),
            GestureDetector(
              onTap: () {
                print("Click");
                // Navigator.pushNamed(context, "/barcode_scanner");
                Navigator.pushNamed(context, "/insert_slip");
              },
              child: Container(
                height: size.height * 0.1,
                width: size.height * 0.1,
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.description_outlined,
                color: homeController.currentPage == 1 ? AppColors.primary : AppColors.body,
              ),
              onPressed: () {
                homeController.setPage(1);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
