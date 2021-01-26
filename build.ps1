$ip = Read-Host "Please enter your IP Address"
((Get-Content ./mps/.mpsrc) -replace('"common_name": "*((\w.?)+)"',('"common_name": "' + $ip + '"'))) | Set-Content ./mps/.mpsrc
((Get-Content ./sample-web-ui/src/app.config.js) -replace("'localhost'",("'" + $ip + "'"))) | Set-Content ./sample-web-ui/src/app.config.js


cd ./mps
npm install
cd ../rps
npm install
cd ../sample-web-ui
npm install
cd ..