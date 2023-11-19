#!/bin/bash

# Update package lists
apt-get update

# Install Nginx
apt-get install -y nginx

# Create a directory to store the HTML files
mkdir -p /var/www/html

# Create and write the HTML content to a file
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Vimooz - Register or Login</title>
  <style>
    form {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    label {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      margin-bottom: 10px;
    }
    input {
      width: 100%;
      padding: 5px;
      margin-top: 5px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }
    button[type="submit"] {
      margin-top: 20px;
      padding: 10px;
      border: none;
      border-radius: 3px;
      background-color: #4CAF50;
      color: white;
      font-size: 16px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <h3>Welcome to Vimooz</h3>
  <br>
  <p><a href="/page2">Register or Login</a></p>
  <p><a href="/logout">Logout</a></p>
</body>
</html>
EOF

# Configure Nginx to serve the HTML files
cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

# Restart Nginx to apply the changes
systemctl restart nginx
