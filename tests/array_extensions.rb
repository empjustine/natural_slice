#!/usr/bin/env ruby

require './lib/array_extensions'
require 'test/unit'


class TestArrayClassExtensions < Test::Unit::TestCase

  def test_natural_slice_single_integer

    assert_equal [0], Array.natural_slice('0')
    assert_equal [5], Array.natural_slice('5')
  end

  def test_natural_slice_many_integers

    assert_equal [0, 0, 0],  Array.natural_slice('0,0,0')
    assert_equal [1, -1, 9], Array.natural_slice('1,-1,9')
  end

  def test_natural_slice_integer_ranges

    assert_equal [0..3, -30],    Array.natural_slice('0-3,-30')
    assert_equal [1, -1..-5, 9], Array.natural_slice('1,-1--5,9')
  end
end


class TestArrayExtension < Test::Unit::TestCase

  A = (0..50).to_a

  def test_natural_slice_single_integer

    assert_equal [0], A.dup.natural_slice('0')
    assert_equal [5], A.dup.natural_slice('5')
  end

  def test_natural_slice_many_integers

    assert_equal [0, 0, 0],  A.dup.natural_slice('0,0,0')
    assert_equal [1, 50, 9], A.dup.natural_slice('1,-1,9')
  end

  def test_natural_slice_integer_ranges

    assert_equal [0, 1, 2, 3, 21],   A.dup.natural_slice('0-3,-30')
    assert_equal [1, 50, 49, 48, 9], A.dup.natural_slice('1,-1--3,9')
  end
end
