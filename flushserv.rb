#!/usr/bin/env ruby

require "open3"

require "rubygems"
require "haml"
require "sinatra"

ALLOWED_OPTIONS = %w(f font s S k W o w width F filter gay metal E export irc html)

configure do
  set :toilet, ENV["TOILET_PATH"] || "toilet"
  set :toilet_fonts, ENV["TOILET_FONTS_PATH"] || "/usr/local/share/figlet"
end

get "/" do
  if message = params[:message]
    options = extract_options(params)
    toilet(message, options)
  else
    haml :index
  end
end

post "/" do
  if message = params[:message]
    options = extract_options(params)
    toilet(message, options)
  end
end

get "/fonts" do
  stdout_from("ls #{settings.toilet_fonts}").split("\n").map do |filename|
    filename[/^(.*)\..*$/, 1]
  end.join("\n")
end

helpers do
  def stdout_from(command)
    Open3.popen3(command)[1].read
  end
  
  def escape_backticks(string)
    string.gsub("`", "\\`")
  end
  
  def extract_options(params)
    {}.tap do |opts|
      params.each do |key, value|
        if ALLOWED_OPTIONS.include?(key)
          opts[key] = value
        end
      end
    end
  end # extract_options!
  
  def toilet(message, args = {})
    command = settings.toilet + " "
    command << args.map do |key, value|
      arg = (key.length == 1 ? "-" : "--")
      arg << key
      arg << %{ "#{escape_backticks(value)}"} unless value.nil?
      arg
    end.join(" ") + " "
    command << %{"#{escape_backticks(message)}"}
    stdout_from(command)
  end
  
  def link(path)
    url = "http://#{request.host}#{request.port != 80 ? ":" + request.port.to_s : ""}/#{path}"
    "<a href=\"#{url}\">#{url}</a>"
  end
end
