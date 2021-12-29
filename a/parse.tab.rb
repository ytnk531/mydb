#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.6.0
# from Racc grammar file "".
#

require 'racc/parser.rb'

require_relative 'parse.rex'

class MyParser < Racc::Parser

module_eval(<<'...end parse.y/module_eval...', 'parse.y', 11)

...end parse.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     2,     3,     4,     5,     6 ]

racc_action_check = [
     0,     1,     2,     3,     4 ]

racc_action_pointer = [
    -2,     1,    -1,     3,     2,   nil,   nil ]

racc_action_default = [
    -2,    -2,    -2,    -2,    -2,     7,    -1 ]

racc_goto_table = [
     1 ]

racc_goto_check = [
     1 ]

racc_goto_pointer = [
   nil,     0 ]

racc_goto_default = [
   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  3, 5, :_reduce_1 ]

racc_reduce_n = 2

racc_shift_n = 7

racc_token_table = {
  false => 0,
  :error => 1,
  :NUMBER => 2,
  "+" => 3 }

racc_nt_base = 4

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "NUMBER",
  "\"+\"",
  "$start",
  "stmt" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parse.y', 3)
  def _reduce_1(val, _values, result)
     puts val[0] + val[2]
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class MyParser


MyParser.new.scan_str(gets)