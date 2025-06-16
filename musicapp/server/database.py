from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# "root" is the bad unsafe password for the dev environment, PLEASE CHANGE IT ON PROD
# URL is 'postgresql://username:password@host:port/dbname'
DATABASE_URL = 'postgresql://postgres:root@localhost:5432/musicapp'

# Connection manager, aka, engine
engine = create_engine(DATABASE_URL)

# Create a connection maker using the connection manager (bind the engine to the session)
SessionLocal = sessionmaker(autocommit = False, autoflush = False, bind = engine)

# Create a session
def get_db():   
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()