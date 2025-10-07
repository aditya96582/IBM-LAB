@echo off
echo ========================================
echo  Samadhan AI - GitHub Upload Script
echo ========================================
echo.

echo Step 1: Make sure you've created a new repository on GitHub
echo Step 2: Copy your repository URL (it should look like: https://github.com/yourusername/your-repo-name.git)
echo.

set /p REPO_URL="Enter your GitHub repository URL: "

echo.
echo Adding remote repository...
git remote add origin %REPO_URL%

echo.
echo Checking current branch...
git branch -M main

echo.
echo Pushing to GitHub...
git push -u origin main

echo.
echo ========================================
echo Upload complete! Your project is now on GitHub.
echo Repository URL: %REPO_URL%
echo ========================================
pause