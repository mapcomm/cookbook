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

osmium tags-filter california.osh.pbf \
	building=church,cathedral,chapel,mosque,synagogue,temple \
	amenity=place_of_worship denomination=* religion=* name=*church* \
	 -o california_pow.osh.pbf
	 
# To convert to geojson (using GDAL):
# ...but don't forget to get GDAL if you don't already have it:
# brew install gdal

ogr2ogr -f GeoJSON california_pow.geojson california_pow.osh.pbf
