############################################################################
# Copyright 2009, 2010 Benjamin Kellermann                                 #
#                                                                          #
# This program is free software: you can redistribute it and/or modify it  #
# under the terms of the GNU General Public License as published by the    #
# Free Software Foundation, either version 3 of the License, or (at your   #
# option) any later version.                                               #
#                                                                          #
# This program is distributed in the hope that it will be useful, but      #
# WITHOUT ANY WARRANTY; without even the implied warranty of               #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        #
# General Public License for more details.                                 #
#                                                                          #
# You should have received a copy of the GNU General Public License along  #
# with this program.  If not, see <http://www.gnu.org/licenses/>.          #
############################################################################

# the documents to be compiled by default
DOC=$(shell basename $(shell pwd))

# your favorite pdf viewer
# (I recommend evince or okular as they update rebuilt pdfs automatically)
PDFVIEWER=evince

default: $(foreach i,$(DOC),$i.pdf)

%.pdf: %.ly $(wildcard *.ly)
	$(call checkForRunningProcess,$*)
	lilypond $*

final: $(foreach i,$(DOC),$i_final.pdf)
%_final.pdf: %.pdf
	$(call checkForRunningProcess,$*)
	lilypond -dno-point-and-click $*
	qpdf --linearize $*.pdf $*_tmp.pdf
	mv $*_tmp.pdf $*.pdf
	cp $*.pdf $*_final.pdf

clean:
	rm -f $(foreach ext,ps,*.$(ext))

distclean: $(foreach i,$(DOC),distclean_$i)
distclean_%: clean
	rm -f $(foreach ext,midi pdf,$*.$(ext))

checkForRunningProcess = \
	@if [ -f /tmp/$(1)_watch.pid ];then\
		WATCHID=`cat /tmp/$(1)_watch.pid`;\
		if [ `ps --pid $$WATCHID|wc -l` = 2 ];then\
			echo "\033[31mThere is a \"make watch\" running!\033[0m";\
			return 1;\
		fi;\
	fi

watch: $(foreach i,$(DOC),watch_$i)
watch_%: %.pdf
	$(call checkForRunningProcess,$*)
	echo $$PPID > /tmp/$*_watch.pid
	cp $< /tmp/
	if [ -z "`ps x |grep "$(PDFVIEWER) /tmp/$<" |grep -v grep`" ];then $(PDFVIEWER) /tmp/$<; fi&
	while true; do\
		FILE=`inotifywait -r -e close_write --format="%w%f" --exclude '(/[^\\.]*\$$|\\.swp\$$|qt_temp\\..*)' . 2>/dev/null`;\
		EXT=`echo $$FILE|sed -e 's/^.*\.\([^.]*\)$$/\1/g'`;\
		case $$EXT in\
		ly);;\
		*)\
			echo "$$FILE was modified and I don't know what to do!";\
			continue;\
			;;\
		esac;\
		lilypond $*;\
		if [ $$? -eq 0 ];then\
			cp $< /tmp/;\
		else\
			echo "\033[31mSOMETHING WENT WRONG, PLEASE CHECK THE CONSOLE!!!\033[0m";\
		fi;\
	done

.PHONY: default final clean distclean watch
