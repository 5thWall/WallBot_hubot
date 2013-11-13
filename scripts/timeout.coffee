# Description:
#   Tell robot to part the current room momentarily
#
# Commands:
#   hubot timeout [min] - Cause hubot to part the current room and return in min minutes

noPhrases = [
  "you're not my real dad!",
  "*pthhhbbt*",
  "you are not authorized to issue that command",
  "I'm thinking no",
  "NEIN!",
  "HAHAHAHAHAHA... No.",
  "I'm sorry, what did you say?",
  "NO ONE PUTS BABY IN THE CORNER!",
  "did you say something? I must have had some dontgiveafuck in my ear.",
  "http://mlfw.info/f/9471/",
  "http://mlfw.info/f/2420/",
  "http://mlfw.info/f/3395/",
  "http://s2.quickmeme.com/img/48/483ef0911f5e27073a015b45aee7a288b9c8d3bfa104f8bfe6625572f97cfa52.jpg",
  "https://www.youtube.com/watch?v=0_rc4ltH27A",
  "https://www.youtube.com/watch?v=uxw2xkxFjFE"
]

module.exports = (robot) ->

  canJoinPart = robot.adapter.part? and robot.adapter.join?

  part = (room) ->
    robot.adapter.part room

  join = (room) ->
    robot.adapter.join room

  sayNo = (msg) ->
    msg.reply msg.random noPhrases

  cantDoThat = (msg) ->
    user = msg.message.user.name
    msg.send "Sorry, I don't have the ability to do that #{user}"

  hasTimeoutRole = (msg) ->
    user = msg.message.user.name
    robot.Auth.hasRole user, 'timeout'

  getTimeoutTime = (t = 1) ->
    (parseInt t, 10) * 60 * 1000

  joinAction = (msg) ->
    join msg.message.room

  robot.respond /timeout(?:\s+(\d*)(\s*min)?)?$/i, (msg) ->
    return (cantDoThat msg) unless canJoinPart
    return (sayNo msg) unless hasTimeoutRole msg

    time = getTimeoutTime msg.match[1]

    msg.emote "stomps off"
    part msg.message.room

    setTimeout joinAction, time, msg
