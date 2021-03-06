formatTimespan = (seconds, hasHour, isFirstFixed) ->
    twoDigits = (n) -> (if n < 10 then "0" else "") + n.toString()
    n = seconds
    if hasHour
        h = Math.floor(n / 3600)
        n = seconds - h * 3600
    m = Math.floor(n / 60)
    n = seconds - m * 60
    s = Math.floor(n)
    if hasHour
        if isFirstFixed
            "#{twoDigits(h)}:#{twoDigits(m)}:#{twoDigits(s)}"
        else
            "#{h}:#{twoDigits(m)}:#{twoDigits(s)}"
    else
        if isFirstFixed
            "#{twoDigits(m)}:#{twoDigits(s)}"
        else
            "#{m}:#{twoDigits(s)}"
preventDefaultEventHandler = (event) -> event.preventDefault()
isTouchDevice = do ->
    try
        document.createEvent("TouchEvent")
        true
    catch e
        false
remoteGet = (url, callback) ->
    request = new XMLHttpRequest()
    request.onload = ->
        callback(JSON.parse(this.responseText))
    request.open("GET", url)
    request.send()
