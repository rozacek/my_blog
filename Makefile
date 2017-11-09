PORT=80

define cyanecho
	@tput -T dtterm setaf 6
	@echo $1
	@tput sgr0
endef

define redecho
	@tput -T dtterm setaf 1
	@echo $1
	@tput sgr0
endef


define greenecho
	@tput -T dtterm setaf 2
	@echo $1
	@tput sgr0
endef

start_uwsgi:
	$(call cyanecho, "Running the uwsgi server on rozacek.ayz.pl:$(PORT)")
	uwsgi --plugin http,python --http rozacek.ayz.pl:$(PORT) --chdir /home/rozacek/apps/my_blog/ --wsgi-file my_blog/wsgi.py --master --processes 1 --workers 1 --threads 1 --check-static /home/rozacek/domains/rozacek.ayz.pl/public_html/static/

kill_uwsgi:
	@echo "Killing all uwsgi processes"
	-kill_uwsgi.sh
