import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tsk_4/src/common/style/app_icons.dart';
import 'package:tsk_4/src/common/utils/context_extension.dart';
import 'package:tsk_4/src/common/utils/status_enum.dart';
import 'package:tsk_4/src/features/countrylist/widgets/location_card.dart';
import 'package:tsk_4/src/features/home/bloc/home_bloc.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _cityController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _showAddCityDialog(BuildContext blocContext) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(context.localizations.AddNewCity),
          content: TextField(
            controller: _cityController,
            decoration: InputDecoration(
              labelText: context.localizations.CityName,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(context.localizations.Cancel),
            ),
            TextButton(
              onPressed: () {
                final city = _cityController.text.trim();
                if (city.isNotEmpty) {
                  blocContext.read<HomeBloc>().add(AddCity$HomeEvent(city));
                  _cityController.clear();
                }
                Navigator.pop(dialogContext);
              },
              child: Text(context.localizations.Add),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext blocContext, String cityName) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(context.localizations.DeleteConfirmTitle),
          content: Text(context.localizations.DeleteConfirmMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(context.localizations.Cancel),
            ),
            TextButton(
              onPressed: () {
                blocContext.read<HomeBloc>().add(
                  RemoveCity$HomeEvent(cityName),
                );
                Navigator.pop(dialogContext);
              },
              child: Text(context.localizations.Delete),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (prev, curr) =>
          curr.status == Status.error &&
          curr.errorMessage != null &&
          curr.errorMessage != prev.errorMessage,
      listener: (context, state) {
        if (state.status == Status.error && state.errorMessage != null) {
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text("Xatolik"),
              content: Text(state.errorMessage!),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text("Ok"),
                ),
              ],
            ),
          );
        }
      },
      builder: (blocContext, homeState) {
        final filtered = _query.isEmpty
            ? homeState.weatherdata
            : homeState.weatherdata
                  .where(
                    (w) =>
                        w.cityName.toLowerCase().contains(_query.toLowerCase()),
                  )
                  .toList();
        return Scaffold(
          backgroundColor: Colors.purple,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            title: Text(
              context.localizations.SavedLocations,
              style: context.textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 8),
                TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) => setState(() => _query = value),
                  decoration: InputDecoration(
                    hintText: context.localizations.SearchCity,
                    hintStyle: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white60,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white38),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white38),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: SvgPicture.asset(
                        AppIcons.search,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white60,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: filtered.isEmpty
                      ? Center(
                          child: Text(
                            _query.isEmpty
                                ? context.localizations.NoSavedLocations
                                : context.localizations.NoResults,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final city = filtered[index];
                            return InkWell(
                              overlayColor: const WidgetStatePropertyAll(
                                Colors.transparent,
                              ),
                              onTap: () =>
                                  _showDeleteDialog(blocContext, city.cityName),
                              child: LocationCard(model: city),
                            );
                          },
                        ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.white70;
                      }
                      return Colors.white;
                    }),
                    backgroundColor: WidgetStateColor.resolveWith(
                      (_) => const Color(0xff535353).withValues(alpha: 0.64),
                    ),
                    shape: const WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  onPressed: () => _showAddCityDialog(blocContext),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.plusCircle,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          context.localizations.AddNewCity,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
