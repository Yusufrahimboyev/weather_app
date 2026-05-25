// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Thunderstorm`
  String get Thunderstorm {
    return Intl.message(
      'Thunderstorm',
      name: 'Thunderstorm',
      desc: '',
      args: [],
    );
  }

  /// `Drizzle`
  String get Drizzle {
    return Intl.message('Drizzle', name: 'Drizzle', desc: '', args: []);
  }

  /// `Rain`
  String get Rain {
    return Intl.message('Rain', name: 'Rain', desc: '', args: []);
  }

  /// `Snow`
  String get Snow {
    return Intl.message('Snow', name: 'Snow', desc: '', args: []);
  }

  /// `Mist`
  String get Mist {
    return Intl.message('Mist', name: 'Mist', desc: '', args: []);
  }

  /// `Smoke`
  String get Smoke {
    return Intl.message('Smoke', name: 'Smoke', desc: '', args: []);
  }

  /// `Haze`
  String get Haze {
    return Intl.message('Haze', name: 'Haze', desc: '', args: []);
  }

  /// `Dust`
  String get Dust {
    return Intl.message('Dust', name: 'Dust', desc: '', args: []);
  }

  /// `Fog`
  String get Fog {
    return Intl.message('Fog', name: 'Fog', desc: '', args: []);
  }

  /// `Sand`
  String get Sand {
    return Intl.message('Sand', name: 'Sand', desc: '', args: []);
  }

  /// `Ash`
  String get Ash {
    return Intl.message('Ash', name: 'Ash', desc: '', args: []);
  }

  /// `Squall`
  String get Squall {
    return Intl.message('Squall', name: 'Squall', desc: '', args: []);
  }

  /// `Tornado`
  String get Tornado {
    return Intl.message('Tornado', name: 'Tornado', desc: '', args: []);
  }

  /// `Clear Sky`
  String get Clear_Sky {
    return Intl.message('Clear Sky', name: 'Clear_Sky', desc: '', args: []);
  }

  /// `Broken Clouds`
  String get Broken_Clouds {
    return Intl.message(
      'Broken Clouds',
      name: 'Broken_Clouds',
      desc: '',
      args: [],
    );
  }

  /// `Scattered Clouds`
  String get Scattered_Clouds {
    return Intl.message(
      'Scattered Clouds',
      name: 'Scattered_Clouds',
      desc: '',
      args: [],
    );
  }

  /// `Overcast Clouds`
  String get Overcast_Clouds {
    return Intl.message(
      'Overcast Clouds',
      name: 'Overcast_Clouds',
      desc: '',
      args: [],
    );
  }

  /// `km/h`
  String get km {
    return Intl.message('km/h', name: 'km', desc: '', args: []);
  }

  /// `Feels like`
  String get feel {
    return Intl.message('Feels like', name: 'feel', desc: '', args: []);
  }

  /// `Wind`
  String get wind {
    return Intl.message('Wind', name: 'wind', desc: '', args: []);
  }

  /// `Humidity`
  String get Humidity {
    return Intl.message('Humidity', name: 'Humidity', desc: '', args: []);
  }

  /// `Pressure`
  String get pressure {
    return Intl.message('Pressure', name: 'pressure', desc: '', args: []);
  }

  /// `UVI`
  String get UVI {
    return Intl.message('UVI', name: 'UVI', desc: '', args: []);
  }

  /// `Search`
  String get Search {
    return Intl.message('Search', name: 'Search', desc: '', args: []);
  }

  /// `Setting`
  String get Setting {
    return Intl.message('Setting', name: 'Setting', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `Updated`
  String get update {
    return Intl.message('Updated', name: 'update', desc: '', args: []);
  }

  /// `5 Day Weather forecast`
  String get FiveDayWeather {
    return Intl.message(
      '5 Day Weather forecast',
      name: 'FiveDayWeather',
      desc: '',
      args: [],
    );
  }

  /// `Add New City`
  String get AddNewCity {
    return Intl.message('Add New City', name: 'AddNewCity', desc: '', args: []);
  }

  /// `Add`
  String get Add {
    return Intl.message('Add', name: 'Add', desc: '', args: []);
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `City Name`
  String get CityName {
    return Intl.message('City Name', name: 'CityName', desc: '', args: []);
  }

  /// `Location`
  String get Location {
    return Intl.message('Location', name: 'Location', desc: '', args: []);
  }

  /// `Current Weather`
  String get CurrentWeather {
    return Intl.message(
      'Current Weather',
      name: 'CurrentWeather',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
