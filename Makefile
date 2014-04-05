all: get-deps compile-plugin compile

get-deps:
	./rebar get-deps

compile-plugin:
	./compile_plugin.sh

compile:
	./rebar compile

run:
	erl -pa deps/*/ebin ebin -s echo_server start

clean:
	./rebar clean
