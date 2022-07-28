install:
	poetry install

test:
	poetry run pytest

lint:
	poetry run flake8 package/ tests/

format:
	poetry run isort --profile black package/ tests/
	poetry run black package/ tests/

bandit:
	poetry run bandit -r package tests

safety:
	poetry run safety check

selfcheck:
	poetry check

check: selfcheck test format lint

build: check
	poetry build

publish:
	poetry publish --dry-run

package-install:
	python3 -m pip install --user --force-reinstall dist/*.whl

.PHONY: install test lint selfcheck check build