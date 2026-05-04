.PHONY: fmt
fmt:
	make -C Taipei-City-Dashboard-BE fmt
	make -C Taipei-City-Dashboard-DE fmt

.PHONY: lint
lint:
	make -C helm-chart lint
	make -C Taipei-City-Dashboard-DE lint

.PHONY: dev-run
dev-run:
	make -C docker dev-run

.PHONY: dev-stop
dev-stop:
	make -C docker dev-stop