import 'package:flutter/material.dart';
import 'package:flutter_form/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormData extends ConsumerWidget {
  const FormData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(providerOfNameText);
    final email = ref.watch(providerOfEmailText);
    final phone = ref.watch(providerOfPhoneText);
    final width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Form Data'),
          centerTitle: true),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Name: $name'),
                      Text('Email: $email'),
                      Text('Phone: $phone')
                    ],
                  ),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
