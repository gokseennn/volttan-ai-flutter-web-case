import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:voltran_ai_web/services/app_service/app_service.dart';

class ResponsiveUtil {
  /// Gives screen size based value.
  /// [xs] < 480 (Mobile portrait)
  /// [s] ≥ 480 (Mobile landscape)
  /// [m] ≥ 768 (Tablet portrait)
  /// [l] ≥ 1024 (Tablet landscape / Small desktop)
  /// [xl] ≥ 1280 (Desktop)
  /// [xxl] ≥ 1440 (Large desktop)
  static T value<T>({
    T? xs,
    T? s,
    T? m,
    T? l,
    T? xl,
    T? xxl,
  }) {
    final context = Get.context ?? AppService.to.appContext;
    final values = [xs, s, m, l, xl, xxl];
    if (values.where((v) => v == null).length == values.length) {
      throw "At least one value must be given!";
    }
    final nonNull = values.firstWhere((v) => v != null) as T;
    if (nonNull is! num) {
      if (values.where((v) => v == null).isNotEmpty) {
        throw "All values must be given on non numeric type!";
      }
    }
    if (context.width >= 1440) {
      if (nonNull is num) {
        return xxl ?? _getOptimalValue(nonNull, 6, 6) as T;
      } else {
        return xxl!;
      }
    } else if (context.width >= 1280) {
      if (nonNull is num) {
        return xl ?? _getOptimalValue(nonNull, 5, 6) as T;
      } else {
        return xl!;
      }
    } else if (context.width >= 1024) {
      if (nonNull is num) {
        return l ?? _getOptimalValue(nonNull, 4, 6) as T;
      } else {
        return l!;
      }
    } else if (context.width >= 768) {
      if (nonNull is num) {
        return m ?? _getOptimalValue(nonNull, 3, 6) as T;
      } else {
        return m!;
      }
    } else if (context.width >= 480) {
      if (nonNull is num) {
        return s ?? _getOptimalValue(nonNull, 2, 6) as T;
      } else {
        return s!;
      }
    } else {
      if (nonNull is num) {
        return xs ?? _getOptimalValue(nonNull, 1, 6) as T;
      } else {
        return xs!;
      }
    }
  }

  static num _getOptimalValue<T>(num current, int index, int lenght) {
    final diff = lenght - index;
    late num val;
    if (index > 2) {
      val = current + (diff * (current * .8));
    } else {
      val = current - (diff * (current * .8));
    }
    val = val.abs();
    return current is int
        ? val.toInt()
        : current is double
        ? val.toDouble()
        : val;
  }
}
