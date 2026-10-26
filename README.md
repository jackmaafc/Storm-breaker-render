# Multi-Language Cloud Host (Render + Docker)

This repository packages a complete `public_html` hosting environment with native support for:
- **PHP 8.2-FPM** (via Nginx FastCGI)
- **Node.js** (reverse proxied via `/api/node/`)
- **Python Flask** (reverse proxied via `/api/python/`)

---

## Folder Layout

* `public_html/` — Put your HTML, CSS, JavaScript, and `.php` files here.
* `node-app/` — Put your Node.js backend logic here (`server.js`).
* `python-app/` — Put your Python backend logic here (`app.py`).

---

## 2-Step Deployment to Render

### 1. Push this folder to a new GitHub repo:
```bash
git init
git add .
git commit -m "Deploy multi-language public_html"
git branch -M main
git remote add origin https://github.com/<YOUR_USERNAME>/<YOUR_REPO>.git
git push -u origin main
```

### 2. Connect to Render:
1. Open [dashboard.render.com](https://dashboard.render.com).
2. Click **New +** -> **Web Service**.
3. Select your GitHub repository.
4. Set **Runtime** to `Docker` (if not auto-selected).
5. Choose the **Free** instance tier.
6. Click **Create Web Service**.
