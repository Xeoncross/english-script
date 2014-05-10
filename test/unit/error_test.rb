#!/usr/bin/env ruby
$use_tree=false
$verbose=false
# $verbose=true
require_relative '../parser_test_helper'

class ErrorTest < Test::Unit::TestCase #< ParserBaseTest <  EnglishParser

  include ParserTestHelper

  def test_type
    parse "x=1,2,y;" # at:3y= in:list type:unknownVariable:y
  end

  def test_type3
    assert_has_error "x be 1,2,3y= class of x"   # at:3y= in:list
  end

  def test_map
    assert_has_error("square 1,2 andy 3")   # at:andy in:list
  end

end