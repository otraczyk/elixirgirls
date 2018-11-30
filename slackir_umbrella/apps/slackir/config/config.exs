# Since configuration is shared in umbrella projects, this file
# should only configure the :slackir application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :slackir,
  ecto_repos: [Slackir.Repo]

import_config "#{Mix.env()}.exs"
