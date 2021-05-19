defmodule DiscussWeb.UserSocket do
  use Phoenix.Socket

  ##Channels
  #channel "room:*", Disccuss.RoomChannel
  channel "comments:*", Discuss.CommentsChanel
  #get "/comments/:id", CommentController, :join, :handle_in

  ##Transports
  transport :websocket, Phoenix.Transports.WebSocket
  #transports :longpoll, Phoenix.Transports.LongPoll


  @impl true
  def connect(%{"token" => token}, socket) do
    case Phoenix.Token.verify(socket, "key", token) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}
      {:error, _error } ->
        {:error}
    end
  end

  @impl true
  def id(_socket), do: nil
end
