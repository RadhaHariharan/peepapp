import 'package:flutter/material.dart';
import 'package:peepapp/screens/account/view/account.dart';
import 'package:peepapp/screens/chats/view/chats_screen.dart';
import 'package:peepapp/screens/people/view/people_screen.dart';
import 'package:peepapp/screens/shouts/view/shout_screen.dart';

class HomeController extends ChangeNotifier {
  final List<Map<String, dynamic>> _sideTabs = [
    {
      'title': 'People',
      'subTitle': 'Look around for people near you!',
      'icon': Icons.people,
    },
    {
      'title': 'Chats',
      'subTitle': 'View your past messages',
      'icon': Icons.chat,
    },
    {
      'title': 'Shout',
      'subTitle': 'Broadcast a message around you!',
      'icon': Icons.broadcast_on_home,
    },
    {
      'title': 'Account Settings',
      'subTitle': '',
      'icon': Icons.person,
    },
    {
      'title': 'Logout',
      'subTitle': '',
      'icon': Icons.logout,
    },
  ];
  Map<String, dynamic> _currentScreen = {
    'title': 'Chats',
    'subTitle': 'View your past messages',
    'icon': Icons.chat,
  };

  List<Map<String, dynamic>> get sideTabs => _sideTabs;
  Map<String, dynamic> get currentScreen => _currentScreen;

  void changeScreen(Map<String, dynamic> val) {
    _currentScreen = val;
    notifyListeners();
  }

  Widget screenToLoad() {
    switch (_currentScreen['title'].toString().toLowerCase()) {
      case 'chats':
        return ChatsScreen();
      case 'shout':
        return ShoutScreen();
      case 'people':
        return const PeopleScreen();
      case 'account settings':
        return const AccountScreen();
      default:
        return Container(
          child: Text(
            _currentScreen['title'].toString(),
          ),
        );
    }
  }
}
