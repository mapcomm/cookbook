# install osmosis first, see: http://wiki.openstreetmap.org/wiki/Osmosis/Installation#OS_X
# you may need to update java runtime, use “brew cask install java” and then “export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)”
# get build files from http://wiki.openstreetmap.org/wiki/Planet.osm#Country_and_area_extracts

osmosis \
 --read-pbf GB \
 --tf accept-nodes building=church,cathedral,chapel,mosque,synagogue,temple amenity=place_of_worship denomination=* religion=* name=*church* \
 --tf reject-ways \
 --tf reject-relations \
 --write-xml GB_pow.osm.xml