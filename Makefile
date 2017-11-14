PORT=8080
PACKAGES=my_blog

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
	uwsgi --plugin http,python --http rozacek.ayz.pl:$(PORT) --chdir /home/rozacek/apps/my_blog/ --module my_blog.wsgi --master --processes 1 --workers 1 --threads 1 --static-map /static=/home/rozacek/domains/rozacek.ayz.pl/public_html/static --static-expires-type /*=7776000 --offload-threads %k --check-static /home/rozacek/domains/rozacek.ayz.pl/public_html/static --daemonize=/home/rozacek/domains/rozacek.ayz.pl/logs/log_my_blog_uwsgi.txt

kill_uwsgi:
	@echo "Killing all uwsgi processes"
	./kill_uwsgi.sh

restart_uwsgi:
	$(call cyanecho, "Restarting the uwsgi server on rozacek.ayz.pl:$(PORT)")
	./kill_uwsgi.sh
	uwsgi --plugin http,python --http rozacek.ayz.pl:$(PORT) --chdir /home/rozacek/apps/my_blog/ --module my_blog.wsgi --master --processes 1 --workers 1 --threa$
