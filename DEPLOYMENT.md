# Deployment Guide - GlobeSpin Backend

This guide covers deploying the GlobeSpin backend API to various cloud platforms.

## Prerequisites

- Node.js project is ready
- Git repository initialized
- All dependencies listed in `package.json`

---

## Option 1: Render (Recommended - Free Tier Available)

Render offers a free tier with automatic deployments from GitHub.

### Steps:

1. **Push your code to GitHub** (if not already):
   ```bash
   git add .
   git commit -m "Ready for deployment"
   git push origin main
   ```

2. **Create a Render account**:
   - Go to https://render.com
   - Sign up with GitHub

3. **Create a new Web Service**:
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the repository

4. **Configure the service**:
   - **Name**: `globespin-backend`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: Free (or choose a paid plan)

5. **Environment Variables** (optional):
   - `NODE_ENV`: `production`
   - `PORT`: Will be set automatically by Render

6. **Deploy**:
   - Click "Create Web Service"
   - Render will automatically build and deploy

7. **Get your URL**:
   - Your API will be available at: `https://globespin-backend.onrender.com`
   - Update your Swift app to use this URL instead of `localhost:3000`

---

## Option 2: Railway

Railway provides easy deployment with automatic HTTPS.

### Steps:

1. **Install Railway CLI** (optional):
   ```bash
   npm i -g @railway/cli
   ```

2. **Deploy via Railway Dashboard**:
   - Go to https://railway.app
   - Sign up with GitHub
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your repository

3. **Configure**:
   - Railway auto-detects Node.js
   - Start command: `npm start`
   - Port: Railway sets this automatically

4. **Get your URL**:
   - Railway provides a URL like: `https://your-app.up.railway.app`

---

## Option 3: Heroku

Heroku is a popular platform with a free tier (limited hours).

### Steps:

1. **Install Heroku CLI**:
   ```bash
   brew install heroku/brew/heroku
   # Or download from https://devcenter.heroku.com/articles/heroku-cli
   ```

2. **Login to Heroku**:
   ```bash
   heroku login
   ```

3. **Create a Heroku app**:
   ```bash
   heroku create globespin-backend
   ```

4. **Deploy**:
   ```bash
   git push heroku main
   ```

5. **Open your app**:
   ```bash
   heroku open
   ```

Your API will be at: `https://globespin-backend.herokuapp.com`

---

## Option 4: Vercel (Serverless)

Vercel is great for serverless deployments.

### Steps:

1. **Install Vercel CLI**:
   ```bash
   npm i -g vercel
   ```

2. **Deploy**:
   ```bash
   vercel
   ```

3. **Follow the prompts**:
   - Link to existing project or create new
   - Vercel will auto-detect settings

4. **Production deployment**:
   ```bash
   vercel --prod
   ```

---

## Option 5: DigitalOcean App Platform

### Steps:

1. Go to https://cloud.digitalocean.com/apps
2. Click "Create App"
3. Connect GitHub repository
4. Configure:
   - **Type**: Web Service
   - **Build Command**: `npm install`
   - **Run Command**: `npm start`
5. Choose a plan (starts at $5/month)
6. Deploy

---

## Testing Your Deployed API

Once deployed, test your endpoints:

```bash
# Replace YOUR_URL with your actual deployment URL
curl https://YOUR_URL/countries
curl https://YOUR_URL/country/japan
curl https://YOUR_URL/health
```

---

## Updating Your Swift App

After deployment, update your Swift app's base URL:

**Before (local):**
```swift
let baseURL = "http://localhost:3000"
```

**After (deployed):**
```swift
let baseURL = "https://your-app.onrender.com"
// or
let baseURL = "https://your-app.up.railway.app"
```

---

## Environment Variables

If you need to set environment variables (like API keys):

**Render:**
- Go to your service → Environment → Add Environment Variable

**Railway:**
- Go to your project → Variables → Add Variable

**Heroku:**
```bash
heroku config:set VARIABLE_NAME=value
```

---

## Troubleshooting

### Port Issues
- Most platforms set `PORT` automatically
- Your code already uses `process.env.PORT || 3000`, so it should work

### Build Failures
- Check that all dependencies are in `package.json`
- Ensure `node_modules` is in `.gitignore`
- Check build logs in your platform's dashboard

### CORS Issues
- Your server already has CORS enabled for all origins
- If issues persist, check your platform's documentation

---

## Recommended: Render (Free Tier)

For this project, **Render** is recommended because:
- ✅ Free tier available
- ✅ Automatic HTTPS
- ✅ Easy GitHub integration
- ✅ Automatic deployments
- ✅ Simple configuration

---

## Quick Deploy Command (Render)

If you have the Render CLI installed:

```bash
render deploy
```

---

## Need Help?

- Render Docs: https://render.com/docs
- Railway Docs: https://docs.railway.app
- Heroku Docs: https://devcenter.heroku.com
























