from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "Allowed All traffic to ec2-18-179-204-125.ap-northeast-1.compute.amazonaws.com"}
