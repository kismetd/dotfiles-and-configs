install:
	poetry install

test:
	poetry run pytest

lint:
	poetry run flake8 brain_games tests/

format:
	poetry run isort --profile black brain_games tests --diff
	poetry run black brain_games tests --diff

sec-check:
	poetry run bandit -r brain_games tests
	poetry run safety check

selfcheck:
	poetry check

check: selfcheck test lint format

build: check
	poetry build

.PHONY: install test lint selfcheck check build