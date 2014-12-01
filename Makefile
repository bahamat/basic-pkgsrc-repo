PACKAGES=$(wildcard *tgz)

pkg_summary.gz: $(PACKAGES)
	pkg_info -X $^ | gzip -9 > $@

clean:
	$(RM) pkg_summary.gz

mrclean: clean
	$(RM) $(PACKAGES)
