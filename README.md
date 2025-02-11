# Chat App with AnyCable and Docker Compose

This is a WebSocket-enabled chat application using Rails, AnyCable, Redis, and Docker Compose. It runs three separate AnyCable instances, each accessible via different URLs.

## Features

- **Rails app** serving a chat interface
- **WebSocket support** using AnyCable
- **Multiple AnyCable instances** on different ports
- **Redis-based messaging**
- **Monitoring with Prometheus and Grafana**

---

## Running the App with Docker Compose

### ** Build and Start Services**
```sh
docker-compose up --build
```

This will start all services defined in `docker-compose.yml`:

- Rails app on **port 3000**
- Redis on **port 6379**
- AnyCable WebSocket servers on **ports 8081, 8082, 8083**
- Prometheus on **port 9091**
- Grafana on **port 3001**

### **3. Access the Rails App**
Open your browser and go to:
```
http://localhost:3000/
```

### **4. Connect to Different AnyCable Instances**
The WebSocket server is determined by the URL path:

| URL | WebSocket Port |
| ---- | ---- |
| `http://localhost:3000/` | `8081` |
| `http://localhost:3000/1` | `8081` |
| `http://localhost:3000/2` | `8082` |
| `http://localhost:3000/3` | `8083` |

---

## How It Works
- The **Rails app** serves the chat page (`show.html.erb`), where the WebSocket URL is dynamically determined based on the URL path (`/1`, `/2`, `/3`).
- **AnyCable instances** (`anycable-1`, `anycable-2`, `anycable-3`) handle WebSocket connections.
- **Redis** is used for broadcasting messages between AnyCable instances.
- **Prometheus** and **Grafana** monitor WebSocket metrics.

---

