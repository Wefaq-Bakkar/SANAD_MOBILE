
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widget/home/list_page/list_item_card.dart';


class ListPage extends StatelessWidget {
  const ListPage({super.key});

  static final List<_ListItem> items = [
    _ListItem('الكروت المباعة', Icons.credit_card),
    _ListItem('كشف حساب', Icons.receipt_long),
    _ListItem('فواتيري', Icons.receipt),
    _ListItem('المبيعات اليومية للبطاقات', Icons.bar_chart),
    _ListItem('الشكاوى', Icons.report_problem),
    _ListItem('حول التطبيق', Icons.info_outline),
    _ListItem('التجار الفرعيين', Icons.group),
    _ListItem('الحساب الشخصي', Icons.person),
    _ListItem('تسجيل الخروج', Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القائمة الرئيسية'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) => ListItemCard(
            title: items[i].title,
            icon: items[i].icon,
            onTap: () async {
              if (items[i].title == 'الحساب الشخصي') {
                Navigator.of(context).pushNamed('/profile');
              } else if (items[i].title == 'تسجيل الخروج') {
                // Simple logout: clear SharedPreferences and go to login
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
              }
            },
          ),
        ),
      ),
    );
  }
}



class _ListItem {
  final String title;
  final IconData icon;
  const _ListItem(this.title, this.icon);
}
