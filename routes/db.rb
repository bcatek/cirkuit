require 'tiny_tds'

def db_client
TinyTds::Client.new(
  username: 'propkey2025_SQLLogin_1',   
  password: 'bfjy4ef6u5',     
  host: 'getitdb.mssql.somee.com',             
  port: 1433,                    
  database: 'getitdb'              
)
end