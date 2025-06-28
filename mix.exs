defmodule PrometheusPlugs.Mixfile do
  use Mix.Project

  @source_url "https://github.com/deadtrickster/prometheus-plugs"
  @version "1.2.0"

  def project do
    [
      app: :prometheus_plugs,
      version: @version,
      elixir: "~> 1.18",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: [
        main: "readme",
        source_ref: "v#{@version}",
        source_url: @source_url,
        extras: ["README.md": [title: "Prometheus Plugs"]]
      ]
    ]
  end

  def application do
    [applications: [:logger, :prometheus_ex, :accept]]
  end

  defp description do
    """
    Prometheus monitoring system client Plugs. Http metrics collector and exporter.
    """
  end

  defp package do
    [
      maintainers: ["Ilya Khaprov"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Prometheus.erl" => "https://hex.pm/packages/prometheus",
        "Prometheus.ex" => "https://hex.pm/packages/prometheus_ex",
        "Inets HTTPD Exporter" => "https://hex.pm/packages/prometheus_httpd",
        "Ecto Instrumenter" => "https://hex.pm/packages/prometheus_ecto",
        "Phoenix Instrumenter" => "https://hex.pm/packages/prometheus_phoenix",
        "Process info Collector" => "https://hex.pm/packages/prometheus_process_collector"
      }
    ]
  end

  defp deps do
    [
      {:accept, "~> 0.3"},
      {:plug, "~> 1.18"},
      {:prometheus, "~> 5.1", override: true},
      {:prometheus_ex, "~> 4.0", override: true},
      {:prometheus_process_collector, "~> 1.6", optional: true},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
