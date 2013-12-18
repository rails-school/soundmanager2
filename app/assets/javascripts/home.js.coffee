window.Radio ||= {}

soundManager.onready ->
  url = "http://download.ted.com/talks/ToniGriffin_2013Z.mp4?service=html5&apikey=talk_page"

Radio.App = angular.module('Radio', [])

Radio.App.controller "PlaylistCtrl", ["$scope", ($scope) ->
  $scope.talks = Radio.talks
  $scope.progress = 0

  $scope.play = (talk) ->
    if $scope.currentTalk != talk
      soundManager.destroySound('sound1')
    url = talk.url
    $scope.currentTalk = talk
    $scope.currentSound = soundManager.createSound
      url: url
      id: 'sound1'
      onload: ->
        @play()
      whileplaying: ->
        $scope.updateProgress()
    .load()

  $scope.nextTalk = ->
    amount = $scope.talks.length
    i = $scope.talks.indexOf $scope.currentTalk
    nextTalk = i + 1
    if nextTalk >= amount
      nextTalk = 0
    $scope.play($scope.talks[nextTalk])


  $scope.updateProgress = ->
    console.log $scope.currentSound.position, $scope.currentSound.duration
    p = ($scope.currentSound.position / $scope.currentSound.duration) * 100
    $scope.$apply ->
      $scope.progress = p

  $scope.seekTo = (e) ->
    w = $("#scrubber").width()
    x = e.offsetX
    p = x / w * 100
    seekPosition = $scope.currentSound.duration / 100 * p
    $scope.currentSound.setPosition(seekPosition)

  $scope.stop = ->
    $scope.currentSound.pause()

]


