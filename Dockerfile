#FROM python:3.9-slim

FROM python:3.9

WORKDIR /app

# Install additional dependencies

#RUN apt-get update -y && apt-get upgrade -y && apt-get install -y gcc default-libmysqlclient-dev pkg-config rm -rf /var/lib/apt/lists/*

RUN apt-get install -y gcc libmariadb-dev-compat libmariadb-dev && rm -rf /var/lib/apt/lists/*

# Copy only the files needed for installation
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install mysqlclient separately
RUN pip install --no-cache-dir mysqlclient

# Copy the application files
COPY app.py message.sql templates .

CMD ["python", "app.py"]


