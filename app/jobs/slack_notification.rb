class SlackNotification
  def perform(email, budget)
    if (username = users[email])
      client.chat_postMessage(
        channel: username,
        text: "your monthly coffee payment is due! Please pay #{budget} EUR in cash at the counter.",
        username: "cowalto",
        icon_emoji: ':money_mouth_face:',
        as_user: false
      )
    end
  end

  protected

  def users
    @users = Hash[client.users_list["members"].map{|m| [m["profile"]["email"], "@#{m['name']}"]}]
  end

  def client
    @client ||= Slack::Client.new(token: ENV['SLACK_TOKEN'])
  end
end
