#!/bin/bash

sudo -u postgres psql -U postgres -d todo_db << EOF

-- Создаем таблицу категорий
CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(255)
);

-- Создаем таблицу задач
CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    task_name VARCHAR(255),
    category_id INTEGER REFERENCES categories(id)
);

-- Вставляем данные в таблицу категорий
INSERT INTO categories (category_name) VALUES ('Work'), ('Personal'), ('Study');

-- Вставляем данные в таблицу задач
INSERT INTO tasks (task_name, category_id) VALUES 
    ('Complete ha-infra-deploy report', 1),
    ('Call mom', 2),
    ('Finish homework', 3);

EOF