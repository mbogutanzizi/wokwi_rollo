# SPDX-FileCopyrightText: © 2022 Uri Shaked <uri@wokwi.com>
# SPDX-License-Identifier: MIT

SOURCES = src/rollo.chip.c
TARGET  = dist/rollo.wasm

.PHONY: all
all: $(TARGET) rollo.chip.json

.PHONY: clean
clean:
		rm -rf dist

dist:
		mkdir -p dist

$(TARGET): dist $(SOURCES) src/wokwi-api.h
	  clang --target=wasm32-unknown-wasi  -nostartfiles -Wl,--import-memory -Wl,--export-table -Wl,--no-entry  -o $(TARGET) $(SOURCES)

rollo.chip.json: dist 
	  cp src/rollo.chip.json dist
