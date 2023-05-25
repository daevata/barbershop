require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  @user_name = params[:user_name]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @title = "Hello"
  @message = "Dear #{@user_name}, we`ll be waiting you at #{@date_time}"

  f = File.open 'users.txt', 'a'
  f.write "Client: #{@user_name}, Phone: #{@phone}, Appointment Date: #{@date_time}\n"
  erb :message
end
