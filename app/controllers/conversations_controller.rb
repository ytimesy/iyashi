class ConversationsController < ApplicationController

  def index
    @message = Message.new(conversation_id: 1, user_id: 1, body: "hello")
  end

  def create
    @message = Message.new(conversation_id: 1, user_id: 1, body: params[:body])
    @message.ai_response = get_ai_response(@message.body)
    render :index
  end



  private

  def get_ai_response(input)
    client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: input}],
        max_tokens: 100,
        n: 1,
        temperature: 0.7,
    })

    response.dig("choices", 0, "message", "content")
  end
end
