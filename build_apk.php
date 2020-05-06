<?php
set_time_limit(0);
$cmd ='export PATH=$PATH:/var/www/vhosts/jobadoa.com/goflite.jobadoa.com/flutter_sdk/bin; flutter clean $ANDROID_HOME 2>&1';
exec($cmd,$out,$return);

$cmd ='export PATH=$PATH:/var/www/vhosts/jobadoa.com/goflite.jobadoa.com/flutter_sdk/bin; flutter pub get $ANDROID_HOME 2>&1';
exec($cmd,$out,$return);

$cmd ='export PATH=$PATH:/var/www/vhosts/jobadoa.com/goflite.jobadoa.com/flutter_sdk/bin; flutter pub run flutter_launcher_icons:main $ANDROID_HOME 2>&1';
exec($cmd,$out,$return);

$cmd ='export PATH=$PATH:/var/www/vhosts/jobadoa.com/goflite.jobadoa.com/flutter_sdk/bin; flutter build apk --release 2>&1';
exec($cmd,$out,$return);
?>