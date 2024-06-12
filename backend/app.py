from flask import Flask
import psycopg2
import psycopg2.extras
import logging

app = Flask(__name__)

logging.basicConfig(level=logging.INFO)

DATABASE_URL = 'postgresql://postgres@79.141.77.75/todo_db'

def get_db_connection():
    conn = psycopg2.connect(DATABASE_URL)
    return conn

@app.route('/')
def main():
    try:
        conn = get_db_connection()
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute('SELECT id, task_name, category_id FROM tasks;')
        tasks = cur.fetchall()
        cur.close()
        conn.close()

        task_list = "<h1>Tasks List:</h1>"
        for task in tasks:
            task_list += f"<p>ID: {task['id']}, Task Name: {task['task_name']}, Category ID: {task['category_id']}</p>"
        return task_list
    except Exception as e:
        logging.error(f"An error occurred: {str(e)}")
        return f"An error occurred: {str(e)}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
