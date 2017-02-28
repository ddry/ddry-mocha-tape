.PHONY: c- coveralls mocha tap tape test

c-%:
	coffee -c$*o . source

coveralls:
	make tape tap
	istanbul cover ./node_modules/mocha/bin/_mocha spec/main.js --report lcovonly -- -R spec && cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && rm -rf ./coverage

mocha:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/main.js \
		--check-leaks

tap:
	node_modules/.bin/tap spec/main.js

tape:
	tape spec/main.js | node_modules/.bin/tap-spec

test: mocha tape tap
