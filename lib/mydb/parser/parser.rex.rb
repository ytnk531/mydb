#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.7
# from lexical definition file "lib/mydb/parser/parser.rex".
#++

require 'racc/parser'
class Mydb::Parser::Parser < Racc::Parser
      require 'strscan'

      class ScanError < StandardError ; end

      attr_reader   :lineno
      attr_reader   :filename
      attr_accessor :state

      def scan_setup(str)
        @ss = StringScanner.new(str)
        @lineno =  1
        @state  = nil
      end

      def action
        yield
      end

      def scan_str(str)
        scan_setup(str)
        do_parse
      end
      alias :scan :scan_str

      def load_file( filename )
        @filename = filename
        File.open(filename, "r") do |f|
          scan_setup(f.read)
        end
      end

      def scan_file( filename )
        load_file(filename)
        do_parse
      end


        def next_token
          return if @ss.eos?

          # skips empty actions
          until token = _next_token or @ss.eos?; end
          token
        end

        def _next_token
          text = @ss.peek(1)
          @lineno  +=  1  if text == "\n"
          token = case @state
            when nil
          case
                  when (text = @ss.scan(/\s+/i))
                    ;

                  when (text = @ss.scan(/;/i))
                     action { [:SEMICOLON, text] }

                  when (text = @ss.scan(/CREATE/i))
                     action { [:CREATE, text] }

                  when (text = @ss.scan(/TABLE/i))
                     action { [:TABLE, text] }

                  when (text = @ss.scan(/INSERT/i))
                     action { [:INSERT, text] }

                  when (text = @ss.scan(/SELECT/i))
                     action { [:SELECT, text] }

                  when (text = @ss.scan(/FROM/i))
                     action { [:FROM, text] }

                  when (text = @ss.scan(/VALUES/i))
                     action { [:VALUES, text] }

                  when (text = @ss.scan(/VALUE/i))
                     action { [:VALUE, text] }

                  when (text = @ss.scan(/WHERE/i))
                     action { [:WHERE, text] }

                  when (text = @ss.scan(/=/i))
                     action { [:EQUAL, text] }

                  when (text = @ss.scan(/\(/i))
                     action { [:LEFT_PAREN, text] }

                  when (text = @ss.scan(/\)/i))
                     action { [:RIGHT_PAREN, text] }

                  when (text = @ss.scan(/\*/i))
                     action { [:STAR, text] }

                  when (text = @ss.scan(/,/i))
                     action { [:COMMA, text] }

                  when (text = @ss.scan(/'/i))
                     action { [:SINGLE_QUATE, text] }

                  when (text = @ss.scan(/\w+/i))
                     action { [:IDENT, text] }

          
          else
            text = @ss.string[@ss.pos .. -1]
            raise  ScanError, "can not match: '" + text + "'"
          end  # if

        else
          raise  ScanError, "undefined state: '" + state.to_s + "'"
        end  # case state
          token
        end  # def _next_token

end # class
