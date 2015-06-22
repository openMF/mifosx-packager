VER=15.03
MINV=2
PKGFILE=mifosx_$(VER)-$(MINV)_all.deb

package: $(PKGFILE)

$(PKGFILE): package/DEBIAN/postinst
	dpkg-deb --build package .

clean: cleanpkg cleanrepo

cleanpkg:
	rm $(PKGFILE)

cleanrepo:
	rm -rf mifosx-packages dists

repo: $(PKGFILE)
	mkdir -p mifosx-packages
	cp $(PKGFILE) mifosx-packages
	dpkg-scanpackages mifosx-packages /dev/null > Packages
	gzip -c Packages > Packages.gz
	mkdir -p dists/stable/main/binary-i386 dists/stable/main/binary-amd64
	cp Packages Packages.gz dists/stable/main/binary-i386
	mv Packages Packages.gz dists/stable/main/binary-amd64
	./update-release.sh
	gpg --textmode --output - -u terence@sanjosesolutions.in --sign -b < dists/stable/Release > dists/stable/Release.gpg
	
install: repo
	sudo rsync -a mifosx-packages dists /var/www/repo
