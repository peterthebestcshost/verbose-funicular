FROM python:3.9-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt requirements.txt

# Install the Python dependencies
RUN pip3 install -r requirements.txt

# Copy the entire project into the container
COPY . .

# Grant full permission (read, write, execute) to python3 and main.py
RUN chmod +x /usr/local/bin/python3 && chmod +x /app/main.py

# Ensure we run as root (the default user) to edit files in system directories like /etc
USER root

# Command to run the application
CMD ["python3", "main.py"]
