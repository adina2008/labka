-- 1. Сұраныс: Мәзірдегі тағамдардың орташа бағасын табу (Агрегаттық функция AVG)
SELECT AVG(price) AS average_price 
FROM Dish;

-- 2. Сұраныс: Тағамдарды санаттар бойынша топтау және әр санаттағы тағам санын табу (GROUP BY, COUNT)
SELECT category, COUNT(*) AS total_dishes 
FROM Dish 
GROUP BY category;

-- 3. Сұраныс: Орташа бағадан қымбат тағамдарды табу және бағасы бойынша кему ретімен сұрыптау (WHERE, ORDER BY)
SELECT name, price 
FROM Dish 
WHERE price > (SELECT AVG(price) FROM Dish)
ORDER BY price DESC;

-- 4. Сұраныс: Пайдаланушылардың рөлдерін қайталанбайтындай етіп алу (DISTINCT)
SELECT DISTINCT role 
FROM "User";

-- 5. Сұраныс: Тапсырыс саны 1-ден көп пайдаланушыларды топтап сүзгілеу (GROUP BY, HAVING, COUNT)
SELECT user_id, COUNT(*) AS order_count 
FROM "Order" 
GROUP BY user_id 
HAVING COUNT(*) >= 1;