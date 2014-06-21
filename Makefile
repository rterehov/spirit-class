default: _requirements db end
class: _production_requirements collectstatic end
dev.class: _dev_requirements collectstatic end
st.class: _production_requirements collectstatic end

_production_requirements:
	@echo "Installing production requirements"
	@pip install --exists-action=s -r docs/production.txt

_dev_requirements:
	@echo "Installing development requirements"
	@pip install --exists-action=s -r docs/develop.txt

_requirements:
	@echo "Installing common requirements"
	@pip install --exists-action=s -r docs/common.txt

req: _requirements

db: syncdb loaddata_spirit createcachetable_spirit migrate

loaddata_spirit:
	@echo "Load data spirit"
	@python manage.py loaddata spirit_init

createcachetable_spirit:
	@echo "Create cache table spirit"
	@python manage.py createcachetable spirit_cache

migrate:
	@echo "Running migrations"
	@python manage.py migrate -v 0 --traceback

syncdb:
	@echo "Syncing database and loading initial fixtures"
	@python manage.py syncdb --noinput -v 0

loadsql:
	@echo "Inserting sql fixtures"
	@python manage.py sqlall cities -v 0

collectstatic:
	@echo "Collect static"
	@python manage.py collectstatic --noinput -v 0

compress:
	@echo "Compress"
	@python manage.py compress -v 0

run:
	@python manage.py runserver

runpub:
	@python manage.py runserver 0.0.0.0:8000

test:
	@python manage.py test --noinput $(APPS)

shell:
	@python manage.py shell_plus

end:
	@echo "Make complete ok"

clean:
	@echo "Cleaning *.pyc files"
	@find . -name "*.pyc" -exec rm -f {} \;

collect_static:
	python manage.py collectstatic -l --noinput

compilemessages:
	python manage.py compilemessages

makemessages:
	python manage.py makemessages -a
