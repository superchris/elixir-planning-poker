defmodule GameTest do
  use ExUnit.Case

  test "agreed?" do
    estimates = [{:bob, 1}, {:ted, 1}]
    game = %PlanningPoker.Game{players: [:bob, :ted], estimates: estimates}
    assert PlanningPoker.Game.agreed?(game)
  end

  test "agreed? with disagreement" do
    estimates = [{:bob, 1}, {:ted, 1}, {:joe, 2}]
    game = %PlanningPoker.Game{players: [:bob, :ted], estimates: estimates}
    assert !PlanningPoker.Game.agreed?(game)
  end

  test "get_estimate when agreed" do
    estimates = [{:bob, 1}, {:ted, 1}]
    game = %PlanningPoker.Game{players: [:bob, :ted], estimates: estimates}
    assert PlanningPoker.Game.get_estimate(game) == 1
  end

  test "estimated? when not all estimates are in" do
    estimates = [{:bob, 1}]
    game = %PlanningPoker.Game{players: [:bob, :ted], estimates: estimates}
    assert !PlanningPoker.Game.estimated?(game)
  end

  test "estimated? when all estimates are in" do
    estimates = [{:bob, 1}, {:ted, 1}]
    game = %PlanningPoker.Game{players: [:bob, :ted], estimates: estimates}
    assert PlanningPoker.Game.estimated?(game)
  end

end
