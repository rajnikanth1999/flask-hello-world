from flask import Flask, render_template, request, redirect
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///tasks.db'
db = SQLAlchemy(app)

class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    description = db.Column(db.String(200))

    def __init__(self, name, description):
        self.name = name
        self.description = description

@app.route("/")
def index():
    tasks = Task.query.all()
    return render_template('index.html', tasks=tasks)

@app.route("/add", methods=["POST"])
def add():
    name = request.form.get("name")
    description = request.form.get("description")
    task = Task(name, description)
    db.session.add(task)
    db.session.commit()
    return redirect("/")

if __name__ == "__main__":
    db.create_all()
    app.run(debug=True)
