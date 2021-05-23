.PHONY: dev cli route

dev:
	mix phx.server

cli:
	iex -S mix phx.server
	
route:
	mix phx.routes
