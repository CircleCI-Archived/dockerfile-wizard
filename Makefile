ready:
	@grep -q '##' .circleci/config.yml && cp .circleci/config.yml config.yml.template && perl -i -pe 's/##//g' .circleci/config.yml

reset:
	@[ -f config.yml.template ] && cat config.yml.template > .circleci/config.yml && rm config.yml.template

setup:
	scripts/setup.sh