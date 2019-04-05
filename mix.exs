defmodule ExDrift.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_drift,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.2.0"},
      {:hackney, "~> 1.15.1"},
      {:jason, "~> 1.1"},

      # Docs and Code Clean
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},

      # Test
      {:stream_data, "~> 0.1", only: :test}
    ]
  end
end
