require 'semantics3'

# Your Semantics3 API Credentials
API_KEY = 'SEM3AF73B740374E5D0F7F156B048135F9BC'
API_SECRET = 'YTIzZjU3MzEzZGI2ZTYyMWU0NWFlYzI3YTc1NjQwNDQ'

# Set up a client to talk to the Semantics3 API
sem3 = Semantics3::Products.new(ENV[API_KEY], ENV[API_SECRET])