# Prueba programada Rails: Super Zapatos

Prueba Tecnica para Growth Acceleration Partners con:
* Ruby 2.0.0
* Rails 4.0.4
* Postgresql 0.15.1

# Services description:

List all stores:

	Request Method:	GET
	Path:	/services/stores
	Parameters:	None
	Sample request:	Load all the stores that are stored in the Database.
	Response:	{
				  "stores": [
					{
						"id": 1,
						"address": "Somewhere over the rainbow”,
						"name": "Super Store"
					}, { ... }
				  ],
				  "success": true,
				  “total_elements”: 2
				}
	Errors:	None

List all the articles:

	Request Method:	GET
	Path:	/services/articles
	Parameters:	None
	Sample request:	Load all the articles that are in the Database.
	Response:	{
				  "articles": [
					{
						"id": 1,
						"description": "The best quality of shoes in a green color”,
						"name": "green shoes",
						“price”: 20.15,
						“total_in_shelf”: 25,
						“total_in_vault”: 40,
						“store_name”: “Super Store”
					}, { ... }
				  ],
				  "success": true,
				  “total_elements”: 2
				}
	Errors:	None

List all the articles that are in a specific store:

	Request Method:	GET
	Path:	/services/articles/stores/:id
	Parameters:	id: a numeric value of the ID of the store
	Sample request:	Load all the articles from a specific store that are in the Database.
	Response:	{
				  "articles": [
				    {
					    "id": 1,
					    "description": "The best quality of shoes in a green color”,
					    "name": "green shoes",
					    “price”: 20.15,
					    “total_in_shelf”: 25,
					    “total_in_vault”: 40,
					    “store_name”: “Super Store”
					    }, { ... }
				  ],
				  "success": true,
				  “total_elements”: 2
				}
	Errors:
		Wrong parameters (id is not a number) 
	{"error_msg": "Bad Request","error_code": 400, "success": false}

		No store with that ID
	{"error_msg": "Record not Found", "error_code": 404, "success": false}
	