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
# Notes:
#   Uses holman/fuck-yeah as a provider. Can be altered to use the original FYN,
#   but be sure to read the caveats in the comments.
#
# Author:
#   iangreenleaf

providers =
  holman: (noun) ->
    noun = escape noun
    "http://fuckyeah.herokuapp.com/#{noun}"

module.exports = (robot) ->
  robot.hear /fuck yeah (.+)/i, (msg) ->
    noun = msg.match[1]
    url = providers.holman noun

    msg.send url
