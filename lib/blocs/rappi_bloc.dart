import 'package:flutter/material.dart';
import 'package:untitled2/models/rappi_data.dart';

class RappiBloC with ChangeNotifier {
  List<RappiTabCategory> tabs = [];
  TabController? tabController;

  void init(TickerProvider ticker) {
    tabController =
        TabController(length: rappiCategories.length, vsync: ticker);
    for (int i = 0; i < rappiCategories.length; i++) {
      final category = rappiCategories[i];
      tabs.add(RappiTabCategory(category: null, selected: (i == 0)));
    }
  }
}

class RappiTabCategory {
  const RappiTabCategory({required this.category, required this.selected});

  final RappiCategory? category;
  final bool selected;
}
