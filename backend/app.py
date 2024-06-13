from flask import Flask, render_template
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
        return render_template('index.html', tasks=tasks)
    except Exception as e:
        logging.error(f"An error occurred: {str(e)}")
        return f"An error occurred: {str(e)}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
