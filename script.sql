-- 1. Пайдаланушылар кестесі
CREATE TABLE "User" (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    role VARCHAR(20) CHECK (role IN ('клиент', 'повар', 'админ', 'официант'))
);

-- 2. Тағам/Мәзір кестесі
CREATE TABLE Dish (
    dish_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0),
    category VARCHAR(50) NOT NULL,
    is_available BOOLEAN DEFAULT TRUE
);

-- 3. Тапсырыс кестесі
CREATE TABLE "Order" (
    order_id INT PRIMARY KEY,
    user_id INT,
    table_number INT NOT NULL,
    total_amount DECIMAL(10,2) DEFAULT 0,
    status VARCHAR(30) CHECK (status IN ('Қабылданды', 'Дайындалуда', 'Дайын')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);

-- 4. Тапсырыс құрамы (OrderItem) кестесі
CREATE TABLE OrderItem (
    item_id INT PRIMARY KEY,
    order_id INT,
    dish_id INT,
    quantity INT CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES "Order"(order_id) ON DELETE CASCADE,
    FOREIGN KEY (dish_id) REFERENCES Dish(dish_id)
);

-- 5. Төлем кестесі
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    amount DECIMAL(10,2) NOT NULL,
    payment_type VARCHAR(20) DEFAULT 'QR',
    FOREIGN KEY (order_id) REFERENCES "Order"(order_id)
);

-- Мәліметтер енгізу (INSERT)
INSERT INTO "User" (user_id, name, phone, role) VALUES 
(1, 'Айдын Қали', '+77011234567', 'клиент'),
(2, 'Асан Аспазші', '+77029876543', 'повар'),
(3, 'Динара Админ', '+77055554433', 'админ');

INSERT INTO Dish (dish_id, name, price, category, is_available) VALUES 
(1, 'Цезарь салаты', 2500.00, 'Салаттар', TRUE),
(2, 'Рибай стейк', 6500.00, 'Ыстық тағам', TRUE),
(3, 'Американо кофесі', 900.00, 'Сусындар', TRUE);

INSERT INTO "Order" (order_id, user_id, table_number, total_amount, status) VALUES 
(1, 1, 4, 9000.00, 'Қабылданды');

INSERT INTO OrderItem (item_id, order_id, dish_id, quantity, price) VALUES 
(1, 1, 1, 1, 2500.00),
(2, 1, 2, 1, 6500.00);

INSERT INTO Payment (payment_id, order_id, amount, payment_type) VALUES 
(1, 1, 9000.00, 'QR');