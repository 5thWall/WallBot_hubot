# Description
#   Grab images from "Fuck yeah nouns"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   fuck yeah <noun> - Displays a fuck yeah image for the given noun
#
# Author:
#   iangreenleaf, 5thWall

providers =
  holman: (noun) ->
    noun = escape noun
    "http://fuckyeah.herokuapp.com/#{noun}"

module.exports = (robot) ->
  robot.hear /fuck yeah (.+)/i, (msg) ->
    noun = msg.match[1]
    url = providers.holman noun

    msg.send url
