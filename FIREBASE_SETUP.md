# Firebase Setup Guide for Samadhan AI

## Step 1: Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project"
3. Enter project name: `samadhan-ai-production`
4. Enable Google Analytics (optional)
5. Click "Create project"

## Step 2: Enable Required Services
1. **Firestore Database**:
   - Go to Firestore Database
   - Click "Create database"
   - Choose "Start in test mode"
   - Select location closest to your users

2. **Authentication**:
   - Go to Authentication
   - Click "Get started"
   - Enable Email/Password provider

3. **Storage**:
   - Go to Storage
   - Click "Get started"
   - Choose security rules mode

## Step 3: Get Configuration
1. Go to Project Settings (gear icon)
2. Scroll to "Your apps" section
3. Click "Web app" icon (</>)
4. Register app name: "Samadhan AI Web"
5. Copy the configuration object

## Step 4: Update .env File
Replace the demo values in your .env file with real Firebase config:

```env
VITE_FIREBASE_API_KEY=your_actual_api_key
VITE_FIREBASE_AUTH_DOMAIN=your_project.firebaseapp.com
VITE_FIREBASE_PROJECT_ID=your_actual_project_id
VITE_FIREBASE_STORAGE_BUCKET=your_project.appspot.com
VITE_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
VITE_FIREBASE_APP_ID=your_app_id
```

## Step 5: Set Security Rules
Update Firestore rules for development:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true; // Change this for production
    }
  }
}
```