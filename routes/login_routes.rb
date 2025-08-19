require 'sinatra/base'
require 'json'
require_relative '../routes/db'

class LoginRoutes < Sinatra::Base

    before do
        content_type :json
    end

    post '/user/login' do

        client = db_client
        request.body.rewind
        
        data = request.body.read
        phone = data['email']
        passkey = data['passkey']

        doesuserexists = client.execute("select 1 from users where email='#{email}' AND passkey='#{passkey}'")
        rows = doesuserexists.to_a

        if rows.size > 0
            {response: 200}.to_json
        else
            {response: 404}.to_json
        end
    end
end
