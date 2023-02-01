import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons extends StatelessWidget {
  static const _add = '${_defaultPath}add.svg';
  static const _back = '${_defaultPath}back.svg';
  static const _bag = '${_defaultPath}bag.svg';
  static const _bucket = '${_defaultPath}bucket.svg';
  static const _cafe = '${_defaultPath}cafe.svg';
  static const _calendar = '${_defaultPath}calendar.svg';
  static const _camera = '${_defaultPath}camera.svg';
  static const _choice = '${_defaultPath}choice.svg';
  static const _close = '${_defaultPath}close.svg';
  static const _confirm = '${_defaultPath}confirm.svg';
  static const _file = '${_defaultPath}file.svg';
  static const _filter = '${_defaultPath}filter.svg';
  static const _forward = '${_defaultPath}forward.svg';
  static const _heart = '${_defaultPath}heart.svg';
  static const _heartFull = '${_defaultPath}heart_full.svg';
  static const _hotel = '${_defaultPath}hotel.svg';
  static const _list = '${_defaultPath}list.svg';
  static const _listFull = '${_defaultPath}list_full.svg';
  static const _map = '${_defaultPath}map.svg';
  static const _mapFull = '${_defaultPath}map_full.svg';
  static const _museum = '${_defaultPath}museum.svg';
  static const _park = '${_defaultPath}park.svg';
  static const _particular = '${_defaultPath}particular.svg';
  static const _photo = '${_defaultPath}photo.svg';
  static const _restaurant = '${_defaultPath}restaurant.svg';
  static const _roadGuide = '${_defaultPath}road_guide.svg';
  static const _route = '${_defaultPath}route.svg';
  static const _search = '${_defaultPath}search.svg';
  static const _settings = '${_defaultPath}settings.svg';
  static const _settingsFull = '${_defaultPath}settings_full.svg';
  static const _share = '${_defaultPath}share.svg';
  static const _splash = '${_defaultPath}splash.svg';
  static const _tap = '${_defaultPath}tap.svg';

  static const String _defaultPath = 'res/icons/';

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  const AppIcons({
    required this.assetPath,
    this.width,
    this.height,
    this.fit,
    this.color,
    Key? key,
  }) : super(key: key);

  factory AppIcons.add({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _add,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.back({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _back,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.bag({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _bag,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.bucket({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _bucket,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.cafe({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _cafe,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.calendar({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _calendar,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.camera({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _camera,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.choice({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _choice,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.close({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _close,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.confirm({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _confirm,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.file({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _file,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.filter({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _filter,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.forward({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _forward,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.heart({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _heart,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.heartFull({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _heartFull,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.hotel({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _hotel,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.list({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _list,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.listFull({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _listFull,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.map({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _map,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.mapFull({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _mapFull,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.museum({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _museum,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.park({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _park,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.particular({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _particular,
        color: color,
        height: height,
        width: width,
      );
  factory AppIcons.photo({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _photo,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.restaurant({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _restaurant,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.roadGuide({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _roadGuide,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.route({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _route,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.search({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _search,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.settings({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _settings,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.settingsFull({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _settingsFull,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.share({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _share,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.splash({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _splash,
        color: color,
        height: height,
        width: width,
      );

  factory AppIcons.tap({
    final Color? color,
    final double? height,
    final double? width,
  }) =>
      AppIcons(
        assetPath: _tap,
        color: color,
        height: height,
        width: width,
      );

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        color: color,
        key: key,
      );
}
