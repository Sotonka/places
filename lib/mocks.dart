import 'package:places/domain/sight.dart';

final List<Sight> mocks = [
  Sight(
    name: 'Coffee Republic',
    lat: 48.478995,
    lon: 135.070003,
    url: 'https://cofrep.ru/',
    details: 'Кофе Репаблик, Хабаровск',
    type: SightType.cafe,
  ),
  Sight(
    name: 'Plantacia Coffee',
    lat: 48.476516,
    lon: 135.082078,
    url: 'https://vk.com/plantaciacoffee',
    details: 'Plantacia Coffee, Хабаровск',
    type: SightType.cafe,
  ),
  Sight(
    name: 'Парк Динамо',
    lat: 48.483385,
    lon: 135.07593,
    url:
        'https://www.dvhab.ru/city/%D0%B4%D0%BE%D1%81%D1%82%D0%BE%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%87%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D0%B8/%D0%93%D0%BE%D1%80%D0%BE%D0%B4%D1%81%D0%BA%D0%BE%D0%B9%20%D0%BF%D0%B0%D1%80%D0%BA%20%D0%BE%D1%82%D0%B4%D1%8B%D1%85%D0%B0%20%C2%AB%D0%94%D0%B8%D0%BD%D0%B0%D0%BC%D0%BE%C2%BB/',
    details: 'Городской парк культуры и отдыха "Динамо"',
    type: SightType.park,
  ),
];
