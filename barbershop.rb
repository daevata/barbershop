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
  f.write "Client: #{@user_name}, Phone: #{@phone}, Appointment Date: #{@date_time}.\n"
  f.close
  erb :message
end

get '/admin' do
  erb :admin
end

post '/admin' do
  @login = params[:login]
  @password = params[:password]

  if @login == "Admin" && @password == "Secret"
    @file = File.open("./users.txt","r")
    erb :result
  else
    @report = 'Access denied'
    erb :admin
  end
end
