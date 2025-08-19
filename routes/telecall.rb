require 'twilio-ruby'
require 'sinatra/base'
require 'sinatra'
require 'json'

class TeleCall < Sinatra::Base

    post '/voice' do

        content_type 'text/xml'

        # Dynamic number from frontend
                target_number = params['To']

         # Bridge browser client <-> real phone
                Twilio::TwiML::VoiceResponse.new do |r|
                if target_number
                    r.dial(number: target_number)
                else
                    r.say(message: "No number provided")
            end
        end.to_s
    end
end

