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
        title: translations(:translation_one).title,
        content: 'This is some content',
        problem_id: 3
    )
    assert_not translation.save
  end

  test "should save translation with duplicate title of translation for same problem" do
    translation = Translation.new(
        title: translations(:translation_one).title,
        content: 'This is some content',
        problem_id: 1
    )
    assert translation.save
  end

  test "should save correct translation" do
    translation = Translation.new(
        title: 'A unique title',
        content: 'Some content',
        problem_id: 1
    )
    assert translation.save
  end
end
