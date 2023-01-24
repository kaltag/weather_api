Тестовое задание: API для статистики по погоде
Как источник данных можно использовать https://developer.accuweather.com/apis.
Город можно использовать любой (можно захардкодить).
API открыт для всех, авторизация не нужна.

Необходимые эндпоинты:

/weather/current - Текущая температура
/weather/historical - Почасовая температура за последние 24 часа (https://developer.accuweather.com/accuweather-current-conditions-api/apis/get/currentconditions/v1/%7BlocationKey%7D/historical/24)
/weather/historical/max - Максимальная темперетура за 24 часа
/weather/historical/min - Минимальная темперетура за 24 часа
/weather/historical/avg - Средняя темперетура за 24 часа
/health - Статус бекенда (Можно всегда отвечать OK)
Должны быть интеграционные тесты на эндпоинты и юнит тесты на общие классы/модули.
