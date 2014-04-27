require 'nokogiri'

module Ragadjust

  class Adjust

    # Rag-adjust the content. Based on Nathan Ford's ragadjust JS
    # https://github.com/nathanford/ragadjust
    def self.ragadjust_content(text_to_adjust, selector = 'p, li, dd, figcaption', method = 'all')
      html = Nokogiri::HTML(text_to_adjust) # Not using .fragment() as .search() doesn't seem to work?

      preps = /(?<=\s|^|;)((aboard|about|above|across|after|against|along|amid|among|anti|around|before|behind|below|beneath|beside|besides|between|beyond|concerning|considering|despite|down|during|except|excepting|excluding|following|from|inside|into|like|minus|near|onto|opposite|outside|over|past|plus|regarding|round|save|since|than|that|this|through|toward|towards|under|underneath|unlike|until|upon|versus|with|within|without)\s)+/i
          
      smallwords = /(?<=\s|^|;)\b(([[:word:]]{1,2})\b\s)/i
      
      dashes = /([-–—])\s/i

    
      elements = html.css(selector)

      elements.search('//text()').each do |node|

        if node.text?
          content = node.content

          puts "Got content: #{content}"
          puts "Got parent: #{node.parent}"
          puts "Got parent inner_html: #{node.parent.inner_html}"

          # prepositions
          if %w{prepositions all}.include? method
            # content = content.gsub preps, '\2&nbsp;'
            content = content.gsub preps, '\2'+nbsp
            puts "Content after preps: #{content}"
          end

          # small words
          if %w{small-words all}.include? method
            # content = content.gsub smallwords, '\2&nbsp;'
            content = content.gsub smallwords, '\2'+nbsp
            puts "Content after small words: #{content}"
          end

          # dashes
          if %w{dashes all}.include? method
            # content = content.gsub dashes, '\1&nbsp;'
            content = content.gsub dashes, '\1'+nbsp
            puts "Content after dashes: #{content}"
          end

          node.content = content
          # puts "Setting inner_html to: #{content}"
          # node.parent.inner_html = content
          # puts "Node parent inner_html = #{node.parent.inner_html}"
          # dummy = node.add_previous_sibling(Nokogiri::XML::Node.new('dummy', html))
          # new_node = Nokogiri::XML::Text.new('', html)
          # new_node.inner_html = content

          # dummy.add_previous_sibling(new_node)
          # node.remove
          # dummy.remove
        end

      end

      # emphasized text
      # if %w{emphasis all}.include? method
      #   puts "Checking emphasised content..."
      #   elements.css('strong,em,b,i').each do |el|
      #     # Only emphasized phrases of 2/3 words
      #     s = el.content.split.size
      #     if s > 1 && s < 4
      #       # Get text nodes
      #       el.search('//text()').each do |n|
      #         if n.text?
      #           Ragadjust::Adjust.text_node_replace n, /\s+/, '&nbsp;'
      #         end
      #       end
      #     end
      #   end # elements.css().each
      # end

      html.css('body').inner_html

    end # def self.ragadjust_content

    def self.nbsp
      ' '
    end


  end

end
