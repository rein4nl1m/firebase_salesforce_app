import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:injectable/injectable.dart';

@injectable
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver get analyticsObserver => FirebaseAnalyticsObserver(
        analytics: _analytics,
      );
}
