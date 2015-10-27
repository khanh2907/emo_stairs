require 'mqtt'
require 'json'

begin
  namespace :mqtt do
    task :start => :environment do
      MQTT::Client.connect('localhost') do |c|
        c.get('stairs/#') do |topic,message|
          puts "#{topic}: #{message}"
          Reading.create
        end
      end
    end
  end
end