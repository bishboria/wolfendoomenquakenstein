require "minitest/autorun"

require_relative "../world_position"

def world_position(real_value)
  WorldPosition.new(32).from_real_position(real_value)
end

class CalculatingWorldPositions < MiniTest::Unit::TestCase
  def test_world_position_is_0_for_real_position_0
    assert_equal(world_position(0), 0)
  end

  def test_world_position_is_0_for_real_position_31
    assert_equal(world_position(31), 0)
  end

  def test_world_position_is_1_for_real_position_32
    assert_equal(world_position(32), 1)
  end

  def test_world_position_is_1_for_real_position_63
    assert_equal(world_position(63), 1)
  end

  def test_world_position_is_2_for_real_position_64
    assert_equal(world_position(64), 2)
  end

  def test_world_position_is_2_for_real_position_64_3
    assert_equal(world_position(64.3), 2)
  end
end
