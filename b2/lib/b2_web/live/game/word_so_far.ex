defmodule B2Web.Live.Game.WordSoFar do
  alias B2Web.Live.Game.WordSoFar
  use B2Web, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  @states %{
    already_used: "You already picked that letter",
    bad_guess: "That's not in the word",
    good_guess: "Good guess!",
    initializing: "Type or click on your first guess",
    lost: "sorry, you lost...",
    won: "You won!",
  }

  defp state_name(state) do
    @states[state] || "Unknown State"
  end

  def render(assigns) do
    ~H"""
      <div class="word-so-far">
        <div class="game-state">
          <%= state_name(@tally.game_state) %>
        </div>
        <div class="letters">
          <%= for ch <- @tally.letters do %>
          <div {if ch != "_", do: [class: "one-letter correct"], else: [class: "one-letter"] }>
            <%= ch %>
          </div>
          <% end %>
        </div>
      </div>
    """
  end
end
