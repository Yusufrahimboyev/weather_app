sealed class SearchEvent {
  const SearchEvent();
}

final class SearchByCountryName$SearchEvent extends SearchEvent {
  final String countryName;
  final List<String> allCities;
  const SearchByCountryName$SearchEvent(this.countryName, this.allCities);
}
