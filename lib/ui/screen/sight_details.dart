import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;

  const SightDetails({super.key, required this.sight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              height: 360,
              child: Image.network(
                'https://regions.kidsreview.ru/sites/default/files/styles/card_600_400/public/10/02/2015_-_1132/kofe_repablik_habarovsk.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    sight.name,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFF3B3E5B),
                      height: 28.8 / 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        sight.typeAsText,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF3B3E5B),
                          height: 18 / 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'закрыто до 09:00',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7C7E92),
                          height: 18 / 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    sight.details,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF3B3E5B),
                      height: 18 / 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // кнопка не совсем такая, переделаю как будут отдельные виджеты
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF4CAF50),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.route),
                    label: const Text('ПОСТРОИТЬ МАРШРУТ'),
                  ),
                  const SizedBox(height: 24),
                  const Divider(
                    height: 0,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Expanded(
                        child: CustomButton(
                          icon: Icon(Icons.calendar_today),
                          isActive: false,
                          title: 'Запланировать',
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          icon: Icon(Icons.favorite),
                          isActive: true,
                          title: 'В Избранное',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Icon icon;
  final bool isActive;
  final String title;
  const CustomButton({
    super.key,
    required this.icon,
    required this.isActive,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // у иконки нельзя выбрать цвет, поменяю когда отдельно будут виджеты
            icon,
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isActive
                    ? const Color(0xFF3B3E5B)
                    : const Color(0xFF7C7E92).withOpacity(0.56),
                fontSize: 14,
                height: 18 / 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
