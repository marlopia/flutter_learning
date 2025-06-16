import uuid
import bcrypt
from fastapi import Depends, HTTPException, APIRouter
from database import get_db
from models.user import User
from pydantic_schemas.user_create import UserCreate
from sqlalchemy.orm import Session

router = APIRouter()

@router.post('/signup')
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