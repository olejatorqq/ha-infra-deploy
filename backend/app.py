from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres@79.141.77.75/todo_db'
db = SQLAlchemy(app)

class Todo(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    task = db.Column(db.String(200), nullable=False)
    completed = db.Column(db.Boolean, default=False)

@app.route('/')
def main():
    try:
        todos = Todo.query.all()
        todo_list = "<h1>Todo List:</h1>"
        for todo in todos:
            todo_list += f"<p>Task: {todo.task} - Completed: {todo.completed}</p>"
        return todo_list
    except Exception as e:
        return f"An error occurred: {str(e)}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)