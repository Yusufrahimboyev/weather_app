abstract class SearchRepository {
  Future<List<String>> search(String query, List<String> allCities);
}

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<List<String>> search(String query, List<String> allCities) async {
    final filteredCities = allCities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredCities;
  }
}
