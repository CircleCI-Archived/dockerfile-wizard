ready:
	@cp .circleci/config.yml config.yml.template
	@perl -i -pe 's/##//g' .circleci/config.yml
	
reset:
	@cat config.yml.template > .circleci/config.yml
	@rm config.yml.template