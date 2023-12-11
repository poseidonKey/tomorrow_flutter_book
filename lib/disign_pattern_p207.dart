import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModel {
  String name;
  int age;
  UserModel({
    required this.name,
    required this.age,
  });
}

class UserViewModel extends ChangeNotifier {
  final UserModel _user;
  UserViewModel({required UserModel user}) : _user = user;
  UserModel get user => _user;
  void updateUserName(String name) {
    _user.name = name;
    notifyListeners();
  }

  set updateUserAge(int age) {
    _user.age = age;
    notifyListeners();
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<UserViewModel>(builder: (
              context,
              userViewModel,
              _,
            ) {
              return Text('Name : ${userViewModel.user.name}');
            }),
            Consumer<UserViewModel>(builder: (
              context,
              userViewModel,
              _,
            ) {
              return Text('age : ${userViewModel.user.age}');
            }),
          ],
        ),
      ),
    );
  }
}

class DesignPatternP207 extends StatefulWidget {
  const DesignPatternP207({super.key});

  @override
  State<DesignPatternP207> createState() => _DesignPatternP207State();
}

class _DesignPatternP207State extends State<DesignPatternP207> {
  UserViewModel userViewModel = UserViewModel(
    user: UserModel(name: 'John Due', age: 25),
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => userViewModel,
      child: const Scaffold(
        body: Center(
          child: UserView(),
        ),
      ),
    );
  }
}
