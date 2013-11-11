# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot die - End hubot process

module.exports = (robot) ->

  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"

  robot.respond /ECHO (.*)$/i, (msg) ->
    name = msg.message.user.name
    if robot.Auth.hasRole name, 'echo'
      msg.send msg.match[1]

  robot.respond /EMOTE (.*)$/i, (msg) ->
    name = msg.message.user.name
    if robot.Auth.hasRole name, 'emote'
      msg.emote msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (msg) ->
    name = msg.message.user.name
    if robot.Auth.hasRole name, 'kill'
      msg.send "Goodbye, cruel world."
      process.exit 0
    else
      msg.reply "Only users with 'kill' role may do that."
