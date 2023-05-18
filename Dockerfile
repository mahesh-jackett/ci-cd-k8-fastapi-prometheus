# 
FROM python:3.9


WORKDIR /code

# 
COPY ./requirements.txt /code/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# copy everything from THIs to Virtual machine MAchine's THIS
COPY ./ /code

# 
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5555"]