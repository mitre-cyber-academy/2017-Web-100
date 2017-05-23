require 'sinatra'

correctUsername = 'username'
correctPassword = 'password'

get '/' do
  '<title>No Page</title>
<h1>Please access the <a href="/home">Home Page</a></h1>'
end

get '/home' do
  erb :home
end

post '/login' do
    if params['uname'].to_s.eql? correctUsername
      if params['pwd'].to_s.eql? correctPassword
        @username = correctUsername.to_s
        erb :login
      else
        erb :incorrect
      end
    else
      erb :incorrect
    end
end

get '/*' do
  redirect'/'
end

__END__

@@ home
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
<h1>Meretricious Security Cams</h1>
Please login or register to access your camera remotely.
<br><br><br>
<form id="login" method="post" action="/login">
    <label for="uname">Username:</label><br>
    <input type="text" id="uname" name="uname"><br>
    <label for="pwd">Password:</label><br>
    <input type="password" id="pwd" name="pwd"><br>
    <button type="submit">Login</button>
</form>
</body>
</html>

@@ login
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
Welcome <%= @username %>!
<br>
Your security camera feed can be found below
<br>
<br>
<br>
<video autoplay loop poster="https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif" height="600" width="700">
    <source src="IMG_0116.mp4" type="video/mp4">
</video>
</body>
</html>

@@ incorrect
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Incorrect</title>
</head>
<body>
<h1>Meretricious Security Cams</h1>
Please login or register to access your camera remotely.
<br><br><br>
<form id="login" method="post" action="/login">
    <label for="uname">Username:</label><br>
    <input type="text" id="uname" name="uname"><br>
    <label for="pwd">Password:</label><br>
    <input type="password" id="pwd" name="pwd"><br>
    <button type="submit">Login</button>
</form>
<h3><p style="color: red">Username or Password was incorrect.  Please try again.</p></h3>
</body>
</html>