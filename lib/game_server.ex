defmodule PlanningPoker.GameServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %PlanningPoker.Game{}, name: {:global, __MODULE__} )
  end

  def join_game(player) do
    GenServer.cast __MODULE__, {:join_game, player}
  end

  def estimate_story(estimate) do
    GenServer.cast __MODULE__, { :estimate_story, estimate }
  end

  def list_players do
    GenServer.call __MODULE__, :list_players
  end

  def get_estimate do
    GenServer.call __MODULE__, :get_estimate
  end

  def handle_cast({:estimate_story, estimate}, game) do
    {:no_reply, %{ game | estimates: [ estimate | game.estimates ] } }
  end

  def handle_cast({:join_game, player}, game) do
    { :noreply, %{ game | players: [ player | game.players ] } }
  end

  def handle_call(:get_estimate, _from, game) do
    { :reply, PlanningPoker.Game.get_estimate(game) }
  end

  def handle_call(:list_players, _from, game) do
    {:reply, game.players, game}
  end

end
