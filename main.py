from fastapi import FastAPI
from pymongo import MongoClient
import os

app = FastAPI()

try:
    client = MongoClient(f"mongodb://{os.getenv('MONGODB_USERNAME')}:{os.getenv('MONGODB_PASSWORD')}@{os.getenv('MONGODB_URL')}")
    print("DB Connection successful")
except Exception as e: print(e)

@app.get("/")
def read_root():
    return {"Hello": "World"}
