:: Copyright (c) 2021 NVIDIA CORPORATION & AFFILIATES
:: This script requires a valid python installation in the user's path

start py -m http.server 8000 
:wait_for_server
py -c "import socket; s=socket.socket(); s.settimeout(0.5); s.connect(('localhost',8000)); s.close()" >nul 2>&1 || (timeout /t 1 /nobreak >nul & goto :wait_for_server)
start http://localhost:8000/index.html