test: init-test-env
	./test.sh

init-test-env:
	echo "TODO: test"

clean:
	@rm -f ./test.sh

#update:

#.SILENT:
.PHONY: clean test init-test-env

