#!/bin/bash

# Two-Tier Flask App Startup Script
echo "🚀 Starting Two-Tier Flask App..."

# Set environment variables
export MYSQL_HOST=localhost
export MYSQL_USER=root
export MYSQL_PASSWORD=""
export MYSQL_DB=flask_app

# Check if MySQL is running
if ! brew services list | grep mysql | grep started > /dev/null; then
    echo "📦 Starting MySQL service..."
    brew services start mysql
    sleep 3
fi

# Create database if it doesn't exist
echo "🗄️  Setting up database..."
mysql -u root -e "CREATE DATABASE IF NOT EXISTS flask_app;" 2>/dev/null

# Run the Flask application
echo "🌐 Starting Flask app on http://localhost:5001"
echo "Press Ctrl+C to stop the server"
echo ""

uv run python app.py 