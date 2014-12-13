require 'test_helper'

class TranslationTest < ActiveSupport::TestCase
  test "should not save translation without title" do
    translation = Translation.new(content: 'This is some content')
    assert_not translation.save
  end

  test "should not save translation without content" do
    translation = Translation.new(title: 'Translation title')
    assert_not translation.save
  end

  test "should not save translation with duplicate title" do
    translation = Translation.new(
        title: translations(:one).title,
        content: 'This is some content'
    )
    assert_not translation.save
  end

  test "should save correct translation" do
    translation = Translation.new(
        title: 'A unique title',
        content: 'Some content'
    )
    assert translation.save
  end

  test "should have correct original url" do
    first = Translation.first
    assert_equal "https://projecteuler.net/problem=#{first.id}", first.original_url
  end
end
