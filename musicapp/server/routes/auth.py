import os
import uuid
import bcrypt
from fastapi import Depends, HTTPException, APIRouter, Header
import jwt
from database import get_db
from models.user import User
from pydantic_schemas.user_login import UserLogin
from pydantic_schemas.user_create import UserCreate
from sqlalchemy.orm import Session
from dotenv import load_dotenv

load_dotenv(dotenv_path='flutter_learning\musicapp\server\.env')
password_key = os.getenv("JWT_PASSWORD")

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


    token = jwt.encode({'id':user_db.id}, password_key)

    return {'token': token, 'user': user_db}

@router.get('/')
def current_user_data(db: Session=Depends(get_db), x_auth_token=Header()):
    # get the user token from the header
    if not x_auth_token:
        raise HTTPException(401, "No auth token provided!")
    # decode the token
    jwt.decode(x_auth_token, password_key)
    # validate the token
    # extract payload (ID) from token
    # get user info from db
    pass