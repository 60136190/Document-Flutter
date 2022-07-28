import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled2/api/test_riverpod.dart';
import 'package:untitled2/riverpod/user_list.dart';

final channelNameProvider = Provider<String>(
  (_) => "Cheetah Coding",
);

final heheProvider = Provider<int>(
  (_) => 4,
);

final profileNameProvider = FutureProvider<String>(
  (_) => getProfileUserName(),
);

final sessionTimeProvider = StreamProvider<int>(
  (_) => getSessionTime(),
);

final userListProvider = StateNotifierProvider(
  (_) => UserListController(),
);