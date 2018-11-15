.PHONY: test-single

single-template := test-single-template.sh
single-test := test-single-function.sh
function := install-firefox
image := 18.04-configuration
full-test := linux-full.sh
post-install-tasks := post-instal-tasks.sh

build:
	docker build -t ${image} .


shell:
		docker run --rm -it -v ${PWD}:${PWD} -w ${PWD} \
		${image} /bin/bash

test-full:
	echo "[*] running full test..." && docker run --rm -it -v ${PWD}:${PWD} \
		-w ${PWD} ${image} sudo /bin/bash ${full-test} && /bin/bash ${post-install-tasks}

test-single:
		cp ${single-template} ${single-test} && sed -i "s/&&&/${function}/g" ${single-test} && \
		echo "[*] testing function ${function}..." && docker run --rm -it -v ${PWD}:${PWD} -w ${PWD} ${image} \
			sudo /bin/bash ${single-test}; rm ${single-test}