import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/localization/logic/localization_cubit.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/logic/weather_cubit/weather_cubit.dart';

class WeatherCard extends StatelessWidget {
  final String? apiKey;
  final String? city;
  final double? latitude;
  final double? longitude;

  const WeatherCard({
    super.key,
    this.apiKey,
    this.city,
    this.latitude,
    this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveApiKey =
        apiKey ??
        const String.fromEnvironment(
          'WEATHER_API_KEY',
          defaultValue: '4abe46b4997ab1b87ef8870064118b79',
        );

    if (effectiveApiKey.isEmpty) {
      return Container(
        padding: EdgeInsets.all(context.setMineSize(16)),
        decoration: BoxDecoration(
          color: context.colorScheme.primary.withAlpha(60),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'set_weather_api_key'.tr(context),
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colorScheme.onPrimary.withAlpha(180),
          ),
        ),
      );
    }

    return BlocProvider(
      create: (ctx) {
        final cubit = WeatherCubit(
          effectiveApiKey,
          context.watch<LocaleCubit>().state.locale,
        );
        // trigger fetch once when cubit is created
        if (latitude != null && longitude != null) {
          cubit.fetchByLocation(latitude: latitude!, longitude: longitude!);
        } else {
          cubit.fetchByCityName(city ?? 'Damascus');
        }
        return cubit;
      },
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          Widget content;

          if (state is WeatherLoading || state is WeatherInitial) {
            content = SizedBox(
              height: 100,
              child: Center(
                child: LinearProgressIndicator(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            );
          } else if (state is WeatherLoaded) {
            final w = state.weather;
            final temp = w.temperature?.celsius != null
                ? '${w.temperature!.celsius!.toStringAsFixed(0)}°C'
                : '--';
            final desc = (w.weatherDescription ?? w.weatherMain) ?? '--';
            final humidity = w.humidity != null ? '${w.humidity}%' : '--';
            final wind = w.windSpeed != null ? '${w.windSpeed} km/h' : '--';

            final icon = desc.toLowerCase().contains('rain')
                ? Icons.grain
                : desc.toLowerCase().contains('cloud')
                ? Icons.cloud
                : Icons.wb_sunny;

            content = Container(
              padding: EdgeInsets.all(context.setMineSize(16)),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withAlpha(60),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'current_weather'.tr(context),
                          style: TextStyle(
                            color: context.colorScheme.onPrimary.withAlpha(180),
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: context.setHeight(8)),
                        Text(
                          temp,
                          style: TextStyle(
                            color: context.colorScheme.onPrimary,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: context.setHeight(6)),
                        Text(
                          desc,
                          style: TextStyle(
                            color: context.colorScheme.onPrimary.withAlpha(180),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          icon,
                          color: context.colorScheme.onPrimary,
                          size: 28,
                        ),
                        SizedBox(height: context.setHeight(40)),
                        Text(
                          '${'humidity'.tr(context)}: $humidity',
                          style: TextStyle(
                            color: context.colorScheme.onPrimary.withAlpha(180),
                          ),
                        ),
                        SizedBox(height: context.setHeight(2)),
                        Text(
                          '${'wind'.tr(context)}: $wind',
                          style: TextStyle(
                            color: context.colorScheme.onPrimary.withAlpha(180),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is WeathertError) {
            content = Container(
              padding: EdgeInsets.all(context.setMineSize(16)),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withAlpha(60),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                state.message,
                style: TextStyle(
                  color: context.colorScheme.onPrimary.withAlpha(180),
                ),
              ),
            );
          } else {
            content = SizedBox.shrink();
          }
          return content;
        },
      ),
    );
  }
}
