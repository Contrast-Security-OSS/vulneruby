# frozen_string_literal: true

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to XPath Injection
    class XpathInjection
      # @param xpath [String] string to inject into html
      def self.run_nokogiri xpath
        doc = Nokogiri::HTML::DocumentFragment.parse <<-EOHTML
              <body>
                <h1>dont attack me</h1>
              </body>
        EOHTML
        h1 = doc.at_css 'h1'
        h1['class'] = xpath
        doc.to_s
      rescue StandardError => e
        'Error with xpath injection'
      end
    end
  end
end
