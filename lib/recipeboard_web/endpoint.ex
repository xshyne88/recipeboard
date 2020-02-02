defmodule RecipeboardWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :recipeboard

  socket "/socket", RecipeboardWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library(),
    length: 100_000_000


  plug Plug.MethodOverride
  plug Plug.Head
  plug RecipeboardWeb.Router

end
