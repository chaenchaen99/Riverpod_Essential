import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/pages/users/user_detail_page.dart';
import 'package:future_provider/pages/users/users_providers.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);
    print(userList);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: userList.when(
          skipLoadingOnRefresh: false,
          data: (users) {
            return RefreshIndicator(
              onRefresh: () async {
                return ref.invalidate(userListProvider);
              },
              color: Colors.red,
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final user = users[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return UserDetailPage(userId: user.id);
                        }));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(user.id.toString()),
                        ),
                        title: Text(user.name),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemCount: users.length),
            );
          },
          error: (e, st) {
            return Center(
              child: Text(
                e.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            );
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
