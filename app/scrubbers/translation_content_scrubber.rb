class TranslationContentScrubber < Rails::Html::PermitScrubber
  def initialize
    super
    self.tags = %w( strong em b i p code pre tt samp kbd var sub
        sup dfn cite big small address hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr
        acronym a img blockquote del ins table th tr td thead tbody tfoot u )
    self.attributes = %w( href src width height alt cite datetime title class name xml:lang abbr style
        align border cellpadding cellspacing colspan )
  end

  def skip_node?(node)
    node.text?
  end
end
