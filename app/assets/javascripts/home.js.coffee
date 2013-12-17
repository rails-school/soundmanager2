window.Radio ||= {}

#
soundManager.onready ->
    url = "http://download.ted.com/talks/MarcoAnnunziata_2013S.mp4?service=html5&apikey=talk_page"#"http://video.ted.com/talk/podcast/2013S/None/MarcoAnnunziata_2013S.mp4"
    sound = soundManager.createSound(
      id: "media-object"
      url: url
      onload: ->
        alert "loaded"
        @.play()
    ).load()

