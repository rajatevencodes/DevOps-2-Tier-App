# Two-Tier Flask App with MySQL : ChatApp

### 📋 Prerequisites

Before running this application, ensure you have the following installed:

### 1. Homebrew (for macOS)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. MySQL

```bash
brew install mysql
```

## 🛠️ Installation & Setup

### Step 1: Clone and Navigate

```bash
cd /Users/rajatsharma/Desktop/two-tier-flask-app
```

### Step 2: Install Dependencies

```bash
uv pip install -r requirements.txt
```

### Step 3: Start MySQL Service

```bash
brew services start mysql
```

### Step 4: Create Database

```bash
mysql -u root -e "CREATE DATABASE IF NOT EXISTS flask_app;"
```

### Step 5: Set Environment Variables

```bash
export MYSQL_HOST=localhost
export MYSQL_USER=root
export MYSQL_PASSWORD=""
export MYSQL_DB=flask_app
```

### Step 6: Run the Application

```bash
sh startLocalServer.sh
```

Make sure to stop the running Servers on port 5001

```bash
sh stopLocalServer.sh
```

## Check All The Messages

```bash
mysql -u root -e "USE flask_app; SELECT * FROM messages;"
```

## Delete the Database

```bash
mysql -u root -e "DROP DATABASE IF EXISTS flask_app;"
```

## 🌐 Access the Application

Once running, open your browser and navigate to:

http://localhost:5001
