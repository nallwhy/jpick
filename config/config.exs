# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

config :jpick_web,
  generators: [context_app: :jpick]

# Configures the endpoint
config :jpick_web, JpickWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yXa2NrjnRfPgusxyITmAnsO04Msfr6r/FD/6Am/3KUeBhW3PWofzawrX9bVMzc0e",
  render_errors: [view: JpickWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JpickWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
