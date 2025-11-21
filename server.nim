import asynchttpserver, asyncdispatch
import json
import times
import strutils
import uri

proc handleRequest(req: Request) {.async.} =
  let path = req.url.path
  
  case req.reqMethod
  of HttpGet:
    if path == "/":
      await req.respond(Http200, "Hello, World! Welcome to Nim Web Server")
    
    elif path == "/api/time":
      let currentTime = now()
      let response = %*{
        "timestamp": $currentTime,
        "unix": currentTime.toTime().toUnix()
      }
      await req.respond(Http200, $response, newHttpHeaders([("Content-Type", "application/json")]))
    
    elif path.startsWith("/api/greet/"):
      let name = path.split("/")[^1]
      let response = %*{
        "message": "Hello, " & name & "!",
        "timestamp": $now()
      }
      await req.respond(Http200, $response, newHttpHeaders([("Content-Type", "application/json")]))
    
    else:
      await req.respond(Http404, "Not Found")
  
  of HttpPost:
    if path == "/api/echo":
      let body = req.body
      let response = %*{
        "received": body,
        "length": body.len,
        "timestamp": $now()
      }
      await req.respond(Http200, $response, newHttpHeaders([("Content-Type", "application/json")]))
    
    else:
      await req.respond(Http404, "Not Found")
  
  else:
    await req.respond(Http405, "Method Not Allowed")

proc main() {.async.} =
  var server = newAsyncHttpServer()
  echo "Starting Nim Web Server on http://localhost:8080"
  await server.serve(Port(8080), handleRequest)

waitFor main()

