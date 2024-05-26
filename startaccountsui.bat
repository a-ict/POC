cd AccountsUIService
call meteor npm cache clean
call meteor npm install
set MONGO_URL=mongodb://localhost:27017/sunu
set NODE_TLS_REJECT_UNAUTHORIZED=0
set METEOR_WATCH_POLLING_INTERVAL_MS=30000
meteor --settings settings.json -p 3003
