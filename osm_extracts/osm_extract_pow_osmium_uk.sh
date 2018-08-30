# A shell scrip which extracts places of worship data from an OpenStreetMap binary pbf dump using osmium
#
# Requires https://github.com/osmcode/osmium-tool
# to install on MacOS: 
# brew install libosmium
# brew install osmium-tool
# Alternately, you can install from source: # git clone https://github.com/osmcode/osmium-tool.git
#
# Example below uses a dump for California, USA, so make sure you substitute yourfilename.osh.pbf 
# for california.osh.pbf and california_pow.osh.pbf below
#
# To get your own dumps, go to http://download.geofabrik.de

osmium tags-filter great-britain-2018Aug29.osm.pbf amenity=place_of_worship -o great-britain-2018Aug29_pow.osm.pbf
	 
osmium tags-filter great-britain-2018Aug29.osm.pbf building=church,cathedral,chapel,mosque,synagogue,temple -o great-britain-2018Aug29_pow_bldgs.osm.pbf

# To convert to geojson (using GDAL):
# ...but don't forget to get GDAL if you don't already have it:
# brew install gdal

# ogr2ogr -f GeoJSON great-britain-2018Aug29_pow.geojson great-britain-2018Aug29_pow.osm.pbf

# Note: gdal currently (as of August 2018) does not support multilayer geojson output, 
# so this will need to be done separately for each layer, as follows:
# (for more on this, see here: https://gis.stackexchange.com/questions/22788/how-do-you-convert-osm-xml-to-geojson#22798)

ogr2ogr -f GeoJSON great-britain-2018Aug29_powpoints.json great-britain-2018Aug29_pow.osm.pbf points
ogr2ogr -f GeoJSON great-britain-2018Aug29_powmultipolygons.json great-britain-2018Aug29_pow.osm.pbf multipolygons

# Note: the remainder of these layers (as of Aug 2018) are either empty or contain erroneously associated data

# ogr2ogr -f GeoJSON great-britain-2018Aug29_powlines.json great-britain-2018Aug29_pow.osm.pbf lines
# ogr2ogr -f GeoJSON great-britain-2018Aug29_powmultilinestrings.json great-britain-2018Aug29_pow.osm.pbf multilinestrings
# ogr2ogr -f GeoJSON great-britain-2018Aug29_powother_relations.json great-britain-2018Aug29_pow.osm.pbf other_relations
