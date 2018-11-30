# Since configuration is shared in umbrella projects, this file
# should only configure the :slackir_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :slackir_web,
  ecto_repos: [Slackir.Repo],
  generators: [context_app: :slackir, binary_id: true]

# Configures the endpoint
config :slackir_web, SlackirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CXUFvhY+lEBaLfxxtJFxB/Og0QIx9aNsrL4CR9lFKeMwYF0/SNa+F2ohic6VPl5E",
  render_errors: [view: SlackirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SlackirWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
