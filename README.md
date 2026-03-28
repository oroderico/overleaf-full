# Overleaf Full (Self-Hosted)

This project provides a complete Docker-based setup to run **Overleaf (ShareLaTeX)** locally with full LaTeX support (`scheme-full`), using MongoDB (replica set) and Redis.

## 🧠 Context

This setup was originally created to run inside an Umbrel environment (via Portainer), but it works in **any standard Docker environment**.

The goal was to have:
- Full LaTeX support (no missing packages)
- Local, self-hosted Overleaf instance
- Simple and reproducible deployment

---

## ⚙️ Requirements

- Docker
- Docker Compose

---

## 🚀 How to run

### 1. Clone the repository

```bash
git clone https://github.com/oroderico/overleaf-full.git
cd overleaf-full
```

---

### 2. Build and start the containers

```bash
docker compose up -d --build
```

This will:
- Build the custom Overleaf image (with full TeX Live)
- Start MongoDB (with replica set)
- Start Redis
- Start Overleaf

---

### 3. Access Overleaf

Open your browser:

```text
http://umbrel.local:8085
```

---

## 🐳 Services

- **overleaf** → Main application
- **mongo** → Database (replica set enabled)
- **redis** → Cache/session store

---

## 📦 Volumes

Persistent data is stored in:

- `mongo_data`
- `overleaf_data`

---

## 🏗️ Image Details

The Overleaf image is built from:

```dockerfile
FROM sharelatex/sharelatex:latest

RUN tlmgr option repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2025/tlnet-final && \
    tlmgr update --self && \
    tlmgr install scheme-full && \
    tlmgr path add
```

This installs the full TeX Live distribution to avoid missing LaTeX packages.

---

## ⚠️ Notes

- The image is large due to `scheme-full`
- First build may take several minutes
- MongoDB is configured with a single-node replica set (required by Overleaf)

---

## 🔐 Security

This setup is intended for local or controlled environments.

Before exposing to the internet:
- Add authentication layer
- Use HTTPS (reverse proxy)
- Restrict access

---

## 📌 Why not use Overleaf SaaS?

- Full control over data
- Offline capability
- No external dependency
- Custom LaTeX environment

---

## 📄 License

Personal project. Use at your own risk.
