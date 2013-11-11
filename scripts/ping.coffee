# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong requires 'ping' role
#   hubot echo <text> - Reply back with <text> requires 'ping' role
#   hubot emote <text> - Emote <text> requires 'ping' role
#   hubot time - Reply with current time requires 'ping' role
#   hubot die - End hubot process requires 'kill' role

module.exports = (robot) ->

  msgFromPing = (msg) ->
    name = msg.message.user.name
    robot.Auth.hasRole name, 'ping'

  robot.respond /PING$/i, (msg) ->
    if msgFromPing msg
      msg.send "PONG"

  robot.respond /ECHO (.*)$/i, (msg) ->
    if msgFromPing msg
      msg.send msg.match[1]

  robot.respond /EMOTE (.*)$/i, (msg) ->
    if msgFromPing msg
      msg.emote msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    if msgFromPing msg
      msg.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (msg) ->
    name = msg.message.user.name
    if robot.Auth.hasRole name, 'kill'
      msg.send "Goodbye, cruel world."
      process.exit 0
    else
      msg.reply "Only users with 'kill' role may do that."
