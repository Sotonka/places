import 'package:places/domain/coordinates.dart';
import 'package:places/domain/sight.dart';

final List<Sight> mocks = [
  Sight(
    id: '0',
    name: 'Coffee Republic1',
    coord: Coord(
      lat: 48.478995,
      lon: 135.070003,
    ),
    url:
        'https://regions.kidsreview.ru/sites/default/files/styles/card_600_400/public/10/02/2015_-_1132/kofe_repablik_habarovsk.png',
    details: 'Кофе Репаблик, Хабаровск',
    type: SightType.cafe,
    visitTime: '111',
    visited: '111',
  ),
  Sight(
    id: '1',
    name: 'Coffee Republic2',
    coord: Coord(
      lat: 48.478995,
      lon: 135.070003,
    ),
    url:
        'https://regions.kidsreview.ru/sites/default/files/styles/card_600_400/public/10/02/2015_-_1132/kofe_repablik_habarovsk.png',
    details: 'Кофе Репаблик, Хабаровск',
    type: SightType.cafe,
    visitTime: '111',
    visited: '111',
  ),
  Sight(
    id: '2',
    name: 'Plantacia Coffee',
    coord: Coord(
      lat: 48.476516,
      lon: 135.082078,
    ),
    url:
        'https://media-cdn.tripadvisor.com/media/photo-s/13/1d/30/43/photo0jpg.jpg',
    details: 'Plantacia Coffee, Хабаровск',
    type: SightType.cafe,
    visitTime: '111',
    visited: '111',
  ),
  Sight(
    id: '3',
    name: 'Парк Динамо',
    coord: Coord(
      lat: 48.483385,
      lon: 135.07593,
    ),
    url:
        'https://regions.kidsreview.ru/sites/default/files/styles/oww/public/09/17/2012_-_2028/dinamo_1.jpg',
    details: 'Городской парк культуры Динамо',
    type: SightType.park,
    visitTime: '111',
    visited: '111',
  ),
  Sight(
    id: '4',
    name: 'Парк Северный',
    coord: Coord(
      lat: 48.531776,
      lon: 135.043736,
    ),
    url:
        'https://avatars.mds.yandex.net/get-altay/5235198/2a0000017afec79e349484da9c8bea5a0537/XXL',
    details: 'Парк Северный',
    type: SightType.park,
    visitTime: '111',
    visited: '111',
  ),
];
