# Quick Deployment Steps

## Fastest Option: Render (Free)

### 1. Push to GitHub
```bash
git add .
git commit -m "Ready for deployment"
git push origin main
```

### 2. Deploy on Render
1. Go to https://render.com
2. Sign up/login with GitHub
3. Click "New +" → "Web Service"
4. Connect your GitHub repo
5. Configure:
   - **Name**: `globespin-backend`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
6. Click "Create Web Service"
7. Wait for deployment (2-3 minutes)
8. Copy your URL (e.g., `https://globespin-backend.onrender.com`)

### 3. Test
```bash
curl https://your-app.onrender.com/countries
```

### 4. Update Swift App
Change your base URL from `http://localhost:3000` to your Render URL.

---

## Alternative: Railway (Also Free)

1. Go to https://railway.app
2. Sign up with GitHub
3. "New Project" → "Deploy from GitHub repo"
4. Select your repo
5. Railway auto-detects everything
6. Get your URL

---

## Files Created for Deployment

✅ `.gitignore` - Excludes unnecessary files
✅ `Procfile` - For Heroku deployment
✅ `render.yaml` - For Render deployment
✅ `DEPLOYMENT.md` - Full deployment guide

Your server is ready to deploy! 🚀

