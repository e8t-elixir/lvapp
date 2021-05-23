.PHONY: dev cli

dev:
	mix phx.server

cli:
	iex -S mix phx.server
