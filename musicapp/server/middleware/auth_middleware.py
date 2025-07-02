import os
from dotenv import load_dotenv
from fastapi import HTTPException, Header
import jwt

# Cargar .env desde una carpeta arriba
dotenv_path = os.path.join(os.path.dirname(__file__), '..', '.env')
load_dotenv(dotenv_path)

password_key = os.getenv("JWT_PASSWORD")

if not password_key:
    raise RuntimeError("JWT_PASSWORD no está definido en el archivo .env")

def auth_middleware(x_auth_token=Header()):
    try:
        if not x_auth_token:
            raise HTTPException(401, "No auth token provided!")

        # Decodificar el token
        verified_token = jwt.decode(x_auth_token, password_key, algorithms=['HS256'])

        if not verified_token:
            raise HTTPException(401, "Token verification failure!")

        # Extraer el id del payload
        uid = verified_token.get('id')
        return {'uid':uid,'token':x_auth_token}

    except (jwt.InvalidSignatureError, jwt.DecodeError, jwt.ExpiredSignatureError):
        raise HTTPException(401, "Invalid or expired token")
    except Exception as e:
        raise HTTPException(500, f"Server error: {str(e)}")
