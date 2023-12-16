import 'package:flutter/material.dart';

class User {
  String name;
  String email;
  User({
    required this.name,
    required this.email,
  });
}

class UserRepository {
  Future<void> registerUser(User user) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
  }
}

class UserFormViewModel {
  final UserRepository repository;
  UserFormViewModel({
    required this.repository,
  });
  Future<void> registerUser(User user) async {
    await repository.registerUser(user);
  }
}

class UserFormView extends StatefulWidget {
  final UserFormViewModel viewModel;
  const UserFormView({
    super.key,
    required this.viewModel,
  });

  @override
  State<UserFormView> createState() => _UserFormViewState();
}

class _UserFormViewState extends State<UserFormView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Name?';
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email?';
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final user = User(name: name, email: email);
                    widget.viewModel.registerUser(user).then((value) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('completed'),
                              content: const Text('user registerd completed'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('confirm'),
                                )
                              ],
                            );
                          });
                    });
                  }
                },
                child: const Text('register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MvvpP210 extends StatefulWidget {
  const MvvpP210({super.key});

  @override
  State<MvvpP210> createState() => _MvvpP210State();
}

class _MvvpP210State extends State<MvvpP210> {
  final UserRepository userRepository = UserRepository();
  late UserFormViewModel userFormViewModel;
  @override
  void initState() {
    super.initState();
    userFormViewModel = UserFormViewModel(repository: userRepository);
  }

  @override
  Widget build(BuildContext context) {
    return UserFormView(
      viewModel: userFormViewModel,
    );
  }
}
