require 'sinatra'
require 'sinatra/reloader'
require 'pg'

configure :development, :test do
  require 'pry'
end

Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

def db_connection
  begin
    connection = PG.connect(dbname: 'acceptance-testing')
    yield(connection)
  ensure
    connection.close
  end
end

get '/' do
  @title = "Hello World"
  erb :index
end

