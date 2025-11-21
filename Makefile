vendor_lrs:
	rm -f src/monodromy/vendor/lrslib/bin/linux-x86_64 src/monodromy/vendor/lrslib/bin/win-amd64
	nix build .#lrs -o src/monodromy/vendor/lrslib/bin/linux-x86_64
	nix build .#lrs_mingw -o src/monodromy/vendor/lrslib/bin/win-amd64

wheel: vendor_lrs
	uv build --wheel
wheel_devenv:
	nix develop --impure --command make wheel
.PHONY: vendor_lrs wheel wheel_devenv
