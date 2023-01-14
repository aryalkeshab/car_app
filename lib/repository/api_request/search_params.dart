class SearchParams {
  String searchText = '';
  String dateTime = '';
  bool isSorted = false;

  SearchParams(
      {required this.searchText,
      required this.dateTime,
      required this.isSorted});
}
