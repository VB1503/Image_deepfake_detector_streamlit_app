# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.8

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install production dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container at /app
COPY . .

# Expose the port that Streamlit runs on
EXPOSE 8501

# Command to run your application
CMD ["streamlit", "run", "--server.port", "8501", "code/PretrainedModel/streamlit_deepfake_detector/multipage_app.py"]
