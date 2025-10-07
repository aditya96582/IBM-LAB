@echo off
echo Deploying Samadhan AI to Netlify...

npm install -g netlify-cli
npm run build
netlify deploy --prod --dir=dist

echo.
echo Deployment complete! Your app will be available at:
echo https://[random-name].netlify.app
pause