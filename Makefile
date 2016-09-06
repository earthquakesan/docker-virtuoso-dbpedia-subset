download:
	wget -r --no-parent --no-clobber --continue --accept-regex=.*nt.bz2 http://downloads.dbpedia.org/2014/en/
	
unpack:
	for zipfile in $(shell ls downloads.dbpedia.org/2014/en/*.bz2) ; do \
		bunzip2 $$zipfile ; \
	done

prepare-for-docker-image:
	mkdir -p data/toLoad
	mv downloads.dbpedia.org/2014/en/* data/toLoad/
	rm -rf downloads.dbpedia.org

start-dbpedia-full:
	mv data/ ../longdirectorynamenobodygonnause
	docker build -t dbpedia-full .
	mv ../longdirectorynamenobodygonnause ./data
	docker run --name dbpedia-full -p 8890:8890 -p 1111:1111 -v $(shell pwd)/data:/data -d dbpedia-full
