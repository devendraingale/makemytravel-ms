# Use an OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the .war file from your local machine to the container at /app
COPY ./target/makemytravel-ms-0.0.1.war /app/application.war

# Expose port 8080 (adjust if your application uses a different port)
EXPOSE 8080

# Command to run the application when the container starts
CMD ["java", "-jar", "application.war"]
