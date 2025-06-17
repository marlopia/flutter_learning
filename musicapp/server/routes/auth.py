import uuid
import bcrypt
from fastapi import Depends, HTTPException, APIRouter
from database import get_db
from models.user import User
from pydantic_schemas.user_login import UserLogin
from pydantic_schemas.user_create import UserCreate
from sqlalchemy.orm import Session

router = APIRouter()

@router.post('/signup', status_code=201)
def signup_user(user: UserCreate, db: Session = Depends(get_db)):

    # Extract client data from request
    print(user.name)
    print(user.email)
    print(user.password)
    # Check if user is already on the DB
    user_db = db.query(User).filter(User.email == user.email).first()
    if user_db:
        raise HTTPException(400,'User email already exists!')
    # Add user if not in DB
    hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())
    user_db = User(id = str(uuid.uuid4()), name = user.name, email = user.email, password = hashed_pw)
    db.add(user_db)
    db.commit()
    db.refresh(user_db)
    return user_db

@router.post('/login')
def login_user(user: UserLogin, db: Session = Depends(get_db)):
    # Check if user email exists
    user_db = db.query(User).filter(User.email == user.email).first()
    if not user_db:
        raise HTTPException(400,'User email does not exist!')
    # Check if password matches
    is_matched = bcrypt.checkpw(user.password.encode(),user_db.password)

    if not is_matched:
        raise HTTPException(400,'Password does not match!')

    return user_db