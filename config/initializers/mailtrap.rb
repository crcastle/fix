if ENV['MAILTRAP_API_TOKEN']
  require 'rubygems' if RUBY_VERSION < '1.9'
  require 'rest-client'
  require 'json'

  response = RestClient.get "https://mailtrap.io/api/v1/inboxes.json?api_token=#{ENV['MAILTRAP_API_TOKEN']}"

  first_inbox = JSON.parse(response)[0] # get first inbox
  
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :user_name => first_inbox['username'],
    :password => first_inbox['password'],
    :domain => first_inbox['domain'],
    :port => 2525,
    :authentication => :cram_md5
  }
end
