require 'twitch'

class TwitchBot < Twitch::Client

  def initialize(username, password)
    super(username, password)
  end

  def start
    # Start listening for chat messages
    on :chat do |message|
      # Check if the message is a command
      if message.command?
        # Handle the command
        handle_command(message)
      else
        # Send a reply to the message
        reply(message)
      end
    end

    # Start the bot
    run
  end

  private

  def handle_command(message)
    # Check the command and take action
    case message.command
    when '!shoutout'
      shoutout(message.user)
    when '!hug'
      hug(message.user)
    else
      # Unknown command
      reply(message, "I don't know how to handle that command.")
    end
  end

  def shoutout(user)
    # Send a shoutout to the user
    reply(user, "Hey #{user.name}, thanks for watching!")
  end

  def hug(user)
    # Send a hug to the user
    reply(user, "Hug! <3")
  end

end

# Create a new bot
bot = TwitchBot.new('your_username', 'your_password')

# Start the bot
bot.start
