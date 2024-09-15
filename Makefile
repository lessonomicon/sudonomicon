# Runnable tasks.

include common.mk

all: commands

HTML_IGNORES = 'Attribute "x-' 'Attribute "@click' 'Attribute "file"'

## lint: check code and project
lint:
	@ruff check --exclude docs .
	@mccole lint
	@html5validator --root docs --blacklist templates --ignore ${HTML_IGNORES} \
	&& echo "HTML checks passed."

## render: convert to HTML
render:
	mccole render ${CSS}
	@touch docs/.nojekyll

## profile: render with profiling
profile:
	mccole profile ${CSS}
	@touch docs/.nojekyll

## serve: serve generated HTML
serve:
	@python -m http.server -d docs $(PORT)

## stats: basic site statistics
stats:
	@mccole stats
