require 'sinatra'

get '/' do
  erb :index
end

get '/admin' do
  erb :admin
end

post '/' do
  @user_name = params[:user_name]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @title = "Hello"
  @message = "Dear #{@user_name}, we`ll be waiting you at #{@date_time}"

  f = File.open ./public/'appointment.txt', 'a'
  f.write "Client: #{@user_name}, Phone: #{@phone}, Appointment Date: #{@date_time}\n"
  erb :message
end

post '/' do
  @login = params[:login]
  @password = params[:password]
  @title = "Hello Mr.Admin"

  if @login == "Admin" and @password == "Secret"
    erb :admin
  elsif
    @login == "Admin" and @password == "Admin"
    @message = "Nice try"
    erb :index
  else
    erb :index
  end
end
