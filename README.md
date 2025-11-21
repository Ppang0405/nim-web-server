# Nim Web Server

A simple, fast web server built with Nim using the Jester framework.

## Features

- Fast and lightweight HTTP server
- RESTful API endpoints
- JSON response support
- URL parameter routing

## Prerequisites

- Nim compiler (>= 1.6.0)
- Nimble package manager

### Installing Nim

**macOS:**
```bash
brew install nim
```

**Linux:**
```bash
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

**Windows:**
Download from [https://nim-lang.org/install.html](https://nim-lang.org/install.html)

## Installation

1. Install dependencies:
```bash
nimble install -d
```

## Running the Server

### Development mode:
```bash
nim c -r server.nim
```

### Production build and run:
```bash
nimble build
./server
```

The server will start on `http://localhost:5000`

## API Endpoints

### GET /
Returns a welcome message.

**Example:**
```bash
curl http://localhost:5000/
```

### GET /api/time
Returns the current server time in JSON format.

**Example:**
```bash
curl http://localhost:5000/api/time
```

**Response:**
```json
{
  "timestamp": "2024-01-15T10:30:00Z",
  "unix": 1705315800
}
```

### GET /api/greet/:name
Returns a personalized greeting.

**Example:**
```bash
curl http://localhost:5000/api/greet/Alice
```

**Response:**
```json
{
  "message": "Hello, Alice!",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### POST /api/echo
Echoes back the request body.

**Example:**
```bash
curl -X POST http://localhost:5000/api/echo \
  -H "Content-Type: application/json" \
  -d '{"test": "data"}'
```

**Response:**
```json
{
  "received": "{\"test\": \"data\"}",
  "length": 16,
  "timestamp": "2024-01-15T10:30:00Z"
}
```

## Project Structure

```
nim-web-server/
├── server.nim              # Main server file
├── nim_web_server.nimble   # Nimble package file
└── README.md              # This file
```

## Configuration

By default, the server runs on port 5000. To change the port, modify the `server.nim` file or set the PORT environment variable:

```bash
PORT=8080 ./server
```

## Development

To enable debug mode and auto-reload:

```bash
nim c -r --debugger:native server.nim
```

## License

MIT License

