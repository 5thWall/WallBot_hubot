# Description
#   Question accusations of lying on the internet.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   you lie|you('re|r) lying|don't believe you - Questions the accusation
#
# Author:
#   5thWall

module.exports = (robot) ->

  robot.hear /you lie|you('re|r) lying|don't believe you|liar|lies/i, (msg) ->
    msg.send "http://i.imgur.com/XvUsaD9.jpg"
