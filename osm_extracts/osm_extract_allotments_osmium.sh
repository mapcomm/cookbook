# A shell scrip which extracts 'allotment' garden polygons from an OpenStreetMap binary pbf dump using osmium
#
# Requires https://github.com/osmcode/osmium-tool
# to install on MacOS: 
# brew install libosmium
# brew install osmium-tool
# Alternately, you can install from source: # git clone https://github.com/osmcode/osmium-tool.git
#
# Example below uses a dump for the UK, so make sure you substitute yourfilename.osh.pbf 
# for great-britain-latest.osm.pbf and great-britain-_allotments.osh.pbf below
#
# To get your own dumps, go to http://download.geofabrik.de

osmium tags-filter great-britain-latest.osh.pbf \
	landuse=allotments \
	 -o great-britain-_allotments.osh.pbf
