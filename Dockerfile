# Step 1: Base image lena (Nginx server)
FROM nginx:alpine

# Step 2: Apne code (html file) ko container ke web folder mein copy karna
COPY index.html /usr/share/nginx/html/index.html

# Step 3: Nginx default port 80 use karta hai
EXPOSE 80
        
