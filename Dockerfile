FROM python:3.8

LABEL maintainer="ari -- follow me on dev.to https://dev.to/ari_hacks | twitter @ari_hacks"

COPY requirements.txt .
RUN pip3 install -r requirements.txt

EXPOSE 5000

COPY ./app /app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5000"]