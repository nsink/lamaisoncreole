#encoding: UTF-8
require 'twilio-ruby'

class TwilioClient
	def initialize(args = {})
		params_default = {account_sid: TWILIO_ACCOUNT, auth_token: TWILIO_TOKEN}
		params         = params_default.merge args
		@account_sid   = params[:account_sid]
		@auth_token    = params[:auth_token]
	end

	def send_sms(to, body)
		@client  ||= Twilio::REST::Client.new(@account_sid, @auth_token)
		@account ||= @client.account
		message    = @account.sms.messages.create({:from => TWILIO_PHONE_NUMBER_SMS, :to => to, body: body})
	end
	

	def call_driver(reminder_call)
		@client = Twilio::REST::Client.new @account_sid, @auth_token
		target_url   = ALARM_CALL_SCRIPT_DOMMAIN + "/reminder_calls/#{reminder_call.id}/standard_message.xml"
		callback_url = ALARM_CALLBACK_DOMMAIN    + "/reminder_calls/#{reminder_call.id}/callback"
		
		begin
			m = reminder_call.alternative_number
		  if m.blank?
      	m = reminder_call.driver.mobile
      	if m.nil?
      		raise "Pas de numéro de téléphonne associé à cet appel!"
      	end
      end

			@call = @client.account.calls.create(
			  :from            => TWILIO_PHONE_NUMBER_CALL,
			  :to              => m,
			  :url             => target_url,
			  'Method'         => 'GET',
			  'StatusCallback' => callback_url,
			  'IfMachine'      => 'Hangup')

		rescue StandardError => e
			reminder_call.update_attributes(:status, e)
		end
	end

end