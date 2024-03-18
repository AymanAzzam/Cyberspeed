From python:3.10

## Layer 1:
# Create a working directory
Workdir /app

## Layer 2:
# Copy source code to working directory
Copy . /app

## Layer 3:
# Update linux packages
Run apt-get update

## Layer 4:
# Install packages from requirements.txt
Run pip install -r requirements.txt

## Step 4:
# Expose port 80
Expose 80

## Step 5:
# Run app.py at container launch
Cmd [ "flask","run","--host=0.0.0.0", "--port=8080" ]