
Future<String> getProfileUserName() async {
  await Future.delayed(Duration(seconds: 5));

  return "Riverpod demo";
}

Stream<int> getSessionTime() {
  return Stream.periodic(Duration(seconds: 1), (sessionTime) => sessionTime++);
}