# frozen_string_literal: true

require 'nokogiri'

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to XXE.
    class Xxe
      TEST_XML = '<!DOCTYPE doc [ '\
                '<!ENTITY ent SYSTEM "file:///tmp/marker"> '\
                '<!ENTITY ent2 SYSTEM "http://www.google.com/marker"> '\
                "]>\n"\
             "<root>\n"\
                "<element>&ent;</element>\n"\
                "<element>&ent2;</element>\n"\
            "</root>\n"
      private_constant :TEST_XML

      def self.substitute_library library_name
        TEST_XML.gsub('ent', library_name)
      end

      # Run the Nokogiri::XML::Document#parse method
      def self.run_nokogiri
        doc = Nokogiri::XML::Document.new
        doc.parse(substitute_library('nokogiri'))
      rescue StandardError => e
        puts "Unable to parse Nokogiri w/ Document: #{ e.message }"
      end
    end
  end
end
