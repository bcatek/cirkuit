require 'sinatra'
require 'sinatra/base'
require 'json'
require 'twilio-ruby'

class Token < Sinatra::Base

    get '/token' do

        ACCOUNT_SID = 'ACa62a10d35b6974f68a8a4695f8f31268'
        API_KEY_SID = 'SK194e081e467da3fe9805eb4bfd82a437'
        API_KEY_SECRET = 'Cskv89LJd7sUPn5j5IUM0AKHca8WHWaR'
        TWILIO_TWIML_APP_SID = 'AP2b43165620efbd04fa1a7e0107324b89'

        content_type :json
        identity = "browser_user_#{rand(1000)}"

        # Create Access Token
            token = Twilio::JWT::AccessToken.new(
            ACCOUNT_SID,
            API_KEY_SID,
            API_KEY_SECRET,
            [Twilio::JWT::AccessToken::VoiceGrant.new(outgoing_application_sid: "APxxxxxxxxxxxxxxxxxxxx")],
            identity: identity
  )
            { token: token.to_jwt }.to_json

        end
end
