function putREST (server,port,key,value)
    conn=net.createConnection(net.TCP, 0)
    --conn:on("receive", function(conn, payload) print(payload) end)
    conn:connect(port,server)
    conn:send("PUT /rest/items/"..key.."/state HTTP/1.1\r\nHost: "
            ..server..":"..port.."\r\nUser-Agent: esp8266-habrest/0.1\r\nConnection: close\r\nContent-Type: text/plain\r\nContent-Length: "
            ..string.len(value)
            .."\r\n\r\n"
            ..value)
end