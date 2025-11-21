import jester
import json
import times

routes:
  get "/":
    resp "Hello, World! Welcome to Nim Web Server"
  
  get "/api/time":
    let currentTime = now()
    resp(%*{
      "timestamp": $currentTime,
      "unix": currentTime.toTime().toUnix()
    })
  
  get "/api/greet/@name":
    resp(%*{
      "message": "Hello, " & @"name" & "!",
      "timestamp": $now()
    })
  
  post "/api/echo":
    let body = request.body
    resp(%*{
      "received": body,
      "length": body.len,
      "timestamp": $now()
    })

runForever()

