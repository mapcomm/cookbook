# A shell scrip which extracts 'allotment' garden polygons from an OpenStreetMap binary pbf dump using gdal
#
# Requires gdal
# to install on MacOS: 
# brew install gdal
#
# Example below uses a dump for the UK, so make sure you substitute yourfilename.osh.pbf 
# for great-britain-latest.osm.pbf and california_pow.osh.pbf below
#
# To get your own dumps, go to http://download.geofabrik.de
# 
# Credit also to 'user30184' on stackexchange (https://gis.stackexchange.com/questions/98371/how-to-get-shapefile-of-river-from-openstreetmap#98374) 
# who inspired this approach for me.
#
# Worth considering adding a `-spat` option to add a bounding box if you are working with large OSM dumps.

ogr2ogr -f "ESRI Shapefile" -sql "select * from lines where landuse='allotments'" uk_allotments.shp great-britain-latest.osm.pbf --config ogr_interleaved_reading yes

# JK note: Need to confirm whether there are multipolygons in use as well...
# ogr2ogr -f "ESRI Shapefile" -sql "select * from multipolygons where natural='water'" lakes.shp india-latest.osm.pbf --config ogr_interleaved_reading yes

