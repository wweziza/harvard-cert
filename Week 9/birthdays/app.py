from flask import Flask, render_template, request, redirect
import sqlite3

app = Flask(__name__)

def get_db_connection():
    conn = sqlite3.connect('birthdays.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        # Add the user's entry into the database
        name = request.form.get("name")
        month = request.form.get("month")
        day = request.form.get("day")

        conn = get_db_connection()
        conn.execute("INSERT INTO birthdays (name, month, day) VALUES (?, ?, ?)",
                     (name, month, day))
        conn.commit()
        conn.close()

        return redirect("/")
    else:
        # Display the entries in the database on index.html
        conn = get_db_connection()
        birthdays = conn.execute("SELECT * FROM birthdays").fetchall()
        conn.close()
        return render_template("index.html", birthdays=birthdays)

if __name__ == "__main__":
    app.run(debug=True)
