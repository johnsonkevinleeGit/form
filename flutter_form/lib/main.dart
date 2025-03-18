import 'package:flutter/material.dart';
import 'package:flutter_form/form_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text('Profile Page'),
            centerTitle: true),
        backgroundColor: Colors.blueGrey,
        body: const ProfileForm(),
      ),
    );
  }
}

class ProfileForm extends ConsumerWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width * 0.5;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          initialValue: '',
                          decoration: const InputDecoration(
                              labelText: 'Name*', border: OutlineInputBorder()),
                          onSaved: (value) => ref
                              .read(providerOfNameText.notifier)
                              .state = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            if (value.length > 50) {
                              return 'Name should not exceed 50 characters';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          initialValue: '',
                          decoration: const InputDecoration(
                              labelText: 'Email*',
                              border: OutlineInputBorder()),
                          onSaved: (value) => ref
                              .read(providerOfEmailText.notifier)
                              .state = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (value.length > 100) {
                              return 'Name should not exceed 100 characters';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              labelText: 'Phone*',
                              border: OutlineInputBorder()),
                          onSaved: (value) => ref
                              .read(providerOfPhoneText.notifier)
                              .state = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Builder(builder: (context) {
                          return ElevatedButton(
                              onPressed: () {
                                if (!Form.of(context).validate()) {
                                  return;
                                }
                                Form.of(context).save();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const FormData()));
                              },
                              child: const Text('Submit'));
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

final providerOfNameText = StateProvider<String?>((ref) => '');

final providerOfEmailText = StateProvider<String?>((ref) => '');

final providerOfPhoneText = StateProvider<String?>((ref) => '');
