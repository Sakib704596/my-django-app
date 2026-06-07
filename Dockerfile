# 1. Base image — we start from an official Python image
#    Think of this as the "operating system + Python" already installed for us
FROM python:3.11-slim

# 2. Set working directory inside the container
#    All future commands will run from this folder
WORKDIR /app

# 3. Copy requirements first (smart caching trick — explained below)
COPY requirements.txt .

# 4. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of our app code into the container
COPY app/ .

# 6. Tell Docker our app listens on port 8000
EXPOSE 8000

# 7. The command to start Django when the container runs
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]