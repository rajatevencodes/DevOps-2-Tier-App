#!/bin/bash

# Stop Flask App Script
echo "🛑 Stopping Flask App..."

# Find and kill processes on port 5001
PIDS=$(lsof -ti:5001)

if [ -z "$PIDS" ]; then
    echo "✅ No Flask app running on port 5001"
else
    echo "🔍 Found processes: $PIDS"
    kill -9 $PIDS
    echo "✅ Flask app stopped successfully"
fi 