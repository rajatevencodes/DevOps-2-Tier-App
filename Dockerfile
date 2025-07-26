# ------------------- Stage 1: Build Stage ------------------------------
    FROM python:3.11 AS builder

    WORKDIR /app
    
    # Install build dependencies
    RUN apt-get update && \
    # no recommended packages , C compiler for building native code , MYSQL libs , pkg-config : Finds installed libs for compiling code
        apt-get install -y --no-install-recommends gcc default-libmysqlclient-dev pkg-config && \
        rm -rf /var/lib/apt/lists/*
    
    # Copy requirements and install
    COPY requirements.txt .
    RUN pip install --no-cache-dir -r requirements.txt
    
    # ------------------- Stage 2: Final Stage ------------------------------
    FROM python:3.11-slim
    
    WORKDIR /app
    
    # Install runtime dependencies
    RUN apt-get update && \
    # libmarioadb3 : written in C talks to mySQL server
        apt-get install -y --no-install-recommends libmariadb3 && \
        rm -rf /var/lib/apt/lists/*
    
    # Copy only installed dependencies and app code
    COPY --from=builder /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages/
    COPY . .
    
    EXPOSE 5001
    
    CMD ["python", "app.py"]