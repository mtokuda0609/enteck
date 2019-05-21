class RelationshipChannel < ApplicationCable::Channel
  def subscribed
    stream_from "relationship_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    ActionCable.serve.broadcast 'relationship_channel', message: data['message']
  end
end
