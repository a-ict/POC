cd EnliMobile
call meteor npm install
set MONGO_URL=mongodb://192.168.1.6:3041/meteor
meteor --settings settings.json run --port 3050 android
