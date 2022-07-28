import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/riverpod/test_provider.dart';
import 'package:untitled2/riverpod/user_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListRiverpod extends ConsumerWidget {
  @override
  Widget build(BuildContext context,  ref) {
    final userList = ref.watch(UserListController.provider);
    print('=========${userList}');
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${userList[index].name}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Name: ${userList[index].address}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    final controller =
                        ref.read(UserListController.provider.notifier);
                    controller.deleteUser(userList[index]);
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
      itemCount: userList.length,
    );
  }
}
