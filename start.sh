#!/bin/sh

mkdir -p /config
mkdir -p /config/cache

touch /config/config.ini
touch /config/sickbeard.db
touch /config/sickbeard.db.v32
touch /config/sickbeard.db.v33
touch /config/sickbeard.db.v34
touch /config/sickbeard.db.v35
touch /config/sickbeard.db.v36
touch /config/sickbeard.db.v37
touch /config/sickbeard.db.v38
touch /config/sickbeard.db.v39
touch /config/sickbeard.db.v40
touch /config/sickbeard.db.v41
touch /config/sickbeard.db.v42
touch /config/sickbeard.db.v43
touch /config/sickbeard.db.v44

#                             
# Set up the user to run Sickrage as
#                                   
if [ "x$PUID" = "x" ]; then   
  export PUID=0               
fi                            
if [ "x$GUID" = "x" ]; then   
  export GUID=0               
fi                            
                              
chown -R "${PUID}":"${GUID}" /config
                                    
# First, we remove any existing sickrage entries to avoid duplicates
sed -i '/^sickrage/d' /etc/passwd                                   
                                    
# We need to add the user because busybox's su does not accept UID numbers
echo "sickrage:x:${PUID}:${GUID}:Sickrage user:/dev/null:/bin/sh" >>/etc/passwd

#                           
# Start Sickrage
#
su sickrage -c "/usr/bin/python /sickrage/SickBeard.py --datadir=/config/ --config=/config/config.ini"

