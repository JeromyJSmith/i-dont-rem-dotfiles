#! /bin/bash

# https://github.com/pgrange/bash_unit

main() {
	echo "Running tests on Bash scripts..."
	test_check_num_args
	test_setValue
	test_in_list
	echo "...done"
}

test_check_num_args() {
	echo "args"
}


test_setValue() {
	echo "value"
}


test_in_list() {
	echo "list"
}


### Execute
main "$@"
