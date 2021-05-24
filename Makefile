.PHONY: dev cli routes

dev:
	mix phx.server

cli:
	iex -S mix phx.server
	
routes:
	mix phx.routes
