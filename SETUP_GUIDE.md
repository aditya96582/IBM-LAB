# Samadhan AI - Setup Guide

## Quick Start

1. **Run the project immediately:**
   ```
   Double-click on `run-project.bat`
   ```
   
   This will start both the backend (Flask) and frontend (React) servers.

## Project Structure

- **Frontend**: React + TypeScript + Vite (Port 5173)
- **Backend**: Flask + Python (Port 5000)

## Dependencies Fixed

✅ **All dependencies have been updated and fixed:**

- Updated `langchain` from 0.1.25 to 0.3.27
- Updated `langchain-community` from 0.0.38 to 0.3.7
- Fixed numpy compatibility issues for Python 3.13
- Updated all other dependencies to compatible versions

## Optional Configuration

The project works out of the box with fallback systems, but you can optionally configure API keys for enhanced features:

### Backend API Keys (Optional)

Edit `flask-backend/.env` file:

```env
# IBM WatsonX (Optional - for advanced AI features)
WATSONX_API_KEY=your_watsonx_api_key_here
WATSONX_DEPLOYMENT_ID=your_deployment_id_here
WATSONX_URL=your_watsonx_url_here

# OpenRouter (Optional - for AI fallback)
OPENROUTER_API_KEY=your_openrouter_api_key_here
```

### Frontend API Keys (Optional)

Create `.env` file in root directory:

```env
# Firebase (Optional - for user authentication)
VITE_FIREBASE_API_KEY=your_firebase_api_key_here
VITE_FIREBASE_AUTH_DOMAIN=your_project.firebaseapp.com
VITE_FIREBASE_PROJECT_ID=your_project_id

# Google Gemini AI (Optional - for enhanced AI features)
VITE_GEMINI_API_KEY=your_gemini_api_key_here

# ElevenLabs (Optional - for voice features)
VITE_ELEVENLABS_API_KEY=your_elevenlabs_api_key_here
```

## Manual Installation (if needed)

### Frontend Dependencies
```bash
cd "c:\Users\hp\Desktop\IBM Hack\Samadhan-AI-main"
npm install
```

### Backend Dependencies
```bash
cd "c:\Users\hp\Desktop\IBM Hack\Samadhan-AI-main\flask-backend"
pip install -r requirements.txt
```

## Running Manually

### Start Backend
```bash
cd flask-backend
python app.py
```

### Start Frontend
```bash
npm run dev
```

## Access URLs

- **Frontend**: http://localhost:5173
- **Backend**: http://localhost:5000
- **Backend Health**: http://localhost:5000/health

## Features

- ✅ Government complaint management system
- ✅ AI-powered complaint analysis
- ✅ Real-time analytics dashboard
- ✅ Voice chat capabilities
- ✅ Multi-language support
- ✅ Firebase integration ready
- ✅ Comprehensive UP government dataset

## Troubleshooting

1. **Port conflicts**: If ports 5000 or 5173 are busy, the servers will automatically use alternative ports.

2. **Python version**: This project is tested with Python 3.13. If you have issues, try Python 3.9-3.12.

3. **Node.js version**: Requires Node.js 16 or higher.

4. **Dependencies**: All dependencies have been fixed and updated for compatibility.

## Project Status

🟢 **Ready to run** - All dependencies resolved and compatible versions installed.