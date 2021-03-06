#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.6.0
# from Racc grammar file "".
#

require 'racc/parser.rb'
module Mydb
  module Parser
    class Parser < Racc::Parser
##### State transition tables begin ###

racc_action_table = [
     6,    50,    50,    50,    30,    31,     7,    16,    51,    51,
    51,     8,    13,    41,    22,    42,    43,    56,    57,     9,
    10,    11,    18,    19,    18,    21,    22,    24,    26,    18,
    16,    16,    16,    37,    40,    16,    16,    47,    16,    53,
    54,    40,    58,    59,    62,    63 ]

racc_action_check = [
     0,    40,    54,    57,    23,    23,     0,     7,    40,    54,
    57,     0,     7,    32,    32,    33,    33,    48,    48,     1,
     2,     6,     8,     9,    11,    12,    14,    17,    20,    21,
    22,    24,    26,    27,    29,    35,    37,    38,    43,    45,
    46,    47,    51,    53,    58,    59 ]

racc_action_pointer = [
    -3,    19,    18,   nil,   nil,   nil,    17,    -1,    14,    23,
   nil,    16,    15,   nil,    19,   nil,   nil,    22,   nil,   nil,
    23,    21,    22,   -12,    23,   nil,    24,    22,   nil,    29,
   nil,   nil,     7,     9,   nil,    27,   nil,    28,    30,   nil,
    -7,   nil,   nil,    30,   nil,    34,    28,    36,    11,   nil,
   nil,    34,   nil,    35,    -6,   nil,   nil,    -5,    29,    39,
   nil,   nil,   nil,   nil ]

racc_action_default = [
   -32,   -32,   -32,    -2,    -3,    -4,   -32,   -32,   -32,   -32,
    -1,   -32,   -32,   -15,   -16,   -28,   -30,   -32,   -31,    64,
   -32,   -32,   -32,   -32,   -32,    -5,   -32,   -12,   -29,   -32,
   -25,   -26,   -32,   -32,    -7,   -32,   -13,   -32,   -17,   -18,
   -32,   -27,    -6,   -32,    -9,   -10,   -32,   -32,   -32,   -21,
   -23,   -32,    -8,   -32,   -32,   -19,   -20,   -32,   -32,   -32,
   -14,   -22,   -24,   -11 ]

racc_goto_table = [
    28,    39,     1,    34,    35,     2,    14,     3,    49,     4,
     5,    17,    25,    45,    20,    46,    33,    44,    12,    55,
    52,    35,    60,    32,    27,    61,    36,    23,    29,    38,
    48 ]

racc_goto_check = [
    10,    19,     1,     9,    10,     2,    15,     3,    14,     4,
     5,     6,     7,    10,     6,    10,     8,    11,    12,    19,
     9,    10,    14,    15,     6,    14,    13,    16,    17,    18,
    20 ]

racc_goto_pointer = [
   nil,     2,     5,     7,     9,    10,     3,    -8,   -10,   -23,
   -22,   -18,    11,    -1,   -32,    -1,    10,     5,     0,   -28,
   -10 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    15,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  2, 19, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  1, 20, :_reduce_none,
  4, 21, :_reduce_5,
  3, 25, :_reduce_6,
  1, 26, :_reduce_7,
  3, 26, :_reduce_8,
  2, 27, :_reduce_none,
  1, 29, :_reduce_none,
  4, 29, :_reduce_none,
  4, 23, :_reduce_12,
  5, 23, :_reduce_13,
  4, 31, :_reduce_14,
  1, 30, :_reduce_none,
  1, 30, :_reduce_none,
  5, 22, :_reduce_17,
  1, 36, :_reduce_18,
  3, 36, :_reduce_19,
  3, 37, :_reduce_20,
  1, 38, :_reduce_21,
  3, 38, :_reduce_22,
  1, 32, :_reduce_none,
  3, 32, :_reduce_24,
  1, 35, :_reduce_none,
  1, 35, :_reduce_none,
  3, 34, :_reduce_27,
  1, 33, :_reduce_28,
  3, 33, :_reduce_29,
  1, 28, :_reduce_none,
  1, 24, :_reduce_none ]

racc_reduce_n = 32

racc_shift_n = 64

racc_token_table = {
  false => 0,
  :error => 1,
  :SEMICOLON => 2,
  :CREATE => 3,
  :TABLE => 4,
  :LEFT_PAREN => 5,
  :RIGHT_PAREN => 6,
  :COMMA => 7,
  :IDENT => 8,
  :SELECT => 9,
  :FROM => 10,
  :WHERE => 11,
  :EQUAL => 12,
  :STAR => 13,
  :INSERT => 14,
  :SINGLE_QUATE => 15,
  :VALUE => 16,
  :VALUES => 17 }

racc_nt_base = 18

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
  "SEMICOLON",
  "CREATE",
  "TABLE",
  "LEFT_PAREN",
  "RIGHT_PAREN",
  "COMMA",
  "IDENT",
  "SELECT",
  "FROM",
  "WHERE",
  "EQUAL",
  "STAR",
  "INSERT",
  "SINGLE_QUATE",
  "VALUE",
  "VALUES",
  "$start",
  "query",
  "statement",
  "create_table",
  "insert",
  "select",
  "tbl_name",
  "create_definition_list",
  "comma_separated_create_definition",
  "create_definition",
  "col_name",
  "column_definition",
  "select_target",
  "where_statement",
  "column_value",
  "comma_separated_col_names",
  "col_name_list",
  "values",
  "value_list_list",
  "value_list_paren",
  "value_list" ]

Racc_debug_parser = true

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

module_eval(<<'.,.,', 'parser.y', 8)
  def _reduce_5(val, _values, result)
     result = Mydb::CreateCommand.new(val[2], val[3])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 11)
  def _reduce_6(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 14)
  def _reduce_7(val, _values, result)
     result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 15)
  def _reduce_8(val, _values, result)
     result = val[0].append(val[2])
    result
  end
.,.,

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

module_eval(<<'.,.,', 'parser.y', 23)
  def _reduce_12(val, _values, result)
     result = Mydb::SelectCommand.new(val[3], val[1])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 24)
  def _reduce_13(val, _values, result)
     result = Mydb::SelectCommand.new(val[3], val[1], val[4])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 26)
  def _reduce_14(val, _values, result)
     result = Mydb::WhereStatement.new(val[1], val[3])
    result
  end
.,.,

# reduce 15 omitted

# reduce 16 omitted

module_eval(<<'.,.,', 'parser.y', 31)
  def _reduce_17(val, _values, result)
     result = Mydb::InsertCommand.new(val[1], val[2], val[4])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 33)
  def _reduce_18(val, _values, result)
     result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 34)
  def _reduce_19(val, _values, result)
     result = val[0].append(val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 36)
  def _reduce_20(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 38)
  def _reduce_21(val, _values, result)
     result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 39)
  def _reduce_22(val, _values, result)
     result = val[0].append(val[2])
    result
  end
.,.,

# reduce 23 omitted

module_eval(<<'.,.,', 'parser.y', 42)
  def _reduce_24(val, _values, result)
     result = val[1]
    result
  end
.,.,

# reduce 25 omitted

# reduce 26 omitted

module_eval(<<'.,.,', 'parser.y', 47)
  def _reduce_27(val, _values, result)
     result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 49)
  def _reduce_28(val, _values, result)
     result = val
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 50)
  def _reduce_29(val, _values, result)
     result = val[0].append(val[2])
    result
  end
.,.,

# reduce 30 omitted

# reduce 31 omitted

def _reduce_none(val, _values, result)
  val[0]
end

    end   # class Parser
  end   # module Parser
end   # module Mydb

require_relative './parser.rex'

# INSERT customer (id, name) VALUE (10, 'aaa');
# SELECT * FROM customer;
