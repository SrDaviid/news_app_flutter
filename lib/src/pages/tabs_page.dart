import 'package:flutter/material.dart';
import 'package:news_app/src/pages/tabs1_page.dart';
import 'package:news_app/src/pages/tabs2_page.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navegation(),
      ),
    );
  }
}

class _Navegation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Providers
    final navegationModel = Provider.of<_NavegationModel>(context);

    return BottomNavigationBar(
        currentIndex: navegationModel.actualPage,
        onTap: (index) => navegationModel.actualPage = index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person_sharp),
              label: 'Me'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public_rounded),
              activeIcon: Icon(Icons.public_off_sharp),
              label: 'Headers'),
        ]);
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);
    return PageView(
      controller: navegationModel.pageController,
      // physics: const BouncingScrollPhysics(),
      // physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[const Tab1Screen(), Tab2Screen()],
    );
  }
}

class _NavegationModel extends ChangeNotifier {
  int _actualPage = 0;
  PageController _pageController = PageController();

  int get actualPage {
    return _actualPage;
  }

  set actualPage(int value) {
    _actualPage = value;

    _pageController.animateToPage(value,
        duration: const Duration(microseconds: 200), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController {
    return _pageController;
  }
}
