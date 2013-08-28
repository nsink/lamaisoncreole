# When you add new application-wide env-variable,
# Also update the after_initialize section of 
# 'config/application.rb", to preload those constants
# and minimize system call during runtime.

unless Rails.env.production?
  ENV['ALARM_CALL_SCRIPT_DOMMAIN'] = 'http://r-vion.com/'
  ENV['ALARM_CALLBACK_DOMMAIN']    = 'http://r-vion.com/'

  ENV['TWILIO_PHONE_NUMBER_SMS']   = '+33975183819'
  ENV['TWILIO_PHONE_NUMBER_CALL']  = '+33975183819'
  ENV['TWILIO_ACCOUNT']            = 'AC4573e3638570eb34d7fca92eb348e6c5'
  ENV['TWILIO_TOKEN']              = '4a85e36b9770893bc5d85879af3ff7bc'
end


# else, all those variables must be defined in 
# config/initializers/application_config.rb
# THE FILE 'config/initializers/application_config.rb" 
# MUST NOT BE TRACKED! 