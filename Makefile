download:
	wget -r --no-parent --no-clobber --continue --accept-regex=.*nt.bz2 http://downloads.dbpedia.org/2014/en/
	
unpack:
	for zipfile in $(shell ls downloads.dbpedia.org/2014/en/*.bz2) ; do \
		bunzip2 $$zipfile ; \
	done
