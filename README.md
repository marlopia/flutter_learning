# Flutter Testing

This repository is a collection of sample apps coded with the help of the following YouTube video tutorials:

* [▶️ Mitch Koko - 📱 FULL Flutter Beginner Course • Programming Basics / Widgets / Navigation / User Input / UI](https://www.youtube.com/watch?v=HQ_ytw58tC4)
* [▶️ FreeCodeCamp - Flutter Full Stack Tutorial – Spotify Clone w/ MVVM Architecture, Python, FastAPI, Riverpod](https://www.youtube.com/watch?v=9gpAtzQhYkY)

# Instructions for MusicApp
The music app is more complex and requires a self-hosted database and RestAPI service

To set the Python Virtual Environment for the project run the following:
Bash
```bash
python -m venv venv && source venv/bin/activate && pip install -r requirements.txt
```
Powershell
```powershell
python -m venv venv && .\venv\Scripts\Activate.ps1 && pip install -r requirements.txt
```

To run the FastAPI service run the following command using the previously created virtual environment (venv)

```bash
uvicorn main:app --reload
```

Please properly set up the Postgre database connection variable DATABASE_URL in the server/main.py file, and make sure your database is up and running