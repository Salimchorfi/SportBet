require 'facebook/messenger'
include Facebook::Messenger

$availableSport = ["nfl", "ncaaf", "ncaab", "nba", "mlb", "nhl", "mls", "champions-league", "soccer", "ufc"]


# class Listener
#   Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

#   Bot.on :message do |message|
#     Bot.deliver({
#       recipient: message.sender,
#       message: {
#         text: 'Uploading your message to skynet.'
#       }
#     }, access_token: ENV['ACCESS_TOKEN'])
#   end
# end
