
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/iconasset.dart';
import 'notificationicon.dart';
import 'search_field.dart';

class Dashboardheader extends StatefulWidget {
  final String name;

  const Dashboardheader({
    super.key,
    required this.name,
  });

  @override
  State<Dashboardheader> createState() => _DashboardheaderState();
}

class _DashboardheaderState extends State<Dashboardheader> {
  bool _showSearch = false;

  void _toggleSearch() {
    setState(() {
      _showSearch = !_showSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_showSearch)
                Expanded(
                  child: SearchField(
                    controller: TextEditingController(),
                    onClose: _toggleSearch,
                  ),
                )
              else ...[
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "DashboardHeader".tr,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: "\n"),
                        TextSpan(text: widget.name),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconBtnWithCounter(
                  svgSrc: AppsIconAsset.bellIcon,
                  numOfitem: 6,
                  press: () {},
                ),
                const SizedBox(width: 16),
                IconBtnWithCounter(
                  svgSrc: AppsIconAsset.cartIcon,
                  press: () {},
                ),
                const SizedBox(width: 16),
                IconButton(
                  key: const ValueKey('searchIcon'),
                  icon: const Icon(Icons.search),
                  onPressed: _toggleSearch,
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
