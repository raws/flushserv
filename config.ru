require "rubygems"
require "sinatra"
require "flushserv"

disable :run
set :environment, :production

ENV["TOILET_PATH"] = "/usr/local/bin/toilet"
ENV["TOILET_FONTS_PATH"] = "/usr/local/share/figlet"

FileUtils.mkdir_p "log" unless File.exists?("log")
log = File.new("log/sinatra.log", "a")
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application
