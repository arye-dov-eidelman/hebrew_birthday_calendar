require 'test_helper'

class HebrewDateTest < ActiveSupport::TestCase
  test "contains 420 days (including leap months)" do
    assert HebrewDate.all.size == 420 
  end

  test "contains regular days once" do
    # a bunch of random days
    assert HebrewDate.where(month: 9, day: 2, is_adar_b: nil).size == 1
    assert HebrewDate.where(month: 10, day: 5, is_adar_b: nil).size == 1
    assert HebrewDate.where(month: 2, day: 8, is_adar_b: nil).size == 1
    assert HebrewDate.where(month: 4, day: 19, is_adar_b: nil).size == 1
    assert HebrewDate.where(month: 8, day: 12, is_adar_b: nil).size == 1
    assert HebrewDate.where(month: 11, day: 22, is_adar_b: nil).size == 1
    assert HebrewDate.where(month: 7, day: 27, is_adar_b: nil).size == 1
  end

  test "contains 23 adar once" do
    assert HebrewDate.where(month: 6, day: 23, is_adar_b: nil).size == 1
  end

  test "contains 23 adar alef once" do
    assert HebrewDate.where(month: 6, day: 23, is_adar_b: false).size == 1
  end

  test "contains 23 adar beis once" do
    assert HebrewDate.where(month: 6, day: 23, is_adar_b: true).size == 1
  end

  test "dosn't contain leap months other than adar" do
    assert HebrewDate.where.not(month: 6).where(is_adar_b: true).size == 0
    assert HebrewDate.where.not(month: 6).where(is_adar_b: false).size == 0
  end
end
