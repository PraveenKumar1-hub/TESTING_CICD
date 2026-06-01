# Base image (Python ki light version)     
FROM python:3.9-slim

# Working directory set karo    
WORKDIR /app  

# Ye line aapke code ko folder se container mein daalti hai
COPY . .
# Ek simple command jo container chalne par print karegi
CMD ["echo", "Hello, DevOps Pipeline is working!"]     
  
        
