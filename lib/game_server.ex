defmodule PlanningPoker.GameServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %PlanningPoker.Game{}, name: {:global, __MODULE__} )
  end

  def join_game(pid, player) do
    GenServer.cast pid, {:join_game, player}
  end

  def estimate_story(pid, estimate) do
    GenServer.cast pid, { :estimate_story, estimate }
  end

  def list_players(pid) do
    GenServer.call pid, :list_players
  end

  def get_estimate(pid) do
    GenServer.call pid, :get_estimate
  end

  def handle_cast({:estimate_story, estimate}, game) do
    {:noreply, %PlanningPoker.Game{ game | estimates: [ estimate | game.estimates ] } }
  end

  def handle_cast({:join_game, player}, game) do
    { :noreply, %PlanningPoker.Game{ game | players: [ player | game.players ] } }
  end

  def handle_call(:get_estimate, _from, game) do
    { :reply, PlanningPoker.Game.get_estimate(game), game }
  end

  def handle_call(:list_players, _from, game) do
    {:reply, game.players, game}
  end

end
