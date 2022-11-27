# some common operations

clean_dist:
	rm -rf dist *.egg-info

clean_tests:
	rm -rf .pytest_cache .tox .coverage htmlcov test_report.xml
	py3clean .

clean_mypy:
	rm -rf .mypy_cache

clean: clean_dist clean_mypy clean_tests

test:
	poetry run pytest -n 4 -p no:cacheprovider

test_w_coverage:
	poetry run pytest -v -n 3 --junitxml=test_report.xml --cov-report html --cov=mordomo tests/

package: clean_dist
	python setup.py sdist

mypy:
	poetry run mypy . --ignore-missing-imports

isort:
	poetry run isort .

format: isort
	poetry run black .

export_reqs:
	pip-chill --no-version > requirements.txt
