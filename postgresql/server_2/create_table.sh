#!/bin/bash

sudo -u postgres psql -U postgres -d todo_db << EOF

-- Создаем таблицу категорий, если не существует
CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(255)
);

-- Создаем таблицу задач, если не существует
CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    task_name VARCHAR(255),
    category_id INTEGER REFERENCES categories(id)
);

DO
$$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM categories) THEN
        INSERT INTO categories (category_name) VALUES ('Work'), ('Personal'), ('Study');
    END IF;
END
$$;

DO
$$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM tasks) THEN
        INSERT INTO tasks (task_name, category_id) VALUES 
            ('Complete ha-infra-deploy report', 1),
            ('Call mom', 2),
            ('Finish homework', 3);
    END IF;
END
$$;

EOF