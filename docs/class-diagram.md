# Кластар диаграммасы (Class Diagram)

Мейрамхана жүйесінің негізгі кластары мен олардың атрибуттары:

- **User (Қолданушы)**
  - `id` (INT, Primary Key)
  - `name` (VARCHAR)
  - `phone` (VARCHAR)

- **Dish (Тағам / Мәзір)**
  - `id` (INT, Primary Key)
  - `title` (VARCHAR)
  - `description` (TEXT)
  - `price` (DECIMAL)

- **Order (Тапсырыс)**
  - `id` (INT, Primary Key)
  - `user_id` (INT, Foreign Key)
  - `dish_id` (INT, Foreign Key)
  - `quantity` (INT)
  - `status` (VARCHAR)
